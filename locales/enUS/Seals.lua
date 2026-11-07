-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.Seals = {RIGHTEOUSNESS={name="Seal of Righteousness",gruppe={"Let righteousness guide my hand."}},COMMAND={name="Seal of Command",gruppe={"By the Light, I command my strength."}},WISDOM={name="Seal of Wisdom",gruppe={"May wisdom temper every strike."}},LIGHT={name="Seal of Light",gruppe={"The Light travels with every blow."}},CRUSADER={name="Seal of the Crusader",gruppe={"The crusade continues."}},FURY={name="Seal of Fury",gruppe={"Let righteous fury hold their gaze."}}}

-- Explicit Seal of Wisdom key avoids collision with Blessing of Wisdom.
addon.localeData.enUS.Seals.SEAL_OF_WISDOM = addon.localeData.enUS.Seals.WISDOM
addon.localeData.enUS.Seals.SEAL_OF_JUSTICE = {
    name = "Seal of Justice",
    gruppe = { "A seal is no decoration. It is a promise.", "Today even the swiftest feet shall pause.", "*draws a radiant seal over the raised weapon.*", "*rests an open hand on the sword's hilt and swears a brief oath.*" },
}
