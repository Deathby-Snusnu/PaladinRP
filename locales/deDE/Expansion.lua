-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'Das Licht sei Zeuge.'
local groupEmote = '*sammelt sich und zeichnet mit ruhiger Hand ein Zeichen des Lichts.*'
local targetSpeech = 'Das Licht sei mit Euch, %s.'
local targetEmote = '*wendet sich %s zu und zeichnet ein ruhiges Zeichen des Lichts.*'

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
        if type(node.gruppe) == "table" then appendUnique(node.gruppe, "*ruft " .. node.name .. " mit einem ruhigen Zeichen des Lichts an.*") end
        if type(node.ziel) == "table" then appendUnique(node.ziel, "*wendet " .. node.name .. " mit fester Geste %s zu.*") end
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.deDE.Blessings, addon.localeData.deDE.GreaterBlessings, addon.localeData.deDE.Auras, addon.localeData.deDE.Seals, addon.localeData.deDE.Abilities, addon.localeData.deDE.Racial}) do
    expand(container, {})
end
