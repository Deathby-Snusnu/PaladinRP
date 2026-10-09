-- Standardwerte für Charaktere ohne gespeicherte Einstellungen.
local _, addon = ...

addon.defaults = {

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
}