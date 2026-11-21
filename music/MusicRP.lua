-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Original music-inspired roleplay; no song lyrics reproduced.
local _, addon = ...
addon.musicRP = { deDE = {}, enUS = {}, frFR = {} }
addon.musicRPReferences = {}
addon.musicRPReferences.HOLY_STRIKE = { artist = "Rammstein", song = "Sonne" }
addon.musicRP.deDE.HOLY_STRIKE = { "Ein Licht geht auf. Der Hammer sorgt für den Rest.", "*hebt den Hammer, der einen goldenen Lichtbogen zieht.*" }
addon.musicRP.enUS.HOLY_STRIKE = { "A light dawns. The hammer handles the rest.", "*raises a hammer that traces an arc of golden light.*" }
addon.musicRP.frFR.HOLY_STRIKE = { "La lumière se lève. Le marteau s'occupe du reste.", "*lève son marteau qui dessine un arc de lumière dorée.*" }
addon.musicRPReferences.MIGHT = { artist = "Amon Amarth", song = "Guardians of Asgaard" }
addon.musicRP.deDE.MIGHT = { "Möge Euch die Kraft der Berge tragen, Gefährte.", "*legt eine leuchtende Hand auf das Wappen seines Schildes.*" }
addon.musicRP.enUS.MIGHT = { "May the strength of the mountains carry you, friend.", "*rests a glowing hand on the shield's crest.*" }
addon.musicRP.frFR.MIGHT = { "Que la force des montagnes vous porte, compagnon.", "*pose une main lumineuse sur l'emblème de son bouclier.*" }
addon.musicRPReferences.HOLY_LIGHT = { artist = "U2", song = "One" }
addon.musicRP.deDE.HOLY_LIGHT = { "Nicht einer von uns muss diesen Weg allein gehen.", "*öffnet beide Hände, und sanftes Licht breitet sich aus.*" }
addon.musicRP.enUS.HOLY_LIGHT = { "None of us needs to walk this road alone.", "*opens both hands and lets a gentle light spread.*" }
addon.musicRP.frFR.HOLY_LIGHT = { "Aucun de nous n'a à parcourir ce chemin seul.", "*ouvre les mains et répand une douce lumière.*" }
addon.musicRPReferences.REDEMPTION = { artist = "Alphaville", song = "Forever Young" }
addon.musicRP.deDE.REDEMPTION = { "Nicht ewige Jugend. Nur eine zweite Gelegenheit.", "*kniet nieder und wartet auf das erste Zeichen von Leben.*" }
addon.musicRP.enUS.REDEMPTION = { "Not eternal youth. Just another chance.", "*kneels and waits for the first sign of life.*" }
addon.musicRP.frFR.REDEMPTION = { "Pas la jeunesse éternelle. Une seconde chance.", "*s'agenouille et attend un premier signe de vie.*" }
addon.musicRPReferences.HAMMER_OF_JUSTICE = { artist = "Black Sabbath", song = "Iron Man" }
addon.musicRP.deDE.HAMMER_OF_JUSTICE = { "Stahl mag brechen. Mein Entschluss nicht.", "*rammt den schweren Hammer entschlossen nach vorn.*" }
addon.musicRP.enUS.HAMMER_OF_JUSTICE = { "Steel may break. My resolve will not.", "*thrusts the heavy hammer forward with resolve.*" }
addon.musicRP.frFR.HAMMER_OF_JUSTICE = { "L'acier peut céder. Pas ma volonté.", "*projette son lourd marteau avec détermination.*" }
addon.musicRPReferences.LAYONHANDS = { artist = "Guns N' Roses", song = "November Rain" }
addon.musicRP.deDE.LAYONHANDS = { "Ich halte den Regen nicht auf. Aber ich bleibe bei Euch.", "*legt beide Hände behutsam auf die Schultern des Gefährten.*" }
addon.musicRP.enUS.LAYONHANDS = { "I cannot stop the rain. But I will stay beside you.", "*gently places both hands on the companion's shoulders.*" }
addon.musicRP.frFR.LAYONHANDS = { "Je ne peux arrêter la pluie. Mais je reste à vos côtés.", "*pose doucement ses mains sur les épaules du compagnon.*" }

-- Called after personal texts, before ordinary class/racial text selection.
function addon.ChooseMusicText(key)
    if not addon.db or not addon.db.musicEnabled then return nil end
    local chance = addon.db.musicChance or 0
    if chance <= 0 or math.random(100) > chance then return nil end
    local language = addon.GetOutputLanguage()
    local lines = addon.musicRP[language] and addon.musicRP[language][key]
    if not lines then lines = addon.musicRP.deDE[key] end
    if type(lines) ~= "table" or #lines == 0 then return nil end
    return lines[math.random(#lines)]
end
