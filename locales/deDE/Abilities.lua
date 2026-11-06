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



    -- WoW-Forever-Fähigkeiten: zusätzliche, eigenständige RP-Textpools
    HOLY_LIGHT = {
        name = "Heiliges Licht",
        gruppe = { "Es braucht mehr als einen Funken, um Hoffnung zurückzubringen.", "Mögen diese Hände tragen, was mein Schwert nicht retten kann.", "*hebt beide Handflächen, bis sich warmes Licht darin sammelt.*", "*senkt den Kopf und spricht ein langes, ruhiges Heilgebet.*" },
        ziel = { "Bleibt bei uns, %s. Das Licht hat Eure Geschichte noch nicht zu Ende erzählt.", "Vertraut mir einen Augenblick, %s. Der nächste Atemzug gehört Euch." },
    },

    REDEMPTION = {
        name = "Erlösung",
        gruppe = { "Es gibt Abschiede, denen das Licht noch widerspricht.", "Kehre zurück, tapfere Seele. Hier warten noch Stimmen auf dich.", "*kniet neben dem Gefallenen und legt das Schwert sorgfältig beiseite.*", "*schließt die Augen und hält beide Hände über einer reglosen Gestalt.*" },
        ziel = { "%s, hört meine Stimme. Noch ist Euer Platz unter uns.", "Möge der Weg zurück sanft sein, %s. Wir warten." },
    },

    CONSECRATION = {
        name = "Weihe",
        gruppe = { "Dieser Boden soll heute niemandem Schutz vor der Wahrheit bieten.", "Wo wir stehen, sollen Mut und Gerechtigkeit Wurzeln schlagen.", "*zeichnet mit dem Schwert eine leuchtende Grenze in den Staub.*", "*rammt die Ferse in die Erde und weiht den Kampfplatz mit einem Gebet.*" },
    },

    EXORCISM = {
        name = "Exorzismus",
        gruppe = { "Was die Verderbnis nährt, soll dem Licht nicht länger trotzen.", "Selbst uralte Schatten fürchten den Morgen.", "*streckt die freie Hand aus und schleudert einen gleißenden Strahl vorwärts.*", "*zieht ein heiliges Zeichen und spricht die Silben der Vertreibung.*" },
        ziel = { "%s, Eure Finsternis hat hier kein Bleiberecht.", "Weicht zurück, %s. Das Licht erkennt, was Ihr geworden seid." },
    },

    FLASH_OF_LIGHT = {
        name = "Lichtblitz",
        gruppe = { "Keine Zeit für eine Predigt. Nur für ein Wunder.", "Ein kurzer Lichtstrahl, ein weiterer Augenblick Hoffnung.", "*schließt die Finger zu einem kleinen, hellen Heilzeichen.*", "*berührt rasch die Schulter eines Gefährten und lässt Licht aufblitzen.*" },
        ziel = { "Haltet durch, %s. Ich bin schon bei Euch.", "Nur einen Atemzug, %s. Dann könnt Ihr weiterkämpfen." },
    },

    VOICE_OF_TRUTH = {
        name = "Stimme der Wahrheit",
        gruppe = { "Man darf meine Stimme prüfen. Zum Schweigen bringen lässt sie sich nicht.", "Die Wahrheit braucht keinen lauten Zeugen.", "*richtet sich auf und spricht den nächsten Satz mit fester Stimme.*", "*berührt das heilige Symbol am Hals und sammelt sich.*" },
    },

    TURN_UNDEAD = {
        name = "Untote vertreiben",
        gruppe = { "Kehrt um, ihr rastlosen Schatten. Diese Lebenden gehören euch nicht.", "Ein Grab ist kein Freibrief für Grausamkeit.", "*erhebt das geweihte Symbol und spricht die Worte der Abwehr.*", "*zieht einen strahlenden Kreis zwischen sich und die Finsternis.*" },
        ziel = { "Zurück, %s. Euer Weg endet vor diesem Licht.", "%s, keine weitere Seele soll Eurem Hunger folgen." },
    },

    HOLY_SHOCK = {
        name = "Heiliger Schock",
        gruppe = { "Das Licht kann retten. Es kann auch aufrütteln.", "Nicht jeder Blitz kündigt ein Gewitter an.", "*reißt eine Hand empor, als ein kurzer Lichtfunke hervorschießt.*", "*bündelt heilige Energie in einer einzigen schnellen Geste.*" },
        ziel = { "Ein Lichtstrahl für Euch, %s. Was er bringt, entscheidet der Augenblick.", "%s, das Licht lässt sich nicht auf eine einzige Antwort festlegen." },
    },

    LIGHT_WATCH = {
        name = "Lichtwacht",
        gruppe = { "Ich halte mein Versprechen, auch wenn meine Augen müde werden.", "Wo die Wacht beginnt, endet die Einsamkeit.", "*zeichnet ein kleines leuchtendes Schutzzeichen in die Luft.*", "*legt zwei Finger an das Herz und spricht einen Wachseid.*" },
        ziel = { "%s, mein Licht bleibt bei Euch, auch wenn wir getrennt stehen.", "Vertraut auf dieses Zeichen, %s. Ihr seid nicht allein." },
    },

    HOLY_WRATH = {
        name = "Heiliger Zorn",
        gruppe = { "Der Sturm des Lichts fragt nicht nach der Zahl seiner Feinde.", "Wenn die Schatten uns umringen, antworten wir von allen Seiten.", "*breitet die Arme aus, während goldene Funken den Boden umkreisen.*", "*stößt die Waffe empor und ruft eine Welle gleißender Macht hervor.*" },
    },

    DIVINE_FAVOR = {
        name = "Göttliche Gunst",
        gruppe = { "Manchmal ist die kleinste Hoffnung genau genug.", "Das Licht möge meine nächste Entscheidung führen.", "*hält inne, bis der Atem ruhig und die Hand vollkommen still ist.*", "*zeichnet ein goldenes Zeichen auf die eigene Handfläche.*" },
    },

    OATH_OF_LIGHT = {
        name = "Eid des Lichts",
        gruppe = { "Ein Eid gilt besonders dann, wenn niemand mehr zuhört.", "Was ich beschütze, lasse ich nicht achtlos fallen.", "*legt die Hand auf das Herz und schwört ein stilles Versprechen.*", "*kniet kurz nieder, bevor die Wache von Neuem beginnt.*" },
        ziel = { "%s, ich verspreche, nicht wegzusehen, wenn Ihr mich braucht.", "Dieser Eid gilt Euch, %s. Nicht meinem Ruhm." },
    },

    DIVINE_PROTECTION = {
        name = "Göttlicher Schutz",
        gruppe = { "Ein Schild aus Licht ist keine Ausrede, die Pflicht zu vergessen.", "Heute lasse ich mir einen Augenblick zum Durchatmen.", "*stellt den Schild vor sich und versenkt die Waffe in hellem Glanz.*", "*schließt die Augen, während ein schützender Schein die Rüstung umgibt.*" },
    },

    DIVINE_INTERVENTION = {
        name = "Göttliches Eingreifen",
        gruppe = { "Es gibt Opfer, die man nicht abwägt, sondern trägt.", "Wenn nur einer heimkehrt, soll es der sein, der weiterhelfen kann.", "*senkt das Haupt und zeichnet mit zitternder Hand ein Schutzsiegel.*", "*spricht ein letztes Gebet und legt die Hand an die Brust.*" },
        ziel = { "%s, nehmt diesen Schutz. Ich habe meinen Entschluss gefasst.", "Eure Geschichte geht weiter, %s. Das ist alles, worum ich bitte." },
    },

    HOLY_SHIELD = {
        name = "Heiliger Schild",
        gruppe = { "Jeder Schlag auf meinen Schild ist einer weniger gegen die Meinen.", "Wer Schutz verspricht, muss auch standhalten.", "*schlägt den Schildrand auf den Boden und ruft einen goldenen Schimmer hervor.*", "*hebt die Schildfläche, auf der sich leuchtende Runen entzünden.*" },
    },

    HAMMER_OF_THE_RIGHTEOUS = {
        name = "Hammer der Rechtschaffenen",
        gruppe = { "Gerechtigkeit trifft nicht nur den, der am lautesten droht.", "Mein Hammer unterscheidet nicht nach Größe der Prahlerei.", "*führt die Waffe in einem weiten, kontrollierten Bogen.*", "*setzt einen schweren Hieb, während Licht über die Schneide zuckt.*" },
        ziel = { "%s, stellt Euch meinem Schild und meiner Entscheidung.", "Ihr seid nicht der Einzige hier, %s. Aber Ihr steht im Weg." },
    },

    SACRIFICE = {
        name = "Segen der Opferung",
        gruppe = { "Eine Last wird leichter, wenn man sie zu zweit trägt.", "Ich verspreche keinen schmerzlosen Weg. Nur, dass Ihr ihn nicht allein geht.", "*zieht mit dem Handschuh ein Segenszeichen zwischen zwei Rüstungen.*", "*nickt entschlossen und legt die Hand auf das eigene Herz.*" },
        ziel = { "%s, was Euch trifft, werde ich mittragen.", "Haltet Stand, %s. Diesen Preis bezahlt Ihr nicht allein." },
    },

    TEMPLARS_BULWARK = {
        name = "Bollwerk des Templers",
        gruppe = { "Bis hierher und keinen Schritt weiter.", "Ein guter Schild besteht nicht aus Stahl allein.", "*rammt den Schild entschlossen vor sich auf den Boden.*", "*richtet sich unter einer gleißenden Schutzkuppel auf.*" },
    },

    SWIFT_JUDGEMENT = {
        name = "Schnelles Richturteil",
        gruppe = { "Ein Urteil soll klar sein, nicht langsam.", "Wo Unrecht wiederkehrt, antworte ich ohne Zögern.", "*zieht das Schwert in einer einzigen geschlossenen Bewegung.*", "*spricht ein kurzes Gebet und bündelt seinen Entschluss.*" },
    },

    JUDGEMENT = {
        name = "Richturteil",
        gruppe = { "Das Urteil des Lichts ist kein Flüstern.", "Ein Siegel trägt ein Versprechen. Jetzt wird es eingelöst.", "*streckt die Waffe vor und lässt ein goldenes Zeichen aufglühen.*", "*schlägt mit der Faust gegen den Schild und spricht ein unmissverständliches Urteil.*" },
        ziel = { "%s, das Licht hat Eure Taten nicht übersehen.", "Empfangt mein Richturteil, %s. Möge es Euch zur Besinnung bringen." },
    },

    HOLY_STRIKE = {
        name = "Heiliger Stoß",
        gruppe = { "Mein Schwert führt den Schlag. Mein Gewissen bestimmt das Ziel.", "Die Kraft des Lichts braucht keinen Zorn.", "*setzt einen kurzen, präzisen Hieb, begleitet von einem Lichtblitz.*", "*verlagert das Gewicht nach vorn und lässt die Waffe aufleuchten.*" },
        ziel = { "%s, dieser Stoß gehört nicht dem Hass, sondern der Gerechtigkeit.", "Haltet dagegen, %s. Das Licht gibt meinem Arm die Richtung." },
    },

    REPENTANCE = {
        name = "Buße",
        gruppe = { "Manchmal braucht die Umkehr mehr Mut als der Angriff.", "Legt den Hochmut nieder. Das ist schwerer als jede Waffe.", "*senkt die Waffe und öffnet die Hand in einer mahnenden Geste.*", "*zeichnet ein stilles Zeichen und wartet auf einen Augenblick Einsicht.*" },
        ziel = { "%s, erkennt Eure Taten, bevor Ihr sie wiederholt.", "Haltet inne, %s. Vielleicht ist es noch nicht zu spät." },
    },

    SUMMON_WARHORSE = {
        name = "Schlachtross beschwören",
        gruppe = { "Der Weg ist weit. Gut, dass wir nicht zu Fuß streiten müssen.", "Selbst ein heiliger Ritter braucht gelegentlich vier Hufe.", "*pfeift sein Schlachtross herbei und überprüft den Sattelgurt.*", "*streicht einem ankommenden Ross beruhigend über die Mähne.*" },
    },

    SUMMON_CHARGER = {
        name = "Streitross beschwören",
        gruppe = { "Für die lange Straße und den nächsten gerechten Kampf.", "Ein stolzes Ross trägt mehr als Rüstung. Es trägt Vertrauen.", "*ruft sein Streitross mit einem feierlichen Zeichen herbei.*", "*prüft den Sattel und richtet die Zügel mit geübter Hand.*" },
    },
}
