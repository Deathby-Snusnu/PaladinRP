-- Login und globale öffentliche API des AddOns.
local _, addon = ...

PaladinRP = addon
addon.ready = false

function addon.TryText(emote)
    if not addon.ready then
        addon.Notify("Noch nicht geladen. Bitte wartet auf PLAYER_LOGIN.")
        return false
    end
    if not addon.isPaladin then
        addon.Notify("RP-Texte sind nur für Paladine verfügbar.")
        return false
    end
    if type(emote) ~= "string" or emote == "" then
        addon.Notify("Benutzung: /prp <textschlüssel>. /prp list zeigt alle Texte.")
        return false
    end
    emote = emote:upper()
    if not addon.CooldownReady() then
        return false
    end
    if math.random(100) > addon.db.textChance then
        return false
    end

    local text = addon.BuildText(emote)
    if not text then
        print("|cffff0000Paladin RP:|r Kein Text für " .. emote .. " vorhanden.")
        return false
    end
    if addon.SendText(text) then
        addon.StartCooldown()
        return true
    end
    return false
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function()
    addon.InitializeDatabase()
    local _, class = UnitClass("player")
    addon.isPaladin = class == "PALADIN"
    addon.ready = true
    print("|cffc79c6ePaladin RP|r geladen. Befehl: |cffffd100/prp|r")
    if not addon.isPaladin then
        addon.Notify("Kein Paladin: Einstellungen verfügbar, RP-Ausgabe deaktiviert.")
    end
end)
