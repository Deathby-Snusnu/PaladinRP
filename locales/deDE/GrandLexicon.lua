-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Ergänzende deutsche RP-Texte. Bestehende Sammlungen bleiben unverändert.
-- Gesprochenes ohne Markierung, *Handlungen* für /me.
local _, addon = ...

local function addUnique(pool, text)
    if type(pool) ~= "table" then return end
    for _, old in ipairs(pool) do
        if old == text then return end
    end
    pool[#pool + 1] = text
end

local lexicon = {
    MIGHT = {"Möge Eure Kraft dem Schutz der Wehrlosen dienen, %s.", "*legt %s die Hand auf die Schulter und spricht einen kraftvollen Segen.*"},
    WISDOM = {"Möge Eure Einsicht heller strahlen als jede Klinge, %s.", "*berührt die Stirn von %s mit zwei Fingern und murmelt einen Segen der Weisheit.*"},
    PROTECTION = {"Hinter meinem Schild steht Ihr nicht allein, %s.", "*zieht vor %s ein schützendes Zeichen in die Luft.*"},
    SALVATION = {"Möge Euer Weg ohne unnötigen Zorn verlaufen, %s.", "*senkt vor %s beschwichtigend die Hand und bittet um Frieden.*"},
    FREEDOM = {"Keine Fessel soll Euren Willen binden, %s.", "*zeichnet über %s einen lichten Kreis, der sich wie eine gelöste Kette öffnet.*"},
    KINGS = {"Geht aufrecht, %s. Würde verlangt keine Krone.", "*neigt vor %s das Haupt und spendet einen feierlichen Segen.*"},
    RIGHTEOUSNESS = {"Meine Klinge ist kein Urteil ohne Gewissen.", "*richtet die Waffe auf und hält einen Augenblick in sich.*"},
    COMMAND = {"Wo Worte scheitern, soll meine Tat für das Licht sprechen.", "*hebt die Waffe und lässt den Segen des Befehls darüber aufleuchten.*"},
    CRUSADER = {"Meine Schritte mögen entschlossen sein, mein Urteil aber bedacht.", "*legt die Hand auf das Wappen und macht sich kampfbereit.*"},
    FURY = {"Die Glut des Eifers darf mein Gewissen nicht verzehren.", "*spannt die Schultern, während heilige Energie um die Waffe flackert.*"},
    LIGHT = {"Ein Funke genügt, wenn die Dunkelheit zu groß erscheint.", "*lässt einen sanften Lichtschein über der geöffneten Hand entstehen.*"},
    DEVOTION = {"Solange dieser Schild steht, habt Ihr einen Zufluchtsort.", "*stellt sich fester hin und richtet die Schildkante zur Bedrohung.*"},
    RETRIBUTION = {"Ich suche keinen Streit. Doch ich werde ihn beenden.", "*schlägt mit dem Knauf der Waffe einmal fest gegen den Schildrand.*"},
    CONCENTRATION = {"Hört auf den Atem, nicht auf das Getöse.", "*schließt kurz die Augen und findet mitten im Lärm zur Ruhe.*"},
    SHADOW = {"Selbst die tiefste Finsternis soll uns nicht auseinanderbringen.", "*zeichnet ein schimmerndes Schutzzeichen gegen die Schatten.*"},
    FIRE = {"Feuer prüft Stahl und Mut gleichermaßen.", "*hält die Hand gegen eine eingebildete Flamme und ruft schützendes Licht.*"},
    FROST = {"Kalter Wind mag unsere Wangen schneiden, nicht unseren Zusammenhalt.", "*zieht den Umhang fester und lässt einen warmen Schimmer über die Gefährten ziehen.*"},
    HAMMER = {"Nicht Zorn führt diesen Wurf, sondern Entschlossenheit.", "*schleudert einen Hammer aus gebündeltem Licht auf den Feind.*"},
    LAYONHANDS = {"Bleibt bei mir, %s. Das Licht hat Euch noch nicht aufgegeben.", "*kniet neben %s nieder und legt beide Hände behutsam auf die Wunden.*"},
    DIVINE_SHIELD = {"Manchmal braucht selbst ein Schild einen Schild.", "*spannt eine strahlende Kuppel um sich und steht unbeirrt weiter.*"},
}

local containers = { "Blessings", "GreaterBlessings", "Auras", "Seals", "Abilities" }
for _, containerName in ipairs(containers) do
    local container = addon.localeData.deDE[containerName]
    if type(container) == "table" then
        for key, lines in pairs(lexicon) do
            local node = container[key]
            if not node and containerName == "GreaterBlessings" then
                node = container["GREATER_" .. key]
            end
            if type(node) == "table" then
                local pool = node.ziel or node.gruppe
                if type(pool) == "table" then
                    for _, phrase in ipairs(lines) do
                        if phrase:find("%s", 1, true) then
                            if type(node.ziel) == "table" then addUnique(node.ziel, phrase) end
                        elseif type(node.gruppe) == "table" then
                            addUnique(node.gruppe, phrase)
                        end
                    end
                end
            end
        end
    end
end

local ambient = {
    PRAYER = {
        "*verharrt einen Herzschlag lang schweigend, bevor ein leises Gebet über die Lippen kommt.*",
        "Das Licht schuldet mir keine Antwort. Ich schulde ihm meinen Mut.",
        "Nicht um Ruhm bitte ich, sondern um die Kraft, das Richtige zu tun.",
        "*zeichnet mit zwei Fingern ein kaum sichtbares Segenszeichen in die Luft.*",
    },
    OATH = {
        "Mein Schild soll zuerst denen Schutz bieten, die hinter ihm Zuflucht suchen.",
        "Ein Schwur wird nicht wahr, weil man ihn laut ausspricht.",
        "*prüft den Sitz des Wappenrocks und umfasst den Schildriemen fester.*",
        "Ich will nicht unfehlbar sein. Ich will verlässlich sein.",
    },
    REFLECTION = {
        "Ein Feind, der die Waffe senkt, muss nicht mein Feind bleiben.",
        "*betrachtet eine Schramme im Brustharnisch und schweigt nachdenklich.*",
        "Vielleicht braucht heute jemand mein Ohr dringender als mein Schwert.",
        "Gerechtigkeit ohne Barmherzigkeit wird schnell zum Hochmut.",
    },
    VIGIL = {
        "Die Nacht gehört nicht allein denen, die im Dunkeln lauern.",
        "*geht die Reihe der schlafenden Gefährten ab und kontrolliert die Feuerstelle.*",
        "Schlaft ruhig. Ich halte Ausschau.",
        "*prüft den Horizont und lockert vorsichtig die steifen Finger am Schwertgriff.*",
    },
    BLESSING = {
        "Möge der nächste Schritt leichter sein als der letzte.",
        "*legt einem erschöpften Gefährten kurz die Hand auf die Schulter.*",
        "Das Licht begleite uns, auch wenn der Weg keine Abkürzung kennt.",
        "*zieht langsam ein Segenszeichen über dem Lagerfeuer.*",
    },
}
for category, texts in pairs(ambient) do
    local pool = addon.localeData.deDE.ambient and addon.localeData.deDE.ambient[category]
    if type(pool) == "table" then
        for _, phrase in ipairs(texts) do addUnique(pool, phrase) end
    end
end

local racial = {
    Dwarf = {"Bei Stein und Stahl: Das Licht lässt keinen Kameraden zurück.", "*streicht über die Runen am Schild und prüft die Kante der Axt.*"},
    Human = {"Kein König und kein Banner stehen über dem Gewissen.", "*richtet den Wappenrock und nickt den Gefährten aufmunternd zu.*"},
    Undead = {"Auch eine kalte Hand kann Schutz gewähren.", "*betrachtet die knöchernen Finger und schließt sie entschlossen um den Schildriemen.*"},
    BloodElf = {"Wahrer Glanz liegt in Taten, nicht in vergoldeter Rüstung.", "*glättet den Wappenrock und erhebt würdevoll das Haupt.*"},
    Draenei = {"Auf langen Wegen trägt Hoffnung weiter als jede Karte.", "*legt die Hand an das Symbol des Glaubens und blickt zum Horizont.*"},
    Tauren = {"Stärke heißt, den eigenen Schritt vor den Schwachen zu setzen.", "*senkt ehrfürchtig den Kopf und lauscht dem Wind.*"},
    NightElf = {"Auch im Schatten der alten Bäume kann ein Licht bewahrt werden.", "*legt die Fingerspitzen an die Rinde eines nahen Baumes.*"},
    Gnome = {"Ein guter Plan schützt mehr Leben als zehn große Reden.", "*prüft gewissenhaft die Schnallen der viel zu schweren Rüstung.*"},
    Troll = {"Ein Schwur braucht kein schönes Wort, wenn er gehalten wird.", "*klopft mit den Fingern einen ruhigen Takt gegen den Schild.*"},
    Orc = {"Ehre misst sich daran, wen wir verschonen.", "*stellt die Füße fest auf den Boden und hebt das Kinn.*"},
    Goblin = {"Ein gerettetes Leben ist mehr wert als jedes Geschäft.", "*zählt die Verbandsrollen und steckt eine zusätzliche ein.*"},
    Worgen = {"Der Zorn mag in mir knurren. Entscheiden werde dennoch ich.", "*streckt die Krallen und schließt die Hand langsam zur Faust.*"},
    Pandaren = {"Geduld ist kein Rückzug, sondern eine Form von Stärke.", "*atmet tief durch und neigt höflich den Kopf.*"},
    Skyborne = {"Auch hoch über den Wolken tragen wir Verantwortung füreinander.", "*lässt den Blick in die Ferne schweifen und legt die Hand aufs Herz.*"},
}
for race, texts in pairs(racial) do
    local racePool = addon.localeData.deDE.ambientRacial and addon.localeData.deDE.ambientRacial[race]
    if racePool == nil and type(addon.localeData.deDE.ambientRacial) == "table" then
        racePool = {}
        addon.localeData.deDE.ambientRacial[race] = racePool
    end
    if type(racePool) == "table" then
        for _, category in ipairs({"PRAYER", "OATH", "REFLECTION", "VIGIL", "BLESSING"}) do
            if type(racePool[category]) ~= "table" then
                racePool[category] = {}
                local genericPool = addon.localeData.deDE.ambient
                    and addon.localeData.deDE.ambient[category]
                if type(genericPool) == "table" then
                    for _, phrase in ipairs(genericPool) do
                        addUnique(racePool[category], phrase)
                    end
                end
            end
            for _, phrase in ipairs(texts) do addUnique(racePool[category], phrase) end
        end
    end
end
