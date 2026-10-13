-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

-- Sprachdaten robust initialisieren. Dadurch bleiben die einzelnen Locale-Tabellen
-- auch dann vorhanden, wenn localeData bereits von einer frueher geladenen Datei
-- angelegt wurde.
addon.localeData = addon.localeData or {}
addon.localeData.deDE = addon.localeData.deDE or {}
addon.localeData.enUS = addon.localeData.enUS or {}
addon.localeData.frFR = addon.localeData.frFR or {}

addon.outputLanguages = { deDE = true, enUS = true, frFR = true }
addon.outputLanguageNames = { deDE = "Deutsch", enUS = "English", frFR = "Francais" }

function addon.IsLocaleLoaded(lang)
    local root = addon.localeData and addon.localeData[lang]
    return type(root) == "table" and next(root) ~= nil
end

function addon.GetOutputLanguage()
    local lang = addon.runtimeOutputLanguage
        or (addon.db and addon.db.outputLanguage)
        or "deDE"

    if addon.outputLanguages[lang] and addon.IsLocaleLoaded(lang) then
        return lang
    end
    return "deDE"
end

function addon.SetOutputLanguage(lang)
    if not addon.outputLanguages[lang] then
        return false, "unknown"
    end
    if not addon.IsLocaleLoaded(lang) then
        return false, "not_loaded"
    end
    addon.runtimeOutputLanguage = lang
    if addon.db then
        addon.db.outputLanguage = lang
    end
    return true
end

function addon.GetLocalizedPool(tableName, ...)
    local lang = addon.GetOutputLanguage()
    local args = { ... }
    local function Walk(root)
        local value = root and root[tableName]
        for i = 1, #args do
            value = value and value[args[i]]
        end
        return value
    end
    return Walk(addon.localeData[lang]) or Walk(addon.localeData.deDE)
end

function addon.GetLocalePoolExact(lang, tableName, ...)
    local args = { ... }
    local value = addon.localeData[lang] and addon.localeData[lang][tableName]
    for i = 1, #args do
        value = value and value[args[i]]
    end
    return value
end
