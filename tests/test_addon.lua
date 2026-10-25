-- Regressionstests für Struktur und vereinbarte Verhaltensregeln.
-- Aufruf aus PaladinRP: lua tests/test_addon.lua
-- Unterstützt Lua 5.1 und 5.4; benötigt weder WoW noch weitere AddOns.
local scriptPath = (arg and arg[0] or "tests/test_addon.lua"):gsub("\\", "/")
local root = scriptPath:match("^(.*)tests/test_addon%.lua$") or "./"

local function equal(actual, expected, label)
    assert(actual == expected, (label or "Wert") .. ": erwartet " ..
        tostring(expected) .. ", erhalten " .. tostring(actual))
end

local function loadInEnvironment(path, environment)
    local chunk, err
    if setfenv then
        chunk, err = loadfile(path)
        assert(chunk, err)
        setfenv(chunk, environment)
    else
        chunk, err = loadfile(path, "t", environment)
        assert(chunk, err)
    end
    return chunk
end

local function newAddon(savedDatabase)
    local state = {
        now = 100,
        race = "Human",
        class = "PALADIN",
        target = "Anduin",
        instance = false,
        raid = false,
        party = false,
        roll = 1,
        messages = {},
        sent = {},
        frames = {},
        loaded = {},
        languages = { { "Gemeinsprache", 7 }, { "Zwergisch", 6 } },
    }
    -- Kein Fallback auf Host-Globals: auch ein bereits im Testprozess
    -- geladenes AddOn darf weder API noch DB in diesen Loader hineintragen.
    local environment = {
        assert = assert,
        error = error,
        ipairs = ipairs,
        next = next,
        pairs = pairs,
        pcall = pcall,
        select = select,
        string = string,
        table = table,
        tonumber = tonumber,
        tostring = tostring,
        type = type,
    }
    environment._G = environment
    environment.PaladinRP_CharacterDB = savedDatabase
    environment.SlashCmdList = {}
    environment.LE_PARTY_CATEGORY_INSTANCE = 2
    -- Eine fremde Einstellung darf weder gelesen noch überschrieben werden.
    local foreignSettings = { textChance = 99, cooldown = 99, chatChannel = "RAID" }
    environment.RPChatMod_Settings = foreignSettings
    environment.math = {}
    for key, value in pairs(math) do
        environment.math[key] = value
    end
    environment.math.random = function(limit)
        if limit == 100 then
            return state.roll
        end
        return 1
    end
    environment.print = function(message)
        state.messages[#state.messages + 1] = message
    end
    environment.GetTime = function() return state.now end
    environment.UnitRace = function() return state.race, state.race end
    environment.UnitClass = function() return state.class, state.class end
    environment.UnitExists = function() return state.target ~= nil end
    environment.UnitName = function() return state.target end
    environment.GetNumLanguages = function() return #state.languages end
    environment.GetLanguageByIndex = function(index)
        return state.languages[index][1], state.languages[index][2]
    end
    environment.IsInGroup = function(category)
        if category == environment.LE_PARTY_CATEGORY_INSTANCE then
            return state.instance
        end
        return state.party
    end
    environment.IsInRaid = function() return state.raid end
    environment.C_ChatInfo = {
        SendChatMessage = function(text, channel, language)
            state.sent[#state.sent + 1] = {
                text = text, channel = channel, language = language,
            }
        end,
    }
    environment.CreateFrame = function()
        local frame = { events = {}, scripts = {} }
        function frame:RegisterEvent(event) self.events[event] = true end
        function frame:SetScript(event, callback) self.scripts[event] = callback end
        state.frames[#state.frames + 1] = frame
        return frame
    end

    local namespace = {}
    local toc = assert(io.open(root .. "PaladinRP.toc", "r"))
    for line in toc:lines() do
        line = line:match("^%s*(.-)%s*$")
        if line ~= "" and line:sub(1, 1) ~= "#" then
            local path = line:gsub("\\", "/")
            state.loaded[#state.loaded + 1] = path
            loadInEnvironment(root .. path, environment)("PaladinRP", namespace)
        end
    end
    toc:close()
    equal(environment.RPChatMod_Settings, foreignSettings, "Fremde Einstellungen")

    function state.login()
        for _, frame in ipairs(state.frames) do
            if frame.events.PLAYER_LOGIN then
                frame.scripts.OnEvent(frame, "PLAYER_LOGIN")
            end
        end
    end
    function state.command(message)
        environment.SlashCmdList.PALADINRP(message)
    end
    return environment, namespace, state
end

local tests = {}
local function test(name, callback)
    tests[#tests + 1] = { name = name, callback = callback }
end

test("TOC und privater Namespace", function()
    local env, app, state = newAddon()
    equal(state.loaded[1], "config/Settings.lua")
    equal(state.loaded[#state.loaded], "PaladinRP.lua")
    for _, path in ipairs(state.loaded) do
        assert(path ~= "ui/Settings.lua", "UI-Platzhalter wird geladen")
        assert(not path:match("^tests/"), "Tests werden im Client geladen")
    end
    equal(app.defaults.textChance, 30)
    equal(app.defaults.cooldown, 20)
    equal(app.defaults.chatChannel, "SAY")
    for _, key in ipairs({
        "Blessings", "GreaterBlessings", "Auras", "Seals", "Abilities", "Racial",
    }) do
        equal(type(app[key]), "table", key)
        equal(rawget(env, "PaladinRP_" .. key), nil, "Kein Datenglobal")
    end
    equal(type(env._G.PaladinRP.TryText), "function", "Öffentliche API")
    equal(env.SLASH_PALADINRP1, "/prp")
end)

test("Login initialisiert Defaults und meldet sich", function()
    local env, _, state = newAddon()
    equal(rawget(env, "PaladinRP_CharacterDB"), nil)
    state.login()
    equal(env.PaladinRP_CharacterDB.textChance, 30)
    equal(env.PaladinRP_CharacterDB.cooldown, 20)
    equal(env.PaladinRP_CharacterDB.chatChannel, "SAY")
    equal(type(env.PaladinRP_CharacterDB.personalTexts), "table")
    equal(state.messages[1],
        "|cffc79c6ePaladin RP|r geladen. Befehl: |cffffd100/prp|r")
end)

test("Gespeicherte Daten und persönliche Texte bleiben erhalten", function()
    local texts = { HAMMER = { "Eigener Text" } }
    local db = { textChance = 0, cooldown = 3600, chatChannel = "PARTY",
        personalTexts = texts, additionalKey = "behalten" }
    local env, _, state = newAddon(db)
    state.login()
    equal(env.PaladinRP_CharacterDB, db)
    equal(db.textChance, 0)
    equal(db.cooldown, 3600)
    equal(db.chatChannel, "PARTY")
    equal(db.personalTexts, texts)
    equal(db.additionalKey, "behalten")
    state.login()
    equal(db.personalTexts, texts, "Erneuter Login")
end)

test("Nur fehlende Felder erhalten Defaults", function()
    local env, _, state = newAddon({ cooldown = 5 })
    state.login()
    equal(env.PaladinRP_CharacterDB.cooldown, 5)
    equal(env.PaladinRP_CharacterDB.textChance, 30)
    equal(env.PaladinRP_CharacterDB.chatChannel, "SAY")
end)

test("Poolpriorität: persönlich vor GREATER_ vor Rasse", function()
    local env, app, state = newAddon()
    state.login()
    local personal = { "Persönlich" }
    env.PaladinRP_CharacterDB.personalTexts.GREATER_MIGHT = personal
    app.Racial.Human.GREATER_MIGHT = { "Rasse" }
    equal(app.GetTextPool("GREATER_MIGHT"), personal)
    env.PaladinRP_CharacterDB.personalTexts.GREATER_MIGHT = nil
    equal(app.GetTextPool("GREATER_MIGHT"), app.GreaterBlessings.MIGHT)
    equal(app.GetTextPool("MIGHT"), app.Racial.Human.MIGHT)
end)

test("Poolpriorität: allgemeine Daten und Namenskollisionen", function()
    local _, app, state = newAddon()
    state.login()
    state.race = "Draenei"
    equal(app.GetTextPool("WISDOM"), app.Blessings.WISDOM)
    equal(app.GetTextPool("KINGS"), app.GreaterBlessings.KINGS)
    equal(app.GetTextPool("DEVOTION"), app.Auras.DEVOTION)
    equal(app.GetTextPool("COMMAND"), app.Seals.COMMAND)
    equal(app.GetTextPool("HAMMER"), app.Abilities.HAMMER)
    equal(app.GetTextPool("UNKNOWN"), nil)
    app.Blessings.COLLISION = { "Segen" }
    app.GreaterBlessings.COLLISION = { "Großer Segen" }
    app.Auras.COLLISION = { "Aura" }
    app.Seals.COLLISION = { "Siegel" }
    app.Abilities.COLLISION = { "Fähigkeit" }
    for _, key in ipairs({ "Blessings", "GreaterBlessings", "Auras", "Seals",
        "Abilities" }) do
        equal(app.GetTextPool("COLLISION"), app[key].COLLISION, key)
        app[key].COLLISION = nil
    end
end)

test("Bestehende Daten und Ziel-/Gruppentexte", function()
    local _, app, state = newAddon()
    state.login()
    equal(app.BuildRPText("MIGHT"), "Das Licht gebe Euch Macht und Stärke, Anduin.")
    state.race = "Draenei"
    equal(app.BuildRPText("GREATER_MIGHT"),
        "Das Licht gebe Euren Reihen Macht und Stärke.")
    state.target = nil
    equal(app.BuildRPText("MIGHT"), "Das Licht gebe Euch Macht und Stärke.")
    equal(app.BuildRPText("GREATER_MIGHT"), "Das Licht gebe uns Macht und Stärke.")
    equal(app.BuildRPText("HAMMER"), "Das Licht richtet.")
    equal(app.BuildRPText("UNKNOWN"), nil)
end)

test("Persönliche Textstrukturen und leere Pools", function()
    local env, app, state = newAddon()
    state.login()
    local texts = env.PaladinRP_CharacterDB.personalTexts
    texts.TEST = { "Hallo %s" }
    equal(app.BuildRPText("TEST"), "Hallo Anduin")
    texts.TEST = { ziel = { "Ziel %s" }, gruppe = { "Gruppe" } }
    equal(app.BuildRPText("TEST"), "Ziel Anduin")
    state.target = nil
    equal(app.BuildRPText("TEST"), "Gruppe")
    texts.TEST = {}
    equal(app.BuildRPText("TEST"), nil)
end)

test("AUTO priorisiert Instanz, Raid, Gruppe, SAY", function()
    local env, app, state = newAddon()
    state.login()
    env.PaladinRP_CharacterDB.chatChannel = "AUTO"
    state.instance, state.raid, state.party = true, true, true
    equal(app.GetChatChannel(), "INSTANCE_CHAT")
    state.instance = false
    equal(app.GetChatChannel(), "RAID")
    state.raid = false
    equal(app.GetChatChannel(), "PARTY")
    state.party = false
    equal(app.GetChatChannel(), "SAY")
    env.PaladinRP_CharacterDB.chatChannel = "SAY"
    state.raid, state.party = true, true
    equal(app.GetChatChannel(), "SAY", "Expliziter Standardkanal")
end)

test("Bestehende Volkssprache und Chat-API", function()
    local env, app, state = newAddon()
    state.login()
    equal(app.SendRPText(nil), false)
    equal(#state.sent, 0)
    equal(app.SendRPText("Test"), true)
    equal(state.sent[1].text, "Test")
    equal(state.sent[1].channel, "SAY")
    equal(state.sent[1].language, 7)
    state.race = "Dwarf"
    app.SendRPText("Zwerg")
    equal(state.sent[2].language, 6)
    env.PaladinRP_CharacterDB.chatChannel = "PARTY"
    state.party = true
    app.SendRPText("Gruppe")
    equal(state.sent[3].language, nil)
end)

test("Markierte Handlungen werden als /me gesendet", function()
    local env, app, state = newAddon()
    state.login()
    env.PaladinRP_CharacterDB.chatChannel = "PARTY"
    env.PaladinRP_CharacterDB.textChance = 100
    env.PaladinRP_CharacterDB.cooldown = 0
    env.PaladinRP_CharacterDB.personalTexts.TEST_EMOTE = {
        "*   hebt die Hand.   *",
    }

    equal(env.PaladinRP.TryText("TEST_EMOTE"), true)
    equal(state.sent[1].text, "hebt die Hand.")
    equal(state.sent[1].channel, "EMOTE")
    equal(state.sent[1].language, nil)

    local sentCount = #state.sent
    equal(app.SendRPText("*unvollstaendig"), false)
    equal(app.SendRPText("**"), false)
    equal(#state.sent, sentCount)
end)

test("Deutsches Zusatzlexikon bleibt additiv und gültig", function()
    local _, app, state = newAddon()
    state.login()

    local shieldPool = app.localeData.deDE.Abilities.DIVINE_SHIELD.gruppe
    local shieldEmote = shieldPool[#shieldPool]
    equal(shieldEmote:sub(1, 1), "*")
    equal(shieldEmote:sub(-1), "*")
    equal(app.SendRPText(shieldEmote), true)
    equal(state.sent[1].text, shieldEmote:sub(2, -2))
    equal(state.sent[1].channel, "EMOTE")

    local generic = app.localeData.deDE.ambient.VIGIL
    local human = app.localeData.deDE.ambientRacial.Human.VIGIL
    equal(#human, #generic + 2)
    for index, phrase in ipairs(generic) do
        equal(human[index], phrase, "Allgemeiner Wachtext")
    end
    state.race = "Human"
    equal(app.BuildAmbient("VIGIL"), generic[1])

    local oath = app.localeData.deDE.ambient.OATH
    equal(oath[#oath - 3], "Mein Schild soll zuerst denen Schutz bieten, die hinter ihm Zuflucht suchen.")
end)

test("Chance und Cooldown nach erfolgreichem Versand", function()
    local env, app, state = newAddon()
    state.login()
    local db = env.PaladinRP_CharacterDB
    db.textChance = 0
    env.PaladinRP.TryText("hammer")
    equal(#state.sent, 0)
    db.textChance = 30
    state.roll = 31
    env.PaladinRP.TryText("hammer")
    equal(#state.sent, 0)
    state.roll = 30
    equal(env.PaladinRP.TryText("hammer"), true, "Erfolgreicher API-Aufruf")
    equal(#state.sent, 1)
    equal(app.GetRemainingCooldown(), 20)
    env.PaladinRP.TryText("hammer")
    equal(#state.sent, 1)
    state.now = 119
    equal(app.GetRemainingCooldown(), 1)
    state.now = 120
    env.PaladinRP.TryText("hammer")
    equal(#state.sent, 2)
end)

test("Fehlender Text startet keinen Cooldown", function()
    local env, app, state = newAddon()
    state.login()
    env.PaladinRP_CharacterDB.textChance = 100
    env.PaladinRP.TryText("unbekannt")
    equal(#state.sent, 0)
    equal(app.IsCooldownReady(), true)
    equal(state.messages[#state.messages],
        "|cffff0000Paladin RP:|r Kein Text für UNBEKANNT vorhanden.")
    env.PaladinRP.TryText("hammer")
    equal(#state.sent, 1)
    env.PaladinRP.TryText("")
    equal(#state.sent, 1)
end)

test("Bisherige Slash-Befehle und Kanalabfrage", function()
    local env, _, state = newAddon()
    state.login()
    state.command("")
    equal(state.messages[#state.messages],
        "/prp channel [SAY|PARTY|RAID|INSTANCE_CHAT|AUTO]")
    state.command(" ChAnCe 55 ")
    equal(env.PaladinRP_CharacterDB.textChance, 55)
    state.command("cooldown 8")
    equal(env.PaladinRP_CharacterDB.cooldown, 8)
    state.command("channel auto")
    equal(env.PaladinRP_CharacterDB.chatChannel, "AUTO")
    state.command("channel")
    assert(state.messages[#state.messages]:find("Aktueller Chatkanal: AUTO", 1, true))
    state.command("channel UNKNOWN")
    equal(env.PaladinRP_CharacterDB.chatChannel, "AUTO")
    state.command("chance")
    equal(state.messages[#state.messages], "Benutzung: /prp chance <ganze Zahl 0-100>")
    state.command("cooldown")
    equal(state.messages[#state.messages], "Benutzung: /prp cooldown <ganze Zahl 0-3600>")
    state.command("chance 100")
    state.command("hammer")
    equal(#state.sent, 1)
end)

test("Mock-Umgebungen teilen weder DB noch Runtime-Zustand", function()
    local envA, appA, stateA = newAddon()
    local envB, appB, stateB = newAddon()
    stateA.login()
    stateB.login()
    assert(appA ~= appB)
    assert(appA.Blessings ~= appB.Blessings)
    assert(envA.PaladinRP_CharacterDB ~= envB.PaladinRP_CharacterDB)
    envA.PaladinRP_CharacterDB.textChance = 100
    envA.PaladinRP.TryText("hammer")
    equal(appA.IsCooldownReady(), false)
    equal(appB.IsCooldownReady(), true)
    equal(#stateB.sent, 0)
    equal(envB.PaladinRP_CharacterDB.textChance, 30)
end)

test("Vor Login sicher, erster Text sofort, Klassenbeschränkung", function()
    local env, app, state = newAddon({ textChance = 100, cooldown = 20 })
    state.now = 0
    equal(env.PaladinRP.TryText("HAMMER"), false)
    state.command("chance 5")
    equal(env.PaladinRP_CharacterDB.textChance, 100)
    state.login()
    equal(app.GetRemainingCooldown(), 0)
    equal(env.PaladinRP.TryText("HAMMER"), true)
    equal(app.GetRemainingCooldown(), 20)
    local other, _, otherState = newAddon()
    otherState.class = "DRUID"
    otherState.login()
    otherState.command("chance 100")
    equal(other.PaladinRP_CharacterDB.textChance, 100)
    equal(other.PaladinRP.TryText("HAMMER"), false)
    equal(#otherState.sent, 0)
end)

test("Strikte Zahlenprüfung und neue Hilfebefehle", function()
    local env, _, state = newAddon()
    state.login()
    state.command("chance 100")
    state.command("cooldown 0")
    for _, argument in ipairs({ "-1", "101", "3x", "1.5", "1e2", "+30", "30 extra" }) do
        state.command("chance " .. argument)
        equal(env.PaladinRP_CharacterDB.textChance, 100)
    end
    for _, argument in ipairs({ "-1", "3601", "3x", "1.5", "1e2", "30 extra" }) do
        state.command("cooldown " .. argument)
        equal(env.PaladinRP_CharacterDB.cooldown, 0)
    end
    state.command("cooldown 3600")
    equal(env.PaladinRP_CharacterDB.cooldown, 3600)
    state.command("help")
    state.command("list")
    state.command("status")
    assert(state.messages[#state.messages]:find("3600", 1, true))
    state.command("HAMMER extra")
    equal(#state.sent, 0)
end)

test("Beschädigte Daten reparieren und AUTO erhalten", function()
    local env, _, state = newAddon({
        textChance = 1.5, cooldown = "bad", chatChannel = "WHISPER", personalTexts = false,
    })
    state.login()
    equal(env.PaladinRP_CharacterDB.textChance, 30)
    equal(env.PaladinRP_CharacterDB.cooldown, 20)
    equal(env.PaladinRP_CharacterDB.chatChannel, "SAY")
    equal(type(env.PaladinRP_CharacterDB.personalTexts), "table")
    assert(#state.messages >= 5, "Reparaturen werden gemeldet")
    local repaired, _, repairedState = newAddon("bad database")
    repairedState.login()
    equal(type(repaired.PaladinRP_CharacterDB), "table")
    local saved, _, savedState = newAddon({ chatChannel = "AUTO" })
    savedState.login()
    equal(saved.PaladinRP_CharacterDB.chatChannel, "AUTO")
end)

test("Textgrenzen, sichere Ersetzung, Race-Normalisierung und Chatfehler", function()
    local env, app, state = newAddon({ textChance = 100, cooldown = 0 })
    state.login()
    state.target = "Ziel%1"
    local texts = env.PaladinRP_CharacterDB.personalTexts
    texts.TEST = { "100% für %s." }
    equal(env.PaladinRP.TryText("TEST"), true)
    equal(state.sent[1].text, "100% für Ziel%1.")
    state.target = nil
    equal(env.PaladinRP.TryText("TEST"), false)
    for _, text in ipairs({ string.rep("x", 256), "a\nb", "a\rb", "|Htest|h" }) do
        texts.TEST = { text }
        equal(env.PaladinRP.TryText("TEST"), false)
    end
    texts.TEST = { string.rep("x", 255) }
    equal(env.PaladinRP.TryText("TEST"), true)
    state.race = "Scourge"
    equal(app.GetTextPool("MIGHT"), app.Racial.Undead.MIGHT)
    state.languages = { { "Gutterspeak", 33 } }
    equal(app.SendRPText("Untot"), true)
    equal(state.sent[#state.sent].language, 33)
    local count = #state.sent
    for _, channel in ipairs({ "PARTY", "RAID", "INSTANCE_CHAT" }) do
        state.command("channel " .. channel)
        equal(env.PaladinRP.TryText("TEST"), false)
        equal(#state.sent, count)
    end
    state.command("channel SAY")
    env.C_ChatInfo = nil
    equal(env.PaladinRP.TryText("TEST"), false)
    equal(env.PaladinRP.TryText({}), false)
end)

test("Abgelehnter Versand startet keinen Cooldown", function()
    local env, app, state = newAddon({ textChance = 100, cooldown = 20 })
    state.login()
    env.C_ChatInfo = nil
    equal(env.PaladinRP.TryText("HAMMER"), false)
    equal(app.IsCooldownReady(), true)
    equal(app.GetRemainingCooldown(), 0)
end)

local failures = 0
for _, entry in ipairs(tests) do
    local ok, err = pcall(entry.callback)
    if ok then
        print("OK: " .. entry.name)
    else
        failures = failures + 1
        print("FEHLER: " .. entry.name .. ": " .. tostring(err))
    end
end
assert(failures == 0, tostring(failures) .. " Regressionstest(s) fehlgeschlagen")
print(tostring(#tests) .. " Regressionstests erfolgreich (" .. _VERSION .. ").")
