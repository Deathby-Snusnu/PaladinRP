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
