-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

-- Gemeinsamer Cooldown für alle Rollenspieltexte dieser AddOn-Instanz.
local _, addon = ...
local lastRPText

function addon.CooldownReady()
    local now = GetTime()
    return not lastRPText or (now - lastRPText) >= addon.db.cooldown
end

function addon.GetRemainingCooldown()
    if not lastRPText then
        return 0
    end
    return math.max(0, addon.db.cooldown - (GetTime() - lastRPText))
end

function addon.StartCooldown()
    lastRPText = GetTime()
end

addon.IsCooldownReady = addon.CooldownReady
