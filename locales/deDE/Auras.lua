-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- Auras data.
-- ==========================================
-- PALADIN RP
-- AUREN
-- ==========================================

local _, addon = ...

addon.localeData.deDE.Auras = {

    ["DEVOTION"] = {
        name = "Aura der Hingabe",

        gruppe = {
            "Das Licht steht mit uns.",
            "Möge unsere Hingabe uns schützen.",
            "Wir stehen unter dem Schutz des Lichts.",
            "Haltet zusammen. Das Licht verlässt uns nicht.",
            "Unser Glaube trage uns durch jede Gefahr.",
            "Im Licht finden wir Schutz und Stärke.",
        },
    },

    ["RETRIBUTION"] = {
        name = "Aura der Vergeltung",

        gruppe = {
            "Wer uns angreift, soll die Antwort des Lichts spüren.",
            "Das Licht vergelte jeden Schlag.",
            "Kein Angriff auf uns soll unbeantwortet bleiben.",
            "Unsere Feinde sollen an unserer Standhaftigkeit zerbrechen.",
            "Unrecht fordert Antwort.",
            "Wer gegen uns schlägt, ruft Vergeltung hervor.",
        },
    },

    ["CONCENTRATION"] = {
        name = "Aura der Konzentration",

        gruppe = {
            "Bleibt konzentriert. Das Licht führt unsere Hand.",
            "Lasst Euch nicht vom Kampf ablenken.",
            "Das Licht gebe uns einen klaren Geist.",
            "Bewahrt Ruhe. Jeder Schritt hat seinen Sinn.",
            "Lasst den Lärm des Kampfes Euren Geist nicht trüben.",
            "Ein klarer Blick und eine ruhige Hand.",
        },
    },

    ["SHADOW"] = {
        name = "Aura des Schattenwiderstands",

        gruppe = {
            "Wo Schatten lauert, soll das Licht vorangehen.",
            "Der Schatten soll keinen Platz unter uns finden.",
            "Das Licht bewahre uns vor den Mächten der Finsternis.",
            "Fürchtet den Schatten nicht. Wir halten stand.",
            "Keine Finsternis soll unseren Weg verdunkeln.",
            "Haltet dem Dunkel stand. Weicht nicht.",
        },
    },

    ["FIRE"] = {
        name = "Aura des Feuerwiderstands",

        gruppe = {
            "Das Licht bewahre uns vor der Flamme.",
            "Möge das Licht uns gegen die Glut schützen.",
            "Die Hitze soll unseren Mut nicht schmelzen.",
            "Haltet stand. Keine Flamme währt ewig.",
            "Möge das Licht uns sicher durch das Feuer geleiten.",
        },
    },

    ["FROST"] = {
        name = "Aura des Frostwiderstands",

        gruppe = {
            "Möge das Licht uns vor eisiger Kälte bewahren.",
            "Der Frost soll unsere Entschlossenheit nicht brechen.",
            "Lasst die Kälte nicht in Eure Herzen dringen.",
            "Selbst im tiefsten Frost bleibt unser Wille ungebrochen.",
            "Möge das Licht unsere Schritte durch die Kälte führen.",
        },
    },
}
