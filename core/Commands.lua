local _, addon = ...

local function ShowHelp()
    print("|cffc79c6ePaladin RP|r")
    print("/prp might")
    print("/prp wisdom")
    print("/prp protection")
    print("/prp freedom")
    print("/prp kings")
    print("/prp devotion")
    print("/prp retribution")
    print("/prp help | list | status")
    print("/prp chance 0-100 | /prp cooldown 0-3600")
    print("/prp channel [SAY|PARTY|RAID|INSTANCE_CHAT|AUTO]")
end

local function HandleChannel(argument)
    if argument == "" then
        print(string.format(
            "|cffc79c6ePaladin RP:|r Aktueller Chatkanal: %s. " ..
            "Benutzung: /prp channel SAY|PARTY|RAID|INSTANCE_CHAT|AUTO",
            addon.db.chatChannel
        ))
        return
    end

    local channel = argument:upper()
    if not addon.channels[channel] then
        print("|cffff0000Paladin RP:|r Ungültiger Chatkanal. " ..
            "Erlaubt sind SAY, PARTY, RAID, INSTANCE_CHAT und AUTO.")
        return
    end
    addon.db.chatChannel = channel
    print(string.format("|cffc79c6ePaladin RP:|r Chatkanal auf %s gesetzt.", channel))
end

local function HandleChance(argument)
    local value = tonumber(argument)
    if not argument:match("^%d+$") or not addon.ValidNumber(value, 100) then
        print("Benutzung: /prp chance <ganze Zahl 0-100>")
        return
    end
    addon.db.textChance = value
    print(string.format("|cffc79c6ePaladin RP:|r Textchance: %d%%", value))
end

local function HandleCooldown(argument)
    local value = tonumber(argument)
    if not argument:match("^%d+$") or not addon.ValidNumber(value, 3600) then
        print("Benutzung: /prp cooldown <ganze Zahl 0-3600>")
        return
    end
    addon.db.cooldown = value
    print(string.format("|cffc79c6ePaladin RP:|r Cooldown: %d Sekunden", value))
end

local handlers = {
    channel = HandleChannel,
    chance = HandleChance,
    cooldown = HandleCooldown,
}

function addon.HandleCommand(message)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return
    end
    local command, argument = (message or ""):match("^%s*(%S+)%s*(.-)%s*$")
    command = command and command:lower() or "help"
    argument = argument or ""
    if command == "help" and argument == "" then
        ShowHelp()
        return
    end

    if command == "list" and argument == "" then
        local keys = {}
        for _, pools in ipairs({ addon.Blessings, addon.Auras, addon.Seals, addon.Abilities,
            addon.db.personalTexts }) do
            for key in pairs(pools) do keys[key] = true end
        end
        for key in pairs(addon.GreaterBlessings) do keys["GREATER_" .. key] = true end
        for _, pools in pairs(addon.Racial) do
            for key in pairs(pools) do keys[key] = true end
        end
        local sorted = {}
        for key in pairs(keys) do sorted[#sorted + 1] = key end
        table.sort(sorted)
        for _, key in ipairs(sorted) do addon.Notify(key) end
        return
    end
    if command == "status" and argument == "" then
        addon.Notify(string.format("Chance: %g%% | Cooldown: %gs | Kanal: %s",
            addon.db.textChance, addon.db.cooldown, addon.db.chatChannel))
        return
    end
    local handler = handlers[command]
    if handler then
        handler(argument)
        return
    end
    if argument ~= "" then
        addon.Notify("Benutzung: /prp <textschlüssel>. /prp help zeigt die Befehle.")
        return
    end
    PaladinRP.TryText(command)
end

SLASH_PALADINRP1 = "/prp"
SlashCmdList["PALADINRP"] = addon.HandleCommand
