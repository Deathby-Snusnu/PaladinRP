-- ==========================================
-- PALADIN RP
-- HAUPTDATEI
-- ==========================================

local ADDON_NAME = "PaladinRP"
local SETTINGS = RPChatMod_Settings

PaladinRP = PaladinRP or {}

-- ==========================================
-- STANDARDWERTE
-- ==========================================

local DEFAULTS = {
    textChance = SETTINGS.textChance,
    cooldown = SETTINGS.cooldown,
    chatChannel = SETTINGS.chatChannel,
}

local VALID_CHAT_CHANNELS = {
    SAY = true,
    PARTY = true,
    RAID = true,
    INSTANCE_CHAT = true,
    AUTO = true,
}

-- Zeitpunkt des letzten RP-Textes
local lastRPText = 0


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

    if PaladinRP_CharacterDB.chatChannel == nil then
        PaladinRP_CharacterDB.chatChannel = DEFAULTS.chatChannel
    end

    if PaladinRP_CharacterDB.personalTexts == nil then
        PaladinRP_CharacterDB.personalTexts = {}
    end
end


-- ==========================================
-- ZUFALLSTEXT
-- ==========================================

local function GetRandomText(pool)

    if not pool or #pool == 0 then
        return nil
    end

    return pool[math.random(#pool)]
end


-- ==========================================
-- COOLDOWN
-- ==========================================

local function IsCooldownReady()

    local now = GetTime()
    local cooldown = PaladinRP_CharacterDB.cooldown

    return (now - lastRPText) >= cooldown
end


local function GetRemainingCooldown()

    local now = GetTime()
    local cooldown = PaladinRP_CharacterDB.cooldown

    return math.max(
        0,
        cooldown - (now - lastRPText)
    )
end


local function StartCooldown()

    lastRPText = GetTime()
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
-- VOLKSSPRACHE
-- ==========================================

local RacialLanguages = {

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


local function GetRacialLanguageID()

    local _, race = UnitRace("player")

    local languageName = RacialLanguages[race]

    if not languageName then
        return nil
    end

    for index = 1, GetNumLanguages() do

        local language, languageID =
            GetLanguageByIndex(index)

        if language == languageName then
            return languageID
        end
    end

    return nil
end


-- ==========================================
-- CHATKANAL
-- ==========================================

local function GetChatChannel()

    local configuredChannel = PaladinRP_CharacterDB.chatChannel

    if configuredChannel ~= "AUTO" then
        return configuredChannel
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
-- TEXT SENDEN
-- ==========================================

local function SendRPText(text)

    if not text then
        return false
    end

    local channel = GetChatChannel()

    local languageID = nil

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
-- TEXTPOOL
-- ==========================================

local function GetTextPool(emote)

    -- --------------------------------------
    -- 1. Persönliche Texte
    -- --------------------------------------

    if PaladinRP_CharacterDB.personalTexts
        and PaladinRP_CharacterDB.personalTexts[emote] then

        return PaladinRP_CharacterDB.personalTexts[emote]
    end


    -- Große Segen benötigen ein Präfix, da ihre Schlüssel mit normalen
    -- Segen kollidieren (z. B. MIGHT und WISDOM).
    local greaterPrefix = "GREATER_"

    if string.sub(emote, 1, #greaterPrefix) == greaterPrefix then
        local greaterEmote = string.sub(emote, #greaterPrefix + 1)

        if PaladinRP_GreaterBlessings[greaterEmote] then
            return PaladinRP_GreaterBlessings[greaterEmote]
        end
    end


    -- --------------------------------------
    -- 2. Rassenspezifische Texte
    -- --------------------------------------

    local _, race = UnitRace("player")

    if PaladinRP_Racial[race]
        and PaladinRP_Racial[race][emote] then

        return PaladinRP_Racial[race][emote]
    end


    -- --------------------------------------
    -- 3. Normale Segen
    -- --------------------------------------

    if PaladinRP_Blessings[emote] then
        return PaladinRP_Blessings[emote]
    end


    -- --------------------------------------
    -- 4. Große Segen
    -- --------------------------------------

    if PaladinRP_GreaterBlessings[emote] then
        return PaladinRP_GreaterBlessings[emote]
    end


    -- --------------------------------------
    -- 5. Auren
    -- --------------------------------------

    if PaladinRP_Auras[emote] then
        return PaladinRP_Auras[emote]
    end


    -- --------------------------------------
    -- 6. Siegel
    -- --------------------------------------

    if PaladinRP_Seals[emote] then
        return PaladinRP_Seals[emote]
    end


    -- --------------------------------------
    -- 7. Sonstige Fähigkeiten
    -- --------------------------------------

    if PaladinRP_Abilities[emote] then
        return PaladinRP_Abilities[emote]
    end

    return nil
end


-- ==========================================
-- RP-TEXT ERZEUGEN
-- ==========================================

local function BuildRPText(emote)

    local pool = GetTextPool(emote)

    if not pool then
        return nil
    end


    -- ======================================
    -- PERSÖNLICHER / RASSEN-TEXT
    -- ======================================

    if type(pool[1]) == "string" then

        local text = GetRandomText(pool)

        local targetName = GetTargetName()

        if targetName
            and string.find(text, "%%s") then

            text = string.format(
                text,
                targetName
            )
        end

        return text
    end


    -- ======================================
    -- ZIELTEXT
    -- ======================================

    local targetName = GetTargetName()

    if targetName
        and pool.ziel
        and #pool.ziel > 0 then

        local text = GetRandomText(pool.ziel)

        if string.find(text, "%%s") then

            text = string.format(
                text,
                targetName
            )
        end

        return text
    end


    -- ======================================
    -- GRUPPENTEXT
    -- ======================================

    if pool.gruppe
        and #pool.gruppe > 0 then

        return GetRandomText(pool.gruppe)
    end

    return nil
end


-- ==========================================
-- RP-TEXT VERSUCHEN
-- ==========================================

function PaladinRP.TryText(emote)
    emote = string.upper(emote or "")

    if emote == "" then
        return
    end

    if not IsCooldownReady() then
        return
    end

    local chance = PaladinRP_CharacterDB.textChance

    if math.random(100) > chance then
        return
    end

    local text = BuildRPText(emote)

    if not text then
        print(
            "|cffff0000Paladin RP:|r " ..
            "Kein Text für " ..
            emote ..
            " vorhanden."
        )
        return
    end

    if SendRPText(text) then
        StartCooldown()
    end
end


-- ==========================================
-- SLASH COMMAND
-- ==========================================

SLASH_PALADINRP1 = "/prp"

SlashCmdList["PALADINRP"] = function(message)

    local command =
        string.match(
            message or "",
            "^%s*(%S+)"
        )

    if not command then

        print("|cffc79c6ePaladin RP|r")
        print("/prp might")
        print("/prp wisdom")
        print("/prp protection")
        print("/prp freedom")
        print("/prp kings")
        print("/prp devotion")
        print("/prp retribution")
        print("/prp channel [SAY|PARTY|RAID|INSTANCE_CHAT|AUTO]")

        return
    end


    command = string.lower(command)

    -- ======================================
    -- CHATKANAL
    -- ======================================

    if command == "channel" then

        local channel =
            string.match(
                message or "",
                "^%s*%S+%s+(%S+)"
            )

        if not channel then
            print(
                string.format(
                    "|cffc79c6ePaladin RP:|r " ..
                    "Aktueller Chatkanal: %s. " ..
                    "Benutzung: /prp channel SAY|PARTY|RAID|INSTANCE_CHAT|AUTO",
                    PaladinRP_CharacterDB.chatChannel
                )
            )
            return
        end

        channel = string.upper(channel)

        if not VALID_CHAT_CHANNELS[channel] then
            print(
                "|cffff0000Paladin RP:|r Ungültiger Chatkanal. " ..
                "Erlaubt sind SAY, PARTY, RAID, INSTANCE_CHAT und AUTO."
            )
            return
        end

        PaladinRP_CharacterDB.chatChannel = channel

        print(
            string.format(
                "|cffc79c6ePaladin RP:|r Chatkanal auf %s gesetzt.",
                channel
            )
        )
        return
    end


    -- ======================================
    -- TEXTCHANCE
    -- ======================================

    if command == "chance" then

        local value =
            tonumber(
                string.match(
                    message,
                    "^%s*%S+%s+(%d+)"
                )
            )

        if not value then

            print(
                "Benutzung: /prp chance 30"
            )

            return
        end

        value = math.max(
            0,
            math.min(100, value)
        )

        PaladinRP_CharacterDB.textChance =
            value

        print(
            string.format(
                "|cffc79c6ePaladin RP:|r " ..
                "Textchance: %d%%",
                value
            )
        )

        return
    end


    -- ======================================
    -- COOLDOWN
    -- ======================================

    if command == "cooldown" then

        local value =
            tonumber(
                string.match(
                    message,
                    "^%s*%S+%s+(%d+)"
                )
            )

        if not value then

            print(
                "Benutzung: /prp cooldown 20"
            )

            return
        end

        value = math.max(0, value)

        PaladinRP_CharacterDB.cooldown =
            value

        print(
            string.format(
                "|cffc79c6ePaladin RP:|r " ..
                "Cooldown: %d Sekunden",
                value
            )
        )

        return
    end


    -- ======================================
    -- MANUELLER RP-TEXT
    -- ======================================

    PaladinRP.TryText(command)
end


-- ==========================================
-- INITIALISIERUNG
-- ==========================================

local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript(
    "OnEvent",
    function()

        InitializeDatabase()

        print(
            "|cffc79c6ePaladin RP|r geladen. " ..
            "Befehl: |cffffd100/prp|r"
        )

    end
)