local _, addon = ...
local GREATER_PREFIX = "GREATER_"

-- Zielregeln fuer RP-Texte.
-- Freundliche Zauber duerfen niemals den Namen eines feindlichen Targets in %s einsetzen.
local FRIENDLY_OR_SELF = {
    MIGHT = true, WISDOM = true, PROTECTION = true,
    SALVATION = true, FREEDOM = true, KINGS = true,
    GREATER_MIGHT = true, GREATER_WISDOM = true,
    GREATER_KINGS = true, GREATER_SALVATION = true,
    LAYONHANDS = true,
}

local SELF_ONLY = {
    DEVOTION = true, RETRIBUTION = true, CONCENTRATION = true,
    SHADOW = true, FIRE = true, FROST = true,
    RIGHTEOUSNESS = true, COMMAND = true,
    DIVINE_SHIELD = true,
}

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then
        return nil
    end
    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= ""
            and (targetName or not text:find("%s", 1, true)) then
            usable[#usable + 1] = text
        end
    end
    if #usable == 0 then
        return nil
    end
    local text = usable[math.random(#usable)]
    return (text:gsub("%%s", function() return targetName end))
end

local function GetCurrentTargetName()
    if not UnitExists("target") then
        return nil
    end
    return UnitName("target")
end

local function GetFriendlyTargetOrSelf()
    if UnitExists("target") and UnitCanAssist("player", "target") then
        return UnitName("target")
    end
    return UnitName("player")
end

local function ResolveTargetName(emote)
    if SELF_ONLY[emote] then
        return nil
    end
    if FRIENDLY_OR_SELF[emote] then
        return GetFriendlyTargetOrSelf()
    end
    return GetCurrentTargetName()
end

function addon.GetTextPool(emote)
    local personalTexts = addon.db.personalTexts
    if personalTexts and personalTexts[emote] then return personalTexts[emote] end

    local lang = addon.GetOutputLanguage()
    local _, race = UnitRace("player")
    if addon.GetPlayerRaceToken then race = addon.GetPlayerRaceToken() end
    if race == "Scourge" then race = "Undead" end

    local function Find(language)
        if string.sub(emote, 1, #GREATER_PREFIX) == GREATER_PREFIX then
            local greaterEmote = string.sub(emote, #GREATER_PREFIX + 1)
            local greater = addon.GetLocalePoolExact(language, "GreaterBlessings", greaterEmote)
            if greater then return greater end
        end
        local racial = addon.GetLocalePoolExact(language, "Racial", race, emote)
        if racial then return racial end
        for _, tableName in ipairs({ "Blessings", "GreaterBlessings", "Auras", "Seals", "Abilities" }) do
            local pool = addon.GetLocalePoolExact(language, tableName, emote)
            if pool then return pool end
        end
        return nil
    end
    return Find(lang) or Find("deDE")
end

function addon.BuildText(emote)
    local pool = addon.GetTextPool(emote)
    if type(pool) ~= "table" then
        return nil
    end

    local targetName = ResolveTargetName(emote)
    if #pool > 0 then
        return ChooseText(pool, targetName)
    end

    if targetName and type(pool.ziel) == "table" and #pool.ziel > 0 then
        return ChooseText(pool.ziel, targetName)
    end
    return ChooseText(pool.gruppe, targetName)
end

addon.BuildRPText = addon.BuildText
