-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Ambient engine: user-triggered chat output only.
local _, addon = ...

local pendingCategory, nextAt
local elapsed = 0
local ticker = CreateFrame("Frame")
local categories = {"PRAYER", "OATH", "REFLECTION", "VIGIL", "BLESSING"}
local function schedule()
    if not addon.db then return end
    local lo = math.max(30, addon.db.ambientMinInterval or 180)
    local hi = math.max(lo, addon.db.ambientMaxInterval or 420)
    nextAt = GetTime() + math.random(lo, hi)
end
local function chooseCategory()
    return categories[math.random(#categories)]
end
function addon.BuildAmbient(category)
    local lang = addon.GetOutputLanguage()
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    local pool = addon.GetLocalePoolExact(lang, "ambientRacial", race, category)
        or addon.GetLocalePoolExact(lang, "ambient", category)
        or addon.GetLocalePoolExact("deDE", "ambientRacial", race, category)
        or addon.GetLocalePoolExact("deDE", "ambient", category)
    if not pool or #pool == 0 then return nil end
    local eligible = {}
    for _, line in ipairs(pool) do
        if type(line) == "string" and line ~= "" and not line:find("%s", 1, true)
            and not line:find("%p", 1, true) then
            eligible[#eligible+1] = line
        end
    end
    if #eligible == 0 then return nil end
    return eligible[math.random(#eligible)]
end
function addon.QueueAmbient(category)
    if not addon.ready or not addon.isPaladin or not addon.db or not addon.db.ambientEnabled then return false end
    if not addon.db.ambientInCombat and UnitAffectingCombat("player") then return false end
    if math.random(100) > (addon.db.ambientChance or 70) then return false end
    pendingCategory = category or chooseCategory()
    return true
end
function addon.FlushPendingAmbient()
    if not pendingCategory or not addon.db or not addon.db.ambientEnabled then return false end
    if not addon.db.ambientInCombat and UnitAffectingCombat("player") then return false end
    if not addon.CooldownReady() then return false end
    local category = pendingCategory
    pendingCategory = nil
    local line = addon.BuildAmbient(category)
    if line and addon.SendText(line) then addon.StartCooldown(); return true end
    return false
end
function addon.TryAmbient(category, force)
    if not addon.ready or not addon.isPaladin or not addon.db.ambientEnabled then return false end
    if not addon.db.ambientInCombat and UnitAffectingCombat("player") then return false end
    category = category or chooseCategory()
    if force then
        if not addon.CooldownReady() then return false end
        local line = addon.BuildAmbient(category)
        if line and addon.SendText(line) then addon.StartCooldown();return true end
        return false
    end
    return addon.QueueAmbient(category)
end
function addon.ResetAmbientTimer() pendingCategory = nil; schedule() end
function addon.StartAmbientSystem()
    schedule()
    ticker:SetScript("OnUpdate",function(_,dt)
        elapsed = elapsed + dt
        if elapsed < 1 then return end
        elapsed = 0
        if not addon.db or not addon.db.ambientEnabled then return end
        if not nextAt then schedule(); return end
        if GetTime() >= nextAt then addon.QueueAmbient(); schedule() end
    end)
end
