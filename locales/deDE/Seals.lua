-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

-- Seals data.
-- ==========================================
-- PALADIN RP
-- SIEGEL
-- ==========================================

local _, addon = ...

addon.localeData.deDE.Seals = {

    ["RIGHTEOUSNESS"] = {
        name = "Siegel der Rechtschaffenheit",

        gruppe = {
            "Das Licht führe meine Hand.",
            "Ich erhebe mein Siegel im Namen des Lichts.",
            "Möge meine Hand gerecht geführt werden.",
            "Mein Schlag treffe nur, was das Recht herausfordert.",
            "Möge meine Waffe dem Recht des Lichts dienen.",
            "Gerechtigkeit verlangt einen festen Arm.",
            "Recht ohne Mitgefühl ist nur ein scharfes Schwert.",
            "Ein gerechter Hieb braucht einen ruhigen Geist.",
            "Meine Waffe dient dem Eid, nicht dem Zorn.",
        },
    },

    ["COMMAND"] = {
        name = "Siegel des Befehls",

        gruppe = {
            "Das Licht gebe meinem Schlag seine Kraft.",
            "Im Namen des Lichts.",
            "Möge mein Schlag dem Willen des Lichts entsprechen.",
            "Mein Schlag soll die Reihen des Feindes erschüttern.",
            "Möge das Licht jeden meiner Hiebe leiten.",
            "Für meine Gefährten und gegen unsere Feinde!",
            "Kein Befehl übertönt das Gewissen.",
            "Ich führe diese Waffe, doch der Eid führt mich.",
            "Vorwärts, solange der Mut der Vernunft folgt.",
        },
    },

    ["WISDOM"] = {
        name = "Siegel der Weisheit",

        gruppe = {
            "Möge das Licht meinen Geist führen.",
            "Weisheit vor Zorn. Das Licht sei mein Ratgeber.",
            "Ein besonnener Geist führt die Hand sicher.",
            "Möge ich erkennen, bevor ich handle.",
            "Das Licht lehre mich, wann ich sprechen und wann ich schweigen soll.",
            "Eine kluge Pause kann einen langen Kampf ersparen.",
            "Nicht jedes Problem lässt sich mit dem Hammer richten.",
            "Das Licht gebe mir Urteilskraft, bevor es mir Kraft gibt.",
        },
    },

    ["LIGHT"] = {
        name = "Siegel des Lichts",

        gruppe = {
            "Das Licht sei meine Stärke.",
            "Möge das Licht meine Hand führen.",
            "Im Licht finde ich den Mut, weiterzukämpfen.",
            "Möge meine Kraft aus dem Licht entspringen.",
            "Das Licht verlässt jene nicht, die standhaft bleiben.",
            "Ein Funken Hoffnung kann eine ganze Nacht erhellen.",
            "Ich trage Licht, nicht damit ich glänze, sondern damit andere sehen.",
            "Wo die Schatten länger werden, halte ich die Flamme.",
        },
    },

    ["CRUSADER"] = {
        name = "Siegel des Kreuzfahrers",

        gruppe = {
            "Das Licht führe meinen Weg.",
            "Im Namen des Lichts ziehe ich voran.",
            "Möge das Licht meine Schritte führen.",
            "Mein Weg ist der Weg des Lichts.",
            "Vorwärts im Namen des Lichts.",
            "Kein Hindernis hält jene auf, die ihrem Eid folgen.",
            "Ich weiche nicht von meinem Pfad ab.",
            "Mit festem Schritt dem Ziel entgegen.",
            "Ich ziehe nicht aus, um Recht zu behalten, sondern um Recht zu schützen.",
            "Ein fester Schwur braucht noch festere Stiefel.",
            "Der Weg ist weit. Der Eid reist mit.",
        },
    },

    ["FURY"] = {
        name = "Siegel des Furors",

        gruppe = {
            "Kommt nur. Ich halte stand.",
            "Euer Zorn gilt mir.",
            "Mein Schild steht zwischen Euch und meinen Gefährten.",
            "Das Licht stärkt meinen Schild und meinen Willen.",
            "Richtet Eure Wut gegen mich. Ich bin bereit.",
            "Jeder Schlag gegen mich ist einer weniger gegen meine Gefährten.",
            "Ich weiche nicht. Ihr müsst an mir vorbei.",
            "Mein Zorn schützt jene hinter mir.",
            "An mir vorbei? Versucht es nur. Hinter mir stehen meine Freunde.",
            "Ein Schild aus Stahl. Ein Wille aus Stein. Ein Eid im Licht.",
            "Der Feind soll mich sehen. Meine Gefährten sollen sicher stehen.",
            "Für jeden Schritt, den Ihr näherkommt, halte ich die Linie fester.",
            "Das Licht ist kein sanftes Kissen. Heute ist es ein Bollwerk.",
            "Furor ist nicht blinder Zorn. Furor ist ein Versprechen, standzuhalten.",
            "Wer meine Gefährten bedroht, findet zuerst meinen Hammer.",
            "Der Morgen mag auf sich warten lassen. Mein Schild nicht.",
            "Auch der härteste Sturm findet an diesem Schild sein Ende.",
            "Ich bin das Hindernis zwischen Gefahr und Hoffnung.",
            "Die Ahnen sollen sehen, dass dieser Zwerg nicht weicht.",
            "Für Khaz Modan, für die Gefährten und für den nächsten Morgen!",
            "*stemmt die Stiefel in den Boden und hebt den Schild.*",
            "*zeichnet mit der Faust ein kurzes Zeichen des Lichts auf die Brustplatte.*",
            "*klopft zweimal gegen den Schildrand und stellt sich schützend vor die Reihe.*",
            "*senkt den Schwerpunkt und erwartet den nächsten Ansturm.*",
        },
    },
}

-- Explicit Seal of Wisdom key avoids collision with Blessing of Wisdom.
addon.localeData.deDE.Seals.SEAL_OF_WISDOM = addon.localeData.deDE.Seals.WISDOM
addon.localeData.deDE.Seals.SEAL_OF_JUSTICE = {
    name = "Siegel der Gerechtigkeit",
    gruppe = { "Ein Siegel ist kein Schmuck. Es ist ein Versprechen.", "Heute sollen selbst die schnellen Füße innehalten.", "*zeichnet ein strahlendes Siegel über der erhobenen Waffe.*", "*legt die freie Hand auf den Schwertknauf und spricht einen kurzen Eid.*",
    "Flieht nur. Die Gerechtigkeit hat einen langen Atem.",
    "Ein gerechtes Urteil braucht keine Eile.",
    "Man kann dem Licht den Rücken kehren, aber nicht der Verantwortung.",
    "Mein Hammer ist kein Richter. Mein Eid erinnert mich daran.",
    "Kein schneller Schritt überholt die eigene Schuld.",
    "Ich fordere keine Unterwerfung, sondern dass Ihr innehaltet.",
    "Der Weg der Gerechtigkeit beginnt manchmal mit einem einzigen Halt.",
    "Ein Siegel zum Binden, nicht zum Prahlen.",
    "*zeichnet mit dem Hammer einen goldenen Halbkreis in die Luft.*",
    "*schlägt den Schildrand an und steht unbewegt vor dem Fluchtweg.*",
    "*streicht mit dem Daumen über das leuchtende Siegel am Handschuh.*",
    "*senkt die Waffe einen Augenblick, als würde ein stilles Urteil gesprochen.*",
    },

}
