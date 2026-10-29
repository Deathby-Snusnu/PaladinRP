-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- Abilities data.
-- ==========================================
-- PALADIN RP
-- SONSTIGE FÄHIGKEITEN
-- ==========================================

local _, addon = ...

addon.localeData.deDE.Abilities = {

    ["HAMMER_OF_WRATH"] = {
        name = "Hammer des Zorns",

        gruppe = {
            "Das Licht richtet.",
            "Der Hammer des Lichts fällt.",
            "Möge das Licht meinen Schlag führen.",
            "Das Urteil ist gesprochen.",
            "Für das Licht und jene, die Schutz brauchen!",
            "Kein Zweifel soll meinen Arm bremsen.",
            "Euer Ende ist nah. Das Licht kennt kein Zögern.",
            "Ein letzter Schlag im Namen des Lichts.",
        },
    },

    ["LAYONHANDS"] = {
        name = "Handauflegung",

        ziel = {
            "Haltet durch, %s. Das Licht ist mit Euch.",
            "Das Licht schenke Euch neue Kraft, %s.",
            "Bleibt standhaft, %s. Noch ist Eure Kraft nicht erschöpft.",
            "Bleibt bei uns, %s. Gebt jetzt nicht nach.",
            "Möge das Licht Eure Wunden schließen, %s.",
            "Fasst neuen Mut, %s. Ich lasse Euch nicht fallen.",
            "Das Licht stärke Leib und Willen, %s.",
            "Noch ist Eure Stunde nicht gekommen, %s.",
        },

        gruppe = {
            "Das Licht schenke Euch neue Kraft.",
            "Haltet durch! Das Licht ist mit Euch.",
            "Niemand wird hier zurückgelassen.",
            "Neue Kraft für den Kampf!",
            "Steht fest. Das Licht trägt Euch noch.",
        },
    },

    ["DIVINE_SHIELD"] = {
        name = "Göttlicher Schild",

        gruppe = {
            "Das Licht schützt mich.",
            "Keine Klinge soll mich erreichen.",
            "Ich stehe unter dem Schutz des Lichts.",
            "Lasst Eure Schläge am Licht zerschellen.",
            "Das Licht ist meine Rüstung.",
            "Für einen Augenblick bin ich dem Zugriff meiner Feinde entzogen.",
            "Noch nicht. Das Licht hält mich auf den Beinen.",
            "Hinter diesem Schild sammle ich neue Kraft.",
        },
    },

    ["HAMMER_OF_JUSTICE"] = {
        name = "Hammer der Gerechtigkeit",
        ziel = {
            "Im Namen des Lichts: Haltet ein, %s!",
            "Eure Raserei endet hier, %s!",
            "Das Licht gebietet Euch Einhalt, %s.",
            "Keinen Schritt weiter, %s!",
            "Legt die Waffen nieder, %s. Ihr seid gewarnt.",
            "Gerechtigkeit verlangt, dass Ihr jetzt innehaltet, %s.",
            "Dies ist Eure letzte Gelegenheit, zur Besinnung zu kommen, %s.",
            "Stillgestanden, %s! Das Licht hat ein Wort mit Euch zu reden.",
            "Ihr werdet niemanden mehr bedrohen, %s!",
            "Ein Augenblick der Stille für Euch, %s.",
            "Möge Euch dieser Schlag zur Vernunft bringen, %s.",
            "Haltet inne und überdenkt Eure Taten, %s.",
            "*hebt die Hand und schleudert einen Hammer aus goldenem Licht auf %s.*",
            "*zeichnet ein leuchtendes Siegel über %s und lässt einen Lichtschlag folgen.*",
            "*streckt den Arm gegen %s aus, während ein strahlender Hammer niederfährt.*",
            "*ruft einen Hammer aus Licht herbei und lenkt ihn mit entschlossener Geste auf %s.*",
            "*schlägt die Faust in die offene Hand, als ein heiliger Hammer %s trifft.*",
            "*fixiert %s mit strengem Blick und lässt einen gleißenden Hammer herabsausen.*",
        },
        gruppe = {
            "Das Licht gebietet Einhalt!",
            "Nicht jeder Kampf muss bis zum bitteren Ende geführt werden.",
            "Ein Moment der Besinnung ist manchmal die gerechteste Strafe.",
            "Genug! Im Namen des Lichts!",
            "*hebt die rechte Hand, und ein goldener Hammer nimmt Gestalt an.*",
            "*spricht ein kurzes Urteil, während Lichtfunken um die ausgestreckte Hand tanzen.*",
        },
    },

    ["PURIFY"] = {
        name = "Läutern",
        ziel = {
            "Das Licht löse diese Last von Euch, %s.",
            "Haltet still, %s. Ich vertreibe, was Euch schwächt.",
            "Was Euch quält, soll keinen Augenblick länger bleiben, %s.",
            "Atmet ruhig, %s. Das Licht findet seinen Weg.",
            "Kein Gift soll Euren Mut trüben, %s.",
            "Ich lasse nicht zu, dass diese Verderbnis Euch bezwingt, %s.",
            "Das Licht reinige Leib und Geist, %s.",
            "Bleibt bei uns, %s. Diese Plage vergeht.",
            "*legt %s behutsam eine Hand auf die Schulter und spricht ein reinigendes Gebet.*",
            "*zieht mit zwei Fingern ein helles Siegel über %s, bis die trübe Magie zerfällt.*",
            "*kniet sich neben %s und lässt warmes Licht über die Wunden fließen.*",
            "*wendet sich %s zu und verscheucht mit einer entschlossenen Geste das Übel.*",
        },
        gruppe = {
            "Das Licht vertreibe, was uns schwächt.",
            "Keine Verderbnis soll unsere Reihen brechen.",
            "Haltet stand. Ich kümmere mich darum.",
            "Was uns lähmt, soll vor dem Licht weichen.",
            "*öffnet die Hand, und ein sanfter Lichtschein vertreibt die dunklen Schlieren.*",
            "*zeichnet ein reinigendes Symbol in die Luft und senkt ruhig den Arm.*",
        },
    },

    ["CLEANSE"] = {
        name = "Reinigung des Glaubens",
        ziel = {
            "Das Licht befreie Euch von diesem Bann, %s.",
            "Lasst nicht zu, dass fremde Magie Euren Willen beugt, %s.",
            "Ich löse diesen Makel, %s. Bleibt standhaft.",
            "Der Glaube trägt Euch durch diese Prüfung, %s.",
            "Keine dunkle Macht soll Euch gefangen halten, %s.",
            "Das Licht stellt wieder her, was verdunkelt wurde, %s.",
            "Ich sehe die Last. Jetzt nehme ich sie Euch ab, %s.",
            "Euer Wille gehört allein Euch, %s.",
            "*hebt die Hand über %s und lässt ein klares, goldenes Leuchten aufsteigen.*",
            "*spricht über %s eine alte Litanei, während sich die fremde Magie auflöst.*",
            "*zieht vor %s ein Segenszeichen und wischt den Bann mit einer ruhigen Bewegung fort.*",
            "*richtet den Blick auf %s und lässt das Licht durch die störende Magie brechen.*",
        },
        gruppe = {
            "Wo fremde Magie bindet, löst das Licht die Fesseln.",
            "Kein Fluch soll uns den Weg verstellen.",
            "Das Licht möge uns von schädlichem Zauber befreien.",
            "Wir gehen klaren Geistes weiter.",
            "*zeichnet einen Kreis aus Licht, der die letzten Spuren dunkler Magie zerstreut.*",
            "*spricht die Worte der Läuterung und senkt langsam die ausgestreckte Hand.*",
        },
    },

    ["RIGHTEOUS_FURY"] = {
        name = "Zorn der Gerechtigkeit",
        gruppe = {
            "Das Licht staerke meine Entschlossenheit. Kein Feind soll an mir vorueber!",
            "Euren Zorn auf mich. Meine Gefaehrten stehen unter meinem Schutz!",
            "Gerechtigkeit verlangt Standhaftigkeit. Ich weiche keinen Schritt.",
            "Hier stehe ich. Hier endet Euer Vormarsch.",
            "Kommt nur. Mein Schild kennt keine Furcht.",
            "*hebt den Schild und umhuellt sich mit dem goldenen Schein des Lichts.*",
            "*schlaegt die Faust gegen den Schild und stellt sich schuetzend vor die Gefaehrten.*",
            "*spricht einen ernsten Eid und zieht die Aufmerksamkeit der Gegner auf sich.*",
            "*senkt den Schwerpunkt und erwartet den Ansturm hinter dem erhobenen Schild.*",
            "Beim Licht, an mir kommt Ihr nicht vorbei!",
        },
    },


}
