-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

-- Dynamic text-key listing, including keys added through RP Text Studio.
-- "list": usable for this character; "list racial": racial keys for this race;
-- "list all": all races/classes, with source labels.
local function ShowDynamicList(mode, kind)
    if mode ~= "" and mode ~= "racial" and mode ~= "all" then
        addon.Notify("Benutzung: /" .. kind .. " list [racial|all]")
        return
    end
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    local _, class = UnitClass("player")
    local found = {}
    local function Add(key, source)
        if type(key) ~= "string" then return end
        if not found[key] then found[key] = {} end
        found[key][source] = true
    end
    local function Flat(pool, source)
        if type(pool) ~= "table" then return end
        for key, val in pairs(pool) do
            if type(val) == "table" then Add(key, source) end
        end
    end
    local function Racial(pool, source)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for raceKey, values in pairs(pool) do Flat(values, source .. ":" .. raceKey) end
        else
            Flat(pool[race], source .. ":" .. tostring(race))
        end
    end
    local function Class(pool, source)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for classKey, values in pairs(pool) do Flat(values, source .. ":" .. classKey) end
        else
            Flat(pool[class], source .. ":" .. tostring(class))
        end
    end
    local function RaceClass(pool)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for raceKey, classes in pairs(pool) do
                for classKey, values in pairs(classes) do
                    Flat(values, "Rasse+Klasse:" .. raceKey .. "/" .. classKey)
                end
            end
        else
            local classes = pool[race]
            if type(classes) == "table" then Flat(classes[class], "Rasse+Klasse:" .. tostring(race) .. "/" .. tostring(class)) end
        end
    end
    local lang = addon.GetOutputLanguage and addon.GetOutputLanguage() or "deDE"
    for _, locale in ipairs({lang, "deDE"}) do
        local data = addon.localeData and addon.localeData[locale]
        if type(data) == "table" then
            if mode ~= "racial" then
                if kind == "prp" then
                    for _, tableName in ipairs({"Blessings", "Auras", "Seals", "Abilities"}) do Flat(data[tableName], tableName) end
                    if type(data.GreaterBlessings) == "table" then
                        for key, val in pairs(data.GreaterBlessings) do
                            if type(val) == "table" then Add("GREATER_" .. key, "GreaterBlessings") end
                        end
                    end
                elseif kind == "rc" then
                    Flat(data.generalTexts, "Allgemein")
                    Class(data.classTexts, "Klasse")
                    RaceClass(data.raceClassTexts)
                else
                    Flat(data.texts, "Allgemein")
                end
            end
            if kind == "prp" then Racial(data.Racial, "Rasse")
            elseif kind == "rc" then Racial(data.raceTexts, "Rasse")
            else Racial(data.racial, "Rasse") end
        end
    end
    if mode ~= "racial" and type(addon.db) == "table" then Flat(addon.db.personalTexts, "Persoenlich") end
    local keys = {}
    for key in pairs(found) do keys[#keys + 1] = key end
    table.sort(keys)
    addon.Notify("Textschluessel (" .. (mode == "" and "aktuell" or mode) .. "): " .. #keys)
    if #keys == 0 then addon.Notify("Keine passenden Textschluessel gefunden.") end
    for _, key in ipairs(keys) do
        if mode == "all" then
            local sources = {}
            for source in pairs(found[key]) do sources[#sources + 1] = source end
            table.sort(sources)
            addon.Notify(key .. " [" .. table.concat(sources, ", ") .. "]")
        else
            addon.Notify(key)
        end
    end
end

local function ShowHelp()
    print("|cffc79c6ePaladin RP|r")
    print("/prp might")
    print("/prp wisdom")
    print("/prp protection")
    print("/prp freedom")
    print("/prp kings")
    print("/prp devotion")
    print("/prp retribution")
    print("/prp help | list [racial|all] | status")
    print("/prp chance 0-100 | /prp cooldown 0-3600")
    print("/prp channel [SAY|PARTY|RAID|INSTANCE_CHAT|AUTO]")
    print("/prp language deDE|enUS|frFR")
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

local function HandleLanguage(argument)
    if argument == "" then
        addon.Notify("Ausgabesprache: " .. addon.GetOutputLanguage() .. " (deDE, enUS, frFR)")
        return
    end
    local aliases = { de = "deDE", dede = "deDE", deDE = "deDE", en = "enUS", enus = "enUS", enUS = "enUS", fr = "frFR", frfr = "frFR", frFR = "frFR" }
    local language = aliases[argument] or aliases[string.lower(argument or "")]
    if not language or not addon.outputLanguages[language] then
        addon.Notify("Sprachen: deDE, enUS, frFR")
        return
    end
    local ok, reason = addon.SetOutputLanguage(language)
    if not ok then
        if reason == "not_loaded" then
            addon.Notify("Sprachdateien fuer " .. language .. " wurden nicht geladen. Bitte AddOn-Dateien/TOC pruefen.")
        else
            addon.Notify("Sprache konnte nicht aktiviert werden.")
        end
        return
    end
    addon.Notify("Ausgabesprache: " .. language .. " (" .. addon.outputLanguageNames[language] .. ")")
end

local handlers = {
    language = HandleLanguage,
    lang = HandleLanguage,
    channel = HandleChannel,
    chance = HandleChance,
    cooldown = HandleCooldown,
}




local function HandleAmbient(argument)
    local cmd, rest = (argument or ""):match("^(%S+)%s*(.-)%s*$")
    cmd = cmd and cmd:lower() or "status"
    if cmd == "on" or cmd == "off" then
        addon.db.ambientEnabled = cmd == "on"
        addon.ResetAmbientTimer()
    elseif cmd == "chance" then
        local n = tonumber(rest)
        if not n or n%1~=0 or n<0 or n>100 then addon.Notify("ambient chance 0-100");return end
        addon.db.ambientChance=n
    elseif cmd == "interval" then
        local a,b=rest:match("^(%d+)%s+(%d+)$")
        a,b=tonumber(a),tonumber(b)
        if not a or not b or a<30 or b<a or a>3600 or b>7200 then addon.Notify("ambient interval MIN MAX (30..3600 / 30..7200)");return end
        addon.db.ambientMinInterval=a;addon.db.ambientMaxInterval=b;addon.ResetAmbientTimer()
    elseif cmd == "combat" then
        if rest ~= "on" and rest ~= "off" then addon.Notify("ambient combat on|off");return end
        addon.db.ambientInCombat = rest == "on"
    elseif cmd == "test" then
        local category=rest:upper()
        if category=="" then category=nil end
        if category and not addon.GetLocalePoolExact(addon.GetOutputLanguage(),"ambient",category) then addon.Notify("Unbekannte Kategorie: "..category);return end
        if not addon.TryAmbient(category,true) then addon.Notify("Ambient derzeit nicht verfuegbar (Klasse/Kampf/Cooldown/Aktivierung)."); end
        return
    elseif cmd ~= "status" then
        addon.Notify("ambient on|off, chance N, interval MIN MAX, combat on|off, test [KATEGORIE], status");return
    end
    addon.Notify(string.format("Ambient: %s | Chance: %d%% | Intervall: %d-%ds | Kampf: %s", addon.db.ambientEnabled and "on" or "off", addon.db.ambientChance, addon.db.ambientMinInterval, addon.db.ambientMaxInterval, addon.db.ambientInCombat and "on" or "off"))
end

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

    if command == "list" then
        ShowDynamicList(argument:lower(), "prp")
        return
    end
    if command == "status" and argument == "" then
        addon.Notify(string.format("Chance: %g%% | Cooldown: %gs | Kanal: %s | Sprache: %s",
            addon.db.textChance, addon.db.cooldown, addon.db.chatChannel, addon.GetOutputLanguage()))
        return
    end
    if command == "ambient" then HandleAmbient(argument); return end
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
