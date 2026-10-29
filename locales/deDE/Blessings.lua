-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- Blessings data.
-- ==========================================
-- PALADIN RP
-- NORMALE SEGEN
-- ==========================================
-- RP-Konvention:
-- Gesprochene Texte stehen ohne Markierung und nutzen den eingestellten Sprachkanal (Standard: /say).
-- Beschreibende Handlungen stehen zwischen *Sternchen* und werden immer als /me ausgegeben.
-- Der Handler entfernt die Sternchen vor der Ausgabe.
-- ==========================================

local _, addon = ...

addon.localeData.deDE.Blessings = {

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
            "*legt %s eine Hand auf die Schulter und spricht mit fester Stimme einen Segen.*",
            "*hebt die Hand über %s und zeichnet langsam das Zeichen des Lichts in die Luft.*",
            "*senkt kurz den Kopf, bevor er %s mit einer ruhigen Geste segnet.*",
        },

        gruppe = {
            "Das Licht gebe Euch Macht und Stärke.",
            "Möge das Licht unsere Reihen stärken.",
            "Gemeinsam stehen wir stark.",
            "Möge unsere Kraft dem rechten Zweck dienen.",
            "*hebt beide Hände und spricht einen kräftigenden Segen über die versammelte Gruppe.*",
            "*lässt den Blick über die Gefährten schweifen und zeichnet das Zeichen des Lichts in die Luft.*",
            "*spricht mit fester Stimme einen Segen und wendet sich der Gruppe zu.*",
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
            "*legt zwei Finger an die Stirn von %s und verharrt einen Augenblick in stiller Andacht.*",
            "*senkt den Blick, murmelt ein kurzes Gebet und segnet %s mit einer ruhigen Handbewegung.*",
            "*zeichnet vor %s langsam das Zeichen des Lichts und nickt nachdenklich.*",
        },

        gruppe = {
            "Das Licht gebe uns Weisheit.",
            "Möge das Licht unseren Geist erhellen.",
            "Lasst uns mit Bedacht handeln.",
            "Möge unser Urteil klar bleiben.",
            "*schließt kurz die Augen und spricht ein stilles Gebet für Klarheit und Besonnenheit.*",
            "*hebt die Hand und zeichnet bedächtig das Zeichen des Lichts über der Gruppe.*",
            "*senkt das Haupt und bittet das Licht um Weisheit für seine Gefährten.*",
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
            "*tritt dicht an %s heran und zeichnet schützend das Zeichen des Lichts vor dessen Brust.*",
            "*hält die Hand schützend über %s und murmelt ein kurzes Gebet.*",
            "*stellt sich für einen Moment vor %s und spricht mit ernster Miene einen Schutzsegen.*",
        },

        gruppe = {
            "Das Licht wache über uns.",
            "Möge der Schutz des Lichts uns begleiten.",
            "Haltet zusammen. Das Licht schützt unsere Reihen.",
            "Möge das Licht zwischen uns und der Gefahr stehen.",
            "*stellt sich aufrecht vor seine Gefährten und hebt schützend die Hand.*",
            "*zeichnet ein weites Zeichen des Lichts über der Gruppe und blickt wachsam umher.*",
            "*schließt für einen Augenblick die Augen und bittet das Licht um Schutz für alle Anwesenden.*",
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
            "*legt %s kurz die Hand auf die Schulter und spricht leise ein Gebet der Zurückhaltung.*",
            "*zieht mit zwei Fingern ein kleines Zeichen des Lichts vor %s und tritt anschließend einen Schritt zurück.*",
            "*senkt die Stimme und segnet %s mit einer unscheinbaren, beinahe beiläufigen Geste.*",
        },

        gruppe = {
            "Möge der Zorn unserer Feinde an uns vorübergehen.",
            "Lasst andere den Blick des Feindes binden.",
            "Wir wirken, ohne unnötig Aufmerksamkeit zu wecken.",
            "Möge das Licht feindliche Augen von uns ablenken.",
            "*spricht mit gedämpfter Stimme einen Segen und mahnt seine Gefährten mit einer ruhigen Handbewegung zur Zurückhaltung.*",
            "*zeichnet ein kleines Zeichen des Lichts und lässt die Hand danach langsam sinken.*",
            "*wirft einen prüfenden Blick in die Runde und spricht leise ein Gebet über die Gruppe.*",
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
            "*fährt mit der Hand durch die Luft, als würde er unsichtbare Fesseln von %s lösen.*",
            "*greift nach den unsichtbaren Ketten um %s und reißt die Hände mit einer entschlossenen Bewegung auseinander.*",
            "*zeichnet vor %s ein rasches Zeichen des Lichts und weist mit einer offenen Hand nach vorn.*",
        },

        gruppe = {
            "Möge das Licht uns Freiheit schenken.",
            "Nichts soll unseren Weg versperren.",
            "Keine Fessel soll uns halten.",
            "Möge unser Weg frei bleiben.",
            "*breitet die Arme aus und spricht einen Segen über den freien Weg seiner Gefährten.*",
            "*macht mit beiden Händen eine entschlossene, lösende Bewegung und richtet den Blick nach vorn.*",
            "*zeichnet das Zeichen des Lichts und deutet anschließend in die Richtung des Weges vor ihnen.*",
        },
    },


    ["KINGS"] = {
        name = "Segen der Könige",

        ziel = {
            "Möge das Licht Euch mit der Stärke und Weisheit der Könige erfüllen, %s.",
            "Das Licht erhebe Eure Kraft, Euren Geist und Eure Entschlossenheit, %s.",
            "Möge der Segen der Könige auf Euch ruhen, %s.",
            "Tragt die Gunst des Lichts wie eine Krone, %s.",
            "Möge das Licht all Eure Fähigkeiten stärken, %s.",
            "Steht aufrecht und entschlossen. Der Segen der Könige begleitet Euch, %s.",
            "*richtet sich feierlich auf, legt %s die Hand auf die Schulter und spricht einen würdevollen Segen.*",
            "*hebt die Hand über %s und zeichnet langsam ein großes Zeichen des Lichts in die Luft.*",
            "*senkt ehrfürchtig den Kopf und segnet %s mit einer ruhigen, königlichen Geste.*",
            "*legt beide Hände für einen Augenblick aneinander und spricht ein stilles Gebet für %s.*",
        },

        gruppe = {
            "Möge der Segen der Könige auf uns allen ruhen.",
            "Das Licht stärke Körper, Geist und Entschlossenheit unserer Gemeinschaft.",
            "Möge die Gunst des Lichts unsere Reihen erfüllen.",
            "Gemeinsam tragen wir den Segen der Könige.",
            "*richtet sich feierlich auf und hebt beide Hände, während er den Segen der Könige über die Gruppe spricht.*",
            "*zeichnet ein großes Zeichen des Lichts über seinen Gefährten und lässt den Blick langsam über die Reihen wandern.*",
            "*senkt ehrfürchtig das Haupt und spricht einen würdevollen Segen über alle Anwesenden.*",
            "*breitet die Arme aus, als wolle er den Segen des Lichts über die gesamte Gemeinschaft legen.*",
        },
    },
}
