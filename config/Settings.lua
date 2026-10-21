-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Standardwerte für Charaktere ohne gespeicherte Einstellungen.
local _, addon = ...

addon.defaults = {
    outputLanguage = "deDE",

    -- Wahrscheinlichkeit, dass zusätzlich zum Emote
    -- ein Text ausgegeben wird.
    textChance = 30,

    -- Mindestabstand zwischen zwei Textnachrichten.
    cooldown = 20,

    -- Chatkanal für die Textausgabe.
    -- SAY -> immer /say, auch in Gruppe und Schlachtzug
    -- PARTY -> Gruppe
    -- RAID -> Schlachtzug
    -- INSTANCE_CHAT -> Instanzgruppe
    -- AUTO -> automatisch passend zum Gruppenstatus
    chatChannel = "SAY",
    ambientEnabled = true,
    ambientMinInterval = 180,
    ambientMaxInterval = 420,
    ambientChance = 70,
    ambientInCombat = false,
}