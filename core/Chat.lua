-- Kanalauswahl, Volkssprache und Ausgabe über die Client-API.
local _, addon = ...

addon.channels = {
    SAY = true, PARTY = true, RAID = true, INSTANCE_CHAT = true, AUTO = true,
}
local RACIAL_LANGUAGE_IDS = {
    Human = 7, Dwarf = 6, Gnome = 13, NightElf = 2, Draenei = 35,
    Orc = 1, Troll = 14, Undead = 33, Scourge = 33, BloodElf = 10, Tauren = 3,
}

local function GetRacialLanguageID()
    local _, race = UnitRace("player")
    local wanted = RACIAL_LANGUAGE_IDS[race]
    if not wanted then
        return nil
    end

    for index = 1, GetNumLanguages() do
        local _, languageID = GetLanguageByIndex(index)
        if languageID == wanted then
            return languageID
        end
    end
    return nil
end

function addon.GetChatChannel()
    local configuredChannel = addon.db.chatChannel
    if not addon.channels[configuredChannel] then
        addon.Notify("Ungültiger Chatkanal. Nutzt /prp channel.")
        return nil
    end
    if configuredChannel ~= "AUTO" then
        if configuredChannel == "PARTY" and not IsInGroup()
            or configuredChannel == "RAID" and not IsInRaid()
            or configuredChannel == "INSTANCE_CHAT" and not IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
            addon.Notify("Der eingestellte Chatkanal ist hier nicht verfügbar. Nutzt /prp channel AUTO.")
            return nil
        end
        return configuredChannel
    end
    if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
        return "INSTANCE_CHAT"
    end
    if IsInRaid() then
        return "RAID"
    end
    if IsInGroup() then
        return "PARTY"
    end
    return "SAY"
end

function addon.SendRPText(text)
    if type(text) ~= "string" or text == "" then
        addon.Notify("Kein nutzbarer Text vorhanden.")
        return false
    end
    if #text > 255 or text:find("[\r\n]") or text:find("|", 1, true) then
        addon.Notify("Text nicht gesendet: maximal 255 Bytes, keine Zeilenumbrüche oder Chat-Markierungen.")
        return false
    end

    local channel = addon.GetChatChannel()
    if not channel then
        return false
    end
    if not C_ChatInfo or type(C_ChatInfo.SendChatMessage) ~= "function" then
        addon.Notify("Dieser Client stellt keine unterstützte Chat-API bereit.")
        return false
    end
    local languageID = nil
    if channel == "SAY" or channel == "YELL" then
        languageID = GetRacialLanguageID()
    end

    C_ChatInfo.SendChatMessage(text, channel, languageID)
    return true
end
