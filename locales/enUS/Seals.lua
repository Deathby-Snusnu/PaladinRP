-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.Seals = {RIGHTEOUSNESS={name="Seal of Righteousness",gruppe={"Let righteousness guide my hand.","Justice without mercy is merely a sharpened blade.","A righteous blow demands a steady mind.","My weapon serves the oath, never anger.","Let the Light weigh my actions before my enemies do."}},COMMAND={name="Seal of Command",gruppe={"By the Light, I command my strength.","No command should drown out conscience.","I wield this weapon, yet my oath guides me.","Forward, while courage still heeds good sense.","A steady voice can rally stronger than a shout."}},WISDOM={name="Seal of Wisdom",gruppe={"May wisdom temper every strike.","A thoughtful pause may spare a long battle.","Not every problem yields to a hammer.","May the Light grant judgment before it grants strength.","Even a paladin should listen twice before striking."}},LIGHT={name="Seal of Light",gruppe={"The Light travels with every blow.","One spark of hope can illuminate the longest night.","I carry Light so others can see, not so I may shine.","When shadows lengthen, I guard the flame.","May this glow reach those who need it most."}},CRUSADER={name="Seal of the Crusader",gruppe={"The crusade continues.","I travel to defend what is right, not merely to be right.","A sturdy oath needs sturdier boots.","The road is long. My vow travels with me.","Let every step be worthy of the banner."}},FURY={name="Seal of Fury",gruppe={
            "Let righteous fury hold their gaze.",
            "Try to pass me. My friends stand behind this shield.",
            "A shield of steel. A will of stone. An oath in the Light.",
            "Let the enemy see me. Let my companions stand safe.",
            "With every step you take, my line holds firmer.",
            "The Light is no soft pillow. Today it is a bulwark.",
            "Fury is not blind anger. It is a promise to stand fast.",
            "Threaten my companions, and you meet my hammer first.",
            "The dawn may be late. My shield will not be.",
            "Even the fiercest storm breaks against this shield.",
            "I am the barrier between danger and hope.",
            "May the ancestors see that I do not yield.",
            "For Khaz Modan, for our companions, and for another dawn!",
            "*plants both boots and raises the shield.*",
            "*traces a brief sign of the Light upon the breastplate.*",
            "*taps the shield rim twice and steps before the line.*",
            "*lowers their stance and braces for the next charge.*",
        }}}

-- Explicit Seal of Wisdom key avoids collision with Blessing of Wisdom.
addon.localeData.enUS.Seals.SEAL_OF_WISDOM = addon.localeData.enUS.Seals.WISDOM
addon.localeData.enUS.Seals.SEAL_OF_JUSTICE = {
    name = "Seal of Justice",
    gruppe = { "A seal is no decoration. It is a promise.", "Today even the swiftest feet shall pause.", "*draws a radiant seal over the raised weapon.*", "*rests an open hand on the sword's hilt and swears a brief oath.*",
    "Run if you must. Justice is patient.",
    "A fair judgment has no need to hurry.",
    "You may turn from the Light, but not from responsibility.",
    "My hammer is not a judge. My oath reminds me of that.",
    "No swift stride can outrun one's own guilt.",
    "I ask not for surrender, but for a moment of stillness.",
    "The road to justice sometimes starts with a single halt.",
    "A seal to restrain, not to boast.",
    "*traces a golden crescent through the air with the hammer.*",
    "*taps the shield rim and stands firm across the escape route.*",
    "*runs a thumb across the luminous seal on a gauntlet.*",
    "*lowers the weapon for a moment, as though hearing a silent verdict.*",
    },

}
