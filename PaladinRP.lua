-- PaladinRP addon entry point.
-- ==========================================
-- PALADIN RP
-- HAUPTDATEI
-- ==========================================

local ADDON_NAME = "PaladinRP"

PaladinRP = PaladinRP or {}

-- ==========================================
-- STANDARD-EINSTELLUNGEN
-- ==========================================

local DEFAULTS = {
    textChance = 65,
    cooldown = 12,
    channel = "AUTO",
}

-- ==========================================
-- INITIALISIERUNG
-- ==========================================

local function InitializeDatabase()

    PaladinRP_CharacterDB = PaladinRP_CharacterDB or {}

    if PaladinRP_CharacterDB.textChance == nil then
        PaladinRP_CharacterDB.textChance = DEFAULTS.textChance
    end

    if PaladinRP_CharacterDB.cooldown == nil then
        PaladinRP_CharacterDB.cooldown = DEFAULTS.cooldown
    end

    if PaladinRP_CharacterDB.channel == nil then
        PaladinRP_CharacterDB.channel = DEFAULTS.channel
    end

    if PaladinRP_CharacterDB.personalTexts == nil then
        PaladinRP_CharacterDB.personalTexts = {}
    end
end

-- ==========================================
-- COOLDOWN
-- ==========================================

local lastRPText = 0

local function IsCooldownReady()

    local now = GetTime()
    local cooldown = PaladinRP_CharacterDB.cooldown

    return (now - lastRPText) >= cooldown
end

local function GetRemainingCooldown()

    local now = GetTime()
    local cooldown = PaladinRP_CharacterDB.cooldown
    local remaining = cooldown - (now - lastRPText)

    return math.max(0, remaining)
end

local function StartCooldown()
    lastRPText = GetTime()
end

-- ==========================================
-- ZUFALL
-- ==========================================

local function GetRandomText(pool)

    if not pool or #pool == 0 then
        return nil
    end

    return pool[math.random(1, #pool)]
end

-- ==========================================
-- ZIEL
-- ==========================================

local function GetTargetName()

    if not UnitExists("target") then
        return nil
    end

    return UnitName("target")
end

-- ==========================================
-- RASSENSPRACHE
-- ==========================================

local function GetRacialLanguageID()

    local racialLanguageNames = {
        Human = "Gemeinsprache",
        Dwarf = "Zwergisch",
        Gnome = "Gnomisch",
        NightElf = "Darnassisch",
        Draenei = "Draenei",

        Orc = "Orcisch",
        Troll = "Zandali",
        Undead = "Gossensprache",
        BloodElf = "Thalassisch",
        Tauren = "Taurisch",
    }

    local _, race = UnitRace("player")
    local languageName = racialLanguageNames[race]

    if not languageName then
        return nil
    end

    for i = 1, GetNumLanguages() do

        local language, languageID = GetLanguageByIndex(i)

        if language == languageName then
            return languageID
        end
    end

    return nil
end

-- ==========================================
-- CHAT-KANAL
-- ==========================================

local function GetChatChannel()

    local configured = PaladinRP_CharacterDB.channel

    if configured ~= "AUTO" then
        return configured
    end

    if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
        return "INSTANCE_CHAT"
    end

    if IsInRaid() then
        return "RAID"
    end

    if IsInGroup() then
        return "PARTY"
    end

    return "SAY"
end

-- ==========================================
-- CHAT SENDEN
-- ==========================================

local function SendRPText(text)

    if not text then
        return false
    end

    local channel = GetChatChannel()

    local languageID = nil

    -- Die Sprache ist nur für SAY/YELL relevant.
    if channel == "SAY" or channel == "YELL" then
        languageID = GetRacialLanguageID()
    end

    C_ChatInfo.SendChatMessage(
        text,
        channel,
        languageID
    )

    return true
end

-- ==========================================
-- PERSÖNLICHE TEXTE
-- ==========================================

local function GetPersonalText(emote)

    local personal = PaladinRP_CharacterDB.personalTexts

    if not personal then
        return nil
    end

    local pool = personal[emote]

    if not pool or #pool == 0 then
        return nil
    end

    return GetRandomText(pool)
end

-- ==========================================
-- RASSEN-TEXTE
-- ==========================================

local function GetRacialText(emote)

    local _, race = UnitRace("player")

    if not PaladinRP_Racial[race] then
        return nil
    end

    local pool = PaladinRP_Racial[race][emote]

    if not pool then
        return nil
    end

    return GetRandomText(pool)
end

-- ==========================================
-- TEXTPOOL SUCHEN
-- ==========================================

local function GetTextPool(emote)

    -- 1. Persönlicher Text
    local personal = PaladinRP_CharacterDB.personalTexts

    if personal and personal[emote] then
        return personal[emote]
    end

    -- 2. Rassenspezifischer Text
    local _, race = UnitRace("player")

    if PaladinRP_Racial[race]
        and PaladinRP_Racial[race][emote] then

        return PaladinRP_Racial[race][emote]
    end

    -- 3. Normale Segen
    if PaladinRP_Blessings[emote] then
        return PaladinRP_Blessings[emote]
    end

    -- 4. Große Segen
    if PaladinRP_GreaterBlessings[emote] then
        return PaladinRP_GreaterBlessings[emote]
    end

    -- 5. Auren
    if PaladinRP_Auras[emote] then
        return PaladinRP_Auras[emote]
    end

    -- 6. Siegel
    if PaladinRP_Seals[emote] then
        return PaladinRP_Seals[emote]
    end

    -- 7. Sonstige Fähigkeiten
    if PaladinRP_Abilities[emote] then
        return PaladinRP_Abilities[emote]
    end

    return nil
end

-- ==========================================
-- TEXT ERMITTELN
-- ==========================================

local function GetRPText(emote)

    local pool = GetTextPool(emote)

    if not pool then
        return nil
    end

    -- Persönliche Texte sind direkt ein Array.
    if type(pool[1]) == "string" then

        local text = GetRandomText(pool)

        local targetName = GetTargetName()

        if targetName and string.find(text, "%%s") then
            text = string.format(text, targetName)
        end

        return text
    end

    -- Datenobjekt mit ziel/gruppe
    local targetName = GetTargetName()

    if targetName
        and pool.ziel
        and #pool.ziel > 0 then

        local text = GetRandomText(pool.ziel)

        if string.find(text, "%%s") then
            text = string.format(text, targetName)
        end

        return text
    end

    if pool.gruppe
        and #pool.gruppe > 0 then

        return GetRandomText(pool.gruppe)
    end

    return nil
end

-- ==========================================
-- HAUPTFUNKTION
-- ==========================================

function PaladinRP_Do(emote)

    emote = string.upper(emote or "")

    if emote == "" then

        print("|cffffd100Paladin RP:|r Kein Befehl angegeben.")

        return
    end

    -- --------------------------------------
    -- COOLDOWN
    -- --------------------------------------

    if not IsCooldownReady() then

        local remaining = GetRemainingCooldown()

        print(
            string.format(
                "|cffc79c6ePaladin RP:|r " ..
                "RP-Text auf Abklingzeit. Noch %.1f Sekunden.",
                remaining
            )
        )

        return
    end

    -- --------------------------------------
    -- ZUFALLSCHANCE
    -- --------------------------------------

    local chance = PaladinRP_CharacterDB.textChance

    local roll = math.random(1, 100)

    if roll > chance then

        -- Kein Text, aber auch kein Fehler.
        return
    end

    -- --------------------------------------
    -- TEXT
    -- --------------------------------------

    local text = GetRPText(emote)

    if not text then

        print(
            "|cffff0000Paladin RP:|r " ..
            "Kein RP-Text für '" .. emote .. "' gefunden."
        )

        return
    end

    -- --------------------------------------
    -- SENDEN
    -- --------------------------------------

    if SendRPText(text) then
        StartCooldown()
    end
end

-- ==========================================
-- SLASH COMMAND
-- ==========================================

SLASH_PALADINRP1 = "/prp"

SlashCmdList["PALADINRP"] = function(message)

    local emote = string.match(
        message or "",
        "^%s*(%S+)"
    )

    if not emote then

        print("|cffc79c6ePaladin RP|r")
        print("")
        print("/prp might")
        print("/prp wisdom")
        print("/prp protection")
        print("/prp freedom")
        print("/prp kings")
        print("/prp devotion")
        print("/prp retribution")
        print("")
        print("/prp chance 65")
        print("/prp cooldown 12")

        return
    end

    local command = string.lower(emote)

    -- ======================================
    -- CHANCE
    -- ======================================

    if command == "chance" then

        local value = tonumber(
            string.match(
                message,
                "^%s*%S+%s+(%d+)"
            )
        )

        if not value then
            print(
                "|cffff0000Paladin RP:|r " ..
                "Beispiel: /prp chance 65"
            )
            return
        end

        value = math.max(0, math.min(100, value))

        PaladinRP_CharacterDB.textChance = value

        print(
            string.format(
                "|cffc79c6ePaladin RP:|r " ..
                "Textchance auf %d%% gesetzt.",
                value
            )
        )

        return
    end

    -- ======================================
    -- COOLDOWN
    -- ======================================

    if command == "cooldown" then

        local value = tonumber(
            string.match(
                message,
                "^%s*%S+%s+(%d+)"
            )
        )

        if not value then
            print(
                "|cffff0000Paladin RP:|r " ..
                "Beispiel: /prp cooldown 12"
            )
            return
        end

        value = math.max(0, value)

        PaladinRP_CharacterDB.cooldown = value

        print(
            string.format(
                "|cffc79c6ePaladin RP:|r " ..
                "Cooldown auf %d Sekunden gesetzt.",
                value
            )
        )

        return
    end

    PaladinRP_Do(emote)
end

-- ==========================================
-- INITIALISIERUNG
-- ==========================================

local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript("OnEvent", function()

    InitializeDatabase()

    math.randomseed(
        time()
    )

    print(
        "|cffc79c6ePaladin RP|r geladen. " ..
        "Befehl: |cffffd100/prp|r"
    )

end)