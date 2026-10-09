-- Blessings data.
-- ==========================================
-- PALADIN RP
-- NORMALE SEGEN
-- ==========================================

local _, addon = ...

addon.Blessings = {

    ["MIGHT"] = {
        name = "Segen der Macht",

        ziel = {
            "Das Licht gebe Euch Macht und Stärke, %s.",
            "Möge das Licht Euren Arm stärken, %s.",
            "Möge Euch die Kraft des Lichts begleiten, %s.",
            "Geht gestärkt durch das Licht, %s.",
            "Möge Eure Stärke dem Guten dienen, %s.",
            "Tragt die Kraft des Lichts in Euch, %s.",
            "Möge Euch kein Zweifel den Mut nehmen, %s.",
        },

        gruppe = {
            "Das Licht gebe Euch Macht und Stärke.",
            "Möge das Licht unsere Reihen stärken.",
            "Gemeinsam stehen wir stark.",
            "Möge unsere Kraft dem rechten Zweck dienen.",
        },
    },

    ["WISDOM"] = {
        name = "Segen der Weisheit",

        ziel = {
            "Das Licht gebe Euch Weisheit, %s.",
            "Möge das Licht Euren Verstand schärfen, %s.",
            "Möge Euer Urteil klar und Euer Geist wach sein, %s.",
            "Möge Euch Weisheit den rechten Weg zeigen, %s.",
            "Handelt mit Bedacht, %s.",
            "Möge Klarheit Eure Entscheidungen leiten, %s.",
        },

        gruppe = {
            "Das Licht gebe uns Weisheit.",
            "Möge das Licht unseren Geist erhellen.",
            "Lasst uns mit Bedacht handeln.",
            "Möge unser Urteil klar bleiben.",
        },
    },

    ["PROTECTION"] = {
        name = "Segen des Schutzes",

        ziel = {
            "Das Licht wache über Euch, %s.",
            "Möge das Licht Euch vor Unheil bewahren, %s.",
            "Möge der Schutz des Lichts Euch begleiten, %s.",
            "Kein Schlag soll Euch erreichen, %s.",
            "Steht fest. Das Licht hält seine schützende Hand über Euch, %s.",
            "Für diesen Augenblick seid Ihr behütet, %s.",
        },

        gruppe = {
            "Das Licht wache über uns.",
            "Möge der Schutz des Lichts uns begleiten.",
            "Haltet zusammen. Das Licht schützt unsere Reihen.",
            "Möge das Licht zwischen uns und der Gefahr stehen.",
        },
    },

    ["SALVATION"] = {
        name = "Segen der Rettung",

        ziel = {
            "Möge der Zorn unserer Feinde an Euch vorübergehen, %s.",
            "Das Licht lenke feindliche Augen von Euch fort, %s.",
            "Bleibt im Schatten größerer Bedrohungen, %s.",
            "Möge Euer Wirken unbemerkt bleiben, bis es zu spät ist, %s.",
            "Das Licht schenke Euch Zurückhaltung im Angesicht des Feindes, %s.",
            "Möge die Aufmerksamkeit des Feindes Euch meiden, %s.",
        },

        gruppe = {
            "Möge der Zorn unserer Feinde an uns vorübergehen.",
            "Lasst andere den Blick des Feindes binden.",
            "Wir wirken, ohne unnötig Aufmerksamkeit zu wecken.",
            "Möge das Licht feindliche Augen von uns ablenken.",
        },
    },

    ["FREEDOM"] = {
        name = "Segen der Freiheit",

        ziel = {
            "Das Licht löse Eure Fesseln, %s.",
            "Möge Euch das Licht von allen Fesseln befreien, %s.",
            "Keine Kette soll Euch halten, %s.",
            "Möge Euer Schritt frei und ungehindert sein, %s.",
            "Lasst Euch von nichts aufhalten, %s.",
            "Keine Fessel ist stärker als Euer Wille, %s.",
        },

        gruppe = {
            "Möge das Licht uns Freiheit schenken.",
            "Nichts soll unseren Weg versperren.",
            "Keine Fessel soll uns halten.",
            "Möge unser Weg frei bleiben.",
        },
    },
}
