-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'Let the Light bear witness.'
local groupEmote = '*gathers focus and traces a calm sign of the Light.*'
local targetSpeech = 'May the Light be with you, %s.'
local targetEmote = '*turns to %s and traces a calm sign of the Light.*'

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
        if type(node.gruppe) == "table" then appendUnique(node.gruppe, "*invokes " .. node.name .. " with a calm sign of the Light.*") end
        if type(node.ziel) == "table" then appendUnique(node.ziel, "*directs " .. node.name .. " toward %s with a steady gesture.*") end
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.enUS.Blessings, addon.localeData.enUS.GreaterBlessings, addon.localeData.enUS.Auras, addon.localeData.enUS.Seals, addon.localeData.enUS.Abilities, addon.localeData.enUS.Racial}) do
    expand(container, {})
end
