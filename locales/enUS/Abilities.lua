-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.Abilities = {HAMMER_OF_WRATH={name="Hammer of Wrath",ziel={"Judgment comes for you, %s.","*hurls a blessed hammer toward %s.*"},gruppe={"By the Light!"}},LAYONHANDS={name="Lay on Hands",ziel={"Not today, %s. The Light still has need of you.","*places both hands upon %s and pours every reserve of Light into the healing.*"},gruppe={"The Light does not abandon its own."}},DIVINE_SHIELD={name="Divine Shield",gruppe={"The Light is my shield.","*raises a hand as a radiant barrier closes around the body.*"}},
    ["HAMMER_OF_JUSTICE"] = {
        name = "Hammer of Justice",
        ziel = {
            "By the Light, halt, %s!",
            "Your assault ends here, %s!",
            "Not another step, %s.",
            "Stand down, %s, while you still can.",
            "Let this moment teach you restraint, %s.",
            "Justice commands you to stop, %s.",
            "*hurls a radiant hammer of justice at %s.*",
            "*traces a glowing sigil toward %s before a hammer of Light strikes.*",
            "*raises a hand as a golden hammer falls upon %s.*",
            "*summons a shining hammer and directs it at %s.*",
        },
        gruppe = {
            "In the name of the Light, enough!",
            "Let justice still the violence.",
            "*raises a palm as a hammer of Light forms in the air.*",
            "*speaks a solemn judgment beneath a shower of golden sparks.*",
        },
    },

    ["PURIFY"] = {
        name = "Purify",
        ziel = {
            "The Light lift this burden from you, %s.",
            "Hold steady, %s. I will drive this affliction away.",
            "No poison shall weaken your resolve, %s.",
            "Breathe easily, %s. The Light is with you.",
            "Let this corruption trouble you no longer, %s.",
            "*rests a gentle hand on %s and whispers a prayer of purification.*",
            "*traces a bright sigil above %s until the taint begins to fade.*",
            "*kneels beside %s and calls upon cleansing Light.*",
        },
        gruppe = {
            "Let the Light cleanse what weakens us.",
            "Stand firm. This affliction shall pass.",
            "*opens a palm as a soft radiance disperses the lingering corruption.*",
            "*marks the air with a cleansing sign of the Light.*",
        },
    },

    ["CLEANSE"] = {
        name = "Cleanse",
        ziel = {
            "May the Light free you from this enchantment, %s.",
            "Your will is your own, %s. Let no curse bind it.",
            "This blight has no claim upon you, %s.",
            "Be steadfast, %s. I shall break this spell.",
            "Let faith clear the shadow from your spirit, %s.",
            "*raises a hand over %s, calling forth a clear golden glow.*",
            "*speaks an ancient litany as hostile magic unravels around %s.*",
            "*draws a radiant sign before %s and sweeps the curse away.*",
        },
        gruppe = {
            "Where foul magic binds, the Light sets free.",
            "No curse shall bar our path.",
            "*draws a circle of light and banishes the last traces of sorcery.*",
            "*recites a cleansing prayer and lowers the outstretched hand.*",
        },
    },

}
