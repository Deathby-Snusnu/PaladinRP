-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.Racial = {
    Dwarf = {
        MIGHT={"May the Light grant you strength, %s.","May your arm be steady as dwarven steel, %s.","May the strength of the mountains go with you, %s."},
        WISDOM={"May the Light grant you wisdom, %s.","May your judgement hold firm as steel, %s.","A clear eye finds the path even in the deepest mountain, %s."},
        CRUSADER={"The Light shows the road. The hammer follows.","Forward. Light in the heart, steel in the hand.","By the stone beneath my feet, I do not turn back."},
        RIGHTEOUSNESS={"The Light guide my hand. My hammer follows.","Justice first. The hammer adds emphasis.","May my hand be as steady as my resolve."},
        FURY={"Come on, then. Dwarven steel does not yield.","My shield stands. My hammer is waiting.","By the stone beneath my feet, you do not pass."},
    },
    Human = {
        MIGHT={"May the Light grant you strength, %s.","May courage strengthen you as surely as the Light, %s.","May your strength serve those who need protection, %s."},
        WISDOM={"May the Light grant you wisdom, %s.","May the Light guide your judgement, %s.","Let prudence guide your next step, %s."},
        CRUSADER={"In the name of the Light, I go forward.","Duty before fear. The road lies ahead.","My oath shows me the way."},
        RIGHTEOUSNESS={"May my judgement be just and my hand sure.","The Light guide my hand, not my anger.","I act from duty, not revenge."},
        FURY={"Your anger is mine. Leave my companions out of it.","I stand my ground. Come.","No step backward."},
    },
    Undead = {
        MIGHT={"May the Light lend you strength, %s. Accept it.","Death has not made strength meaningless, %s.","May your will be stronger than fear, %s."},
        WISDOM={"May the Light sharpen your mind, %s.","One who knows death should walk through life with care, %s.","A cool mind judges better than a hot heart, %s."},
        CRUSADER={"Death did not break my oath.","The Light finds a road even through the grave.","I know the darkness. That is why I do not fear it."},
        RIGHTEOUSNESS={"Death does not release me from my oath.","Justice does not end at the grave.","The darkness knows me. It does not own me."},
        FURY={"Come then. I am harder to get rid of than I look.","I have survived death. You impress me little.","I do not intend to die again today."},
    },
}
