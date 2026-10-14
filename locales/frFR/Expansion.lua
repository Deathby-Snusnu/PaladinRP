-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'Que la Lumiere en soit temoin.'
local groupEmote = '*se concentre et trace calmement un signe de la Lumiere.*'
local targetSpeech = 'Que la Lumiere soit avec vous, %s.'
local targetEmote = '*se tourne vers %s et trace calmement un signe de la Lumiere.*'

local function appendUnique(list, text)
    if type(list) ~= "table" then return end
    for _, value in ipairs(list) do
        if value == text then return end
    end
    list[#list + 1] = text
end

local function expand(node, seen)
    if type(node) ~= "table" or seen[node] then return end
    seen[node] = true
    if type(node.ziel) == "table" then
        appendUnique(node.ziel, targetSpeech)
        appendUnique(node.ziel, targetEmote)
    end
    if type(node.gruppe) == "table" then
        appendUnique(node.gruppe, groupSpeech)
        appendUnique(node.gruppe, groupEmote)
    end
    if type(node.name) == "string" and node.name ~= "" then
        if type(node.gruppe) == "table" then appendUnique(node.gruppe, "*invoque " .. node.name .. " par un signe calme de la Lumiere.*") end
        if type(node.ziel) == "table" then appendUnique(node.ziel, "*dirige " .. node.name .. " vers %s d un geste assure.*") end
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.frFR.Blessings, addon.localeData.frFR.GreaterBlessings, addon.localeData.frFR.Auras, addon.localeData.frFR.Seals, addon.localeData.frFR.Abilities, addon.localeData.frFR.Racial}) do
    expand(container, {})
end
