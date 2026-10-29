-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...
local GREATER_PREFIX = "GREATER_"
local LEGACY_KEY_ALIASES = { HAMMER = "HAMMER_OF_WRATH" }

local FRIENDLY_OR_SELF = {
    MIGHT=true, WISDOM=true, PROTECTION=true, SALVATION=true, FREEDOM=true, KINGS=true,
    GREATER_MIGHT=true, GREATER_WISDOM=true, GREATER_KINGS=true, GREATER_SALVATION=true,
    LAYONHANDS=true, PURIFY=true, CLEANSE=true,
}
-- HAMMER_OF_JUSTICE is hostile-targeted and intentionally not FRIENDLY_OR_SELF.
local SELF_ONLY = {
    DEVOTION=true, RETRIBUTION=true, CONCENTRATION=true, SHADOW=true, FIRE=true, FROST=true,
    RIGHTEOUSNESS=true, COMMAND=true, RIGHTEOUS_FURY=true, DIVINE_SHIELD=true,
}

local function ChooseArray(pool, targetName)
    if type(pool) ~= "table" or #pool == 0 then return nil end
    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= "" then
            local needsTarget = text:find("%s",1,true) ~= nil
            if not needsTarget or targetName then usable[#usable+1] = text end
        end
    end
    if #usable == 0 then return nil end
    local text = usable[math.random(#usable)]
    if targetName then text = text:gsub("%%s", function() return targetName end) end
    return text
end

local function ChooseText(pool, targetName)
    if type(pool) ~= "table" then return nil end
    if #pool > 0 then return ChooseArray(pool, targetName) end
    if targetName then
        local text = ChooseArray(pool.ziel, targetName)
        if text then return text end
    end
    local text = ChooseArray(pool.gruppe, targetName)
    if text then return text end
    -- Never substitute the caster name when a self spell has no other target.
    return ChooseArray(pool.ziel, targetName)
end

local function GetFriendlyTargetOrSelf()
    if UnitExists("target") and UnitCanAssist("player", "target") then
        if UnitIsUnit and UnitIsUnit("target", "player") then return nil end
        return UnitName("target")
    end
    return nil
end

local function ResolveTargetName(key)
    if SELF_ONLY[key] then return nil end
    if FRIENDLY_OR_SELF[key] then return GetFriendlyTargetOrSelf() end
    if UnitExists("target") then
        if UnitIsUnit and UnitIsUnit("target", "player") then return nil end
        return UnitName("target")
    end
end

local function FindLocalePool(language, key, skipRacial)
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    if race == "Scourge" then race = "Undead" end

    if string.sub(key, 1, #GREATER_PREFIX) == GREATER_PREFIX then
        local baseKey = string.sub(key, #GREATER_PREFIX + 1)
        local greater = addon.GetLocalePoolExact(language, "GreaterBlessings", baseKey)
        if greater then return greater end
    end
    if not skipRacial then
        local racial = addon.GetLocalePoolExact(language, "Racial", race, key)
        if racial then return racial end
    end
    for _, tableName in ipairs({"Blessings","GreaterBlessings","Auras","Seals","Abilities"}) do
        local pool = addon.GetLocalePoolExact(language, tableName, key)
        if pool then return pool end
    end
end

function addon.GetTextPool(key)
    key = LEGACY_KEY_ALIASES[key] or key
    local lang = addon.GetOutputLanguage()
    return FindLocalePool(lang, key) or FindLocalePool("deDE", key)
end

function addon.BuildText(key)
    -- Keep older /prp hammer macros and personal text overrides working.
    local originalKey = key
    key = LEGACY_KEY_ALIASES[key] or key
    local targetName = ResolveTargetName(key)
    local personal = addon.db.personalTexts and
        (addon.db.personalTexts[key] or addon.db.personalTexts[originalKey]
            or (key == "HAMMER_OF_WRATH" and addon.db.personalTexts.HAMMER))
    if personal then
        local text = ChooseText(personal, targetName)
        if text then return text end
    end
    local pool = addon.GetTextPool(key)
    local text = ChooseText(pool, targetName)
    if text or targetName then return text end

    local language = addon.GetOutputLanguage()
    pool = FindLocalePool(language, key, true) or FindLocalePool("deDE", key, true)
    return ChooseText(pool, targetName)
end

addon.ChooseStructuredText = ChooseText
addon.BuildRPText = addon.BuildText
