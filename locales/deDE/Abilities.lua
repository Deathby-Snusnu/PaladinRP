-- Abilities data.
-- ==========================================
-- PALADIN RP
-- SONSTIGE FÄHIGKEITEN
-- ==========================================

local _, addon = ...

addon.localeData.deDE.Abilities = {

    ["HAMMER"] = {
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
}
