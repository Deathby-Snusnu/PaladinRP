-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- Racial data.
-- ==========================================
-- PALADIN RP
-- RASSEN-SPEZIFISCHE TEXTE
-- ==========================================

local _, addon = ...

addon.localeData.deDE.Racial = {

    ["Dwarf"] = {

        ["MIGHT"] = {
            "Das Licht gebe Euch Macht und Stärke, %s.",
            "Möge Euer Arm so fest wie Zwergenstahl sein, %s.",
            "Möge das Licht Euren Hammer führen, %s.",
            "Möge Eure Kraft so beständig sein wie der Stein, %s.",
            "Mit zwergischer Standhaftigkeit und dem Segen des Lichts, %s.",
            "Möge Euch die Stärke der Berge begleiten, %s.",
        },

        ["WISDOM"] = {
            "Das Licht gebe Euch Weisheit, %s.",
            "Möge Euer Verstand scharf wie eine frisch geschliffene Axt sein, %s.",
            "Möge Euer Urteil fest wie Stahl sein, %s.",
            "Möge Euer Rat so verlässlich sein wie Zwergenstahl, %s.",
            "Ein klarer Blick findet auch im tiefsten Berg den Weg, %s.",
            "Möge das Licht Eure Gedanken schärfen, %s.",
        },

        ["CRUSADER"] = {
            "Das Licht führe meinen Weg. Der Hammer folgt.",
            "Vorwärts. Licht im Herzen, Stahl in der Hand.",
            "Möge das Licht meine Schritte führen und mein Hammer den Rest erledigen.",
            "Ein Zwerg kennt seinen Weg. Das Licht zeigt ihn.",
            "Beim Stein unter meinen Füßen: Ich weiche nicht zurück.",
            "Der Weg ist weit, doch meine Schritte sind fest.",
            "Vorwärts, mit dem Licht im Herzen und Stahl in der Hand!",
        },

        ["RIGHTEOUSNESS"] = {
            "Das Licht führe meine Hand. Mein Hammer folgt.",
            "Recht und Ordnung. Der Hammer sorgt für Nachdruck.",
            "Möge meine Hand fest und mein Urteil gerecht sein.",
            "Das Licht urteilt. Mein Hammer setzt den Punkt.",
            "Mein Wort sei fest und mein Urteil gerecht.",
            "Kein Unrecht soll sich hinter Stein und Stahl verbergen.",
            "Möge meine Hand so standhaft sein wie mein Entschluss.",
        },

        ["FURY"] = {
            "Das Licht führe meinen Zorn. Mein Schild hält stand.",
            "Kommt nur. Zwergenstahl gibt nicht nach.",
            "Ein wütender Zwerg ist schwer zu übersehen.",
            "Mein Schild steht. Mein Hammer wartet.",
            "Euer Zorn gilt mir. Meine Gefährten bleiben stehen.",
            "Beim Stein unter meinen Füßen: Hier kommt Ihr nicht vorbei.",
            "Möge mein Zorn enden, sobald die Gefahr gebannt ist.",
        },
    },

    ["Human"] = {

        ["MIGHT"] = {
            "Das Licht gebe Euch Macht und Stärke, %s.",
            "Möge das Licht Euren Arm stärken, %s.",
            "Möge Euer Mut Euch ebenso stärken wie das Licht, %s.",
            "Geht mit Zuversicht und der Kraft des Lichts, %s.",
            "Möge Eure Stärke denen dienen, die Schutz brauchen, %s.",
        },

        ["WISDOM"] = {
            "Das Licht gebe Euch Weisheit, %s.",
            "Möge das Licht Euren Verstand führen, %s.",
            "Möge das Licht Euren Weg und Euer Urteil erhellen, %s.",
            "Lasst Besonnenheit Euren nächsten Schritt bestimmen, %s.",
            "Möge Euch die Weisheit helfen, das Rechte zu erkennen, %s.",
        },

        ["CRUSADER"] = {
            "Im Namen des Lichts schreite ich voran.",
            "Pflicht vor Furcht. Der Weg liegt vor mir.",
            "Möge das Licht meine Schritte auf dem rechten Pfad halten.",
            "Für jene, die hinter mir stehen, gehe ich voran.",
            "Mein Eid weist mir den Weg.",
            "Das Licht vor Augen, die Pflicht im Herzen.",
        },

        ["RIGHTEOUSNESS"] = {
            "Möge mein Urteil gerecht und meine Hand sicher sein.",
            "Das Recht verlangt Standhaftigkeit.",
            "Das Licht führe meine Hand, nicht mein Zorn.",
            "Pflicht, Maß und ein fester Entschluss.",
            "Ich handle nicht aus Rache, sondern aus Pflicht.",
            "Möge mein Schlag dem Schutz der Wehrlosen dienen.",
        },

        ["FURY"] = {
            "Euer Zorn gilt mir. Lasst meine Gefährten aus dem Spiel.",
            "Ich halte stand. Kommt.",
            "Das Licht stärkt meinen Schild und meinen Willen.",
            "Kein Schritt zurück.",
            "Solange ich stehe, weiche ich nicht.",
            "Richtet Eure Wut gegen mich. Ich bin bereit.",
        },
    },

    ["Undead"] = {

        ["MIGHT"] = {
            "Möge das Licht Euch Kraft verleihen, %s. Nehmt sie an.",
            "Der Tod hat Stärke nicht bedeutungslos gemacht, %s.",
            "Möge Eure Hand fest bleiben, %s. Selbst wenn das Licht prüft.",
            "Tragt diese Kraft mit Bedacht, %s.",
            "Das Licht stärkt auch jene, die den Tod bereits kennen, %s.",
            "Möge Euer Wille stärker sein als jede Furcht, %s.",
        },

        ["WISDOM"] = {
            "Möge das Licht Euren Geist schärfen, %s.",
            "Wer den Tod kennt, sollte das Leben mit Bedacht führen, %s.",
            "Möge Klarheit Euch begleiten, %s. Illusionen hatten wir genug.",
            "Das Licht zeige Euch, was im Schatten verborgen liegt, %s.",
            "Ein kühler Geist urteilt besser als ein heißes Herz, %s.",
            "Möge Euch Erkenntnis leiten, %s. Nicht Hoffnung allein.",
        },

        ["CRUSADER"] = {
            "Der Tod hat meinen Eid nicht gebrochen.",
            "Das Licht findet selbst durch die Gruft seinen Weg.",
            "Ich kenne die Finsternis. Darum fürchte ich sie nicht.",
            "Mein Weg endete einmal. Dieser hier noch nicht.",
            "Vorwärts. Ich habe schon Schlimmeres als den Tod gesehen.",
            "Mein Eid lebt weiter, auch wenn ich es nicht mehr tue.",
            "Das Licht führt. Ich folge, so lange es nötig ist.",
        },

        ["RIGHTEOUSNESS"] = {
            "Der Tod entbindet mich nicht von meinem Eid.",
            "Ich kenne Unrecht. Ich trage seine Narben.",
            "Das Licht richte meine Hand, nicht meine Bitterkeit.",
            "Gerechtigkeit endet nicht am Grab.",
            "Möge mein Urteil kälter sein als mein Zorn.",
            "Ich diene dem Recht, nicht der Rache.",
            "Die Finsternis kennt mich. Sie besitzt mich nicht.",
        },

        ["FURY"] = {
            "Kommt nur. Ich bin schwerer loszuwerden, als Ihr glaubt.",
            "Euer Zorn gilt mir. Ich kenne Schlimmeres.",
            "Mein Schild hält. Der Rest von mir meistens auch.",
            "Ich habe den Tod überstanden. Ihr beeindruckt mich wenig.",
            "Richtet Eure Wut gegen mich. Meine Gefährten haben Besseres zu tun.",
            "Das Licht brennt. Ich halte trotzdem stand.",
            "Noch einmal sterbe ich heute nicht.",
        },
    },
}

-- Editorial expansion: dwarven oaths, workmanlike faith and restrained humor.
local dwarf = addon.localeData.deDE.Racial.Dwarf
for _, line in ipairs({
    "Ein Segen ersetzt keine Übung. Aber er hilft, wenn die Hände müde werden.",
    "*legt die schwielige Hand an den Unterarm des Gefährten und spricht einen knappen Segen.*",
    "Haltet den Schild hoch. Ich kümmere mich um den Rest des Gebets.",
    "Meine Ahnen hatten keinen leichten Weg. Sie gingen ihn trotzdem.",
}) do table.insert(dwarf.MIGHT, line) end
for _, line in ipairs({
    "Ein Eid ist schnell gesprochen. Ich bevorzuge es, ihn einzulösen.",
    "*prüft den Sitz des Schildriemens und setzt sich dann in Bewegung.*",
    "Wer hinter mir steht, kommt wieder heim. Darauf könnt Ihr mich festnageln.",
}) do table.insert(dwarf.CRUSADER, line) end


-- Editorial pass II: contrasting interpretations of service and devotion.
local voices = addon.localeData.deDE.Racial
local additions = {
    Dwarf = {
        MIGHT = {
            "Ich kann Euch keinen leichteren Weg segnen. Nur stärkere Beine dafür.",
            "*fasst seinen Gefährten kurz am Unterarm und spricht einen rauen Segen.*",
        },
        FURY = {
            "Der Schild ist aus Stahl. Das Versprechen dahinter ist härter.",
            "*stellt den Schild so, dass zwischen ihm und den Gefährten kein Spalt bleibt.*",
            "Wenn Ihr Streit sucht, fangt bei mir an. Die anderen haben zu tun.",
        },
        WISDOM = {
            "Mein Großvater sagte: Erst denken, dann schlagen. Meistens hatte er recht.",
            "*reibt sich nachdenklich über den Bart und spricht einen kurzen Segen.*",
        },
    },
    Human = {
        MIGHT = {
            "Eure Stärke hat ihren Wert dort, wo jemand auf sie angewiesen ist.",
            "*verneigt sich knapp und legt dem Gefährten die Hand auf die Schulter.*",
        },
        CRUSADER = {
            "Ein Eid gilt besonders dann, wenn keiner zusieht.",
            "*richtet das Wappen auf seiner Brust und tritt aus der Reihe nach vorn.*",
        },
    },
}
for race, spells in pairs(additions) do
    for key, lines in pairs(spells) do
        local entry = voices[race] and voices[race][key]
        if type(entry) == "table" then
            for _, line in ipairs(lines) do table.insert(entry, line) end
        end
    end
end
