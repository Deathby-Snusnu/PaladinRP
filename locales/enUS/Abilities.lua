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

    ["RIGHTEOUS_FURY"] = {
        name = "Righteous Fury",
        gruppe = {
            "Let their fury fall on me. My companions remain under my protection!",
            "Justice demands resolve. I shall not yield.",
            "Here I stand. Your advance ends here.",
            "Come then. My shield shall not falter.",
            "*raises a shield as golden radiance gathers around the armor.*",
            "*strikes a fist against the shield and steps before the allies.*",
            "*swears an oath to the Light and draws the foes' attention.*",
        },
    },



    -- Distinctive Forever Paladin spell dialogue and gestures
    HOLY_LIGHT = { name = "Holy Light",
        gruppe = { "Hope sometimes needs more than a spark.", "May these hands save what my sword cannot.", "*raises both palms as a warm radiance gathers between them.*", "*bows the head and offers a long, quiet prayer of healing.*" },
        ziel = { "Stay with us, %s. The Light has not finished your story.", "Trust me for a moment, %s. The next breath belongs to you." },
    },

    REDEMPTION = { name = "Redemption",
        gruppe = { "There are farewells that the Light refuses to accept.", "Come back, brave soul. There are voices waiting for you.", "*kneels beside the fallen and carefully sets the sword aside.*", "*closes the eyes and holds both hands over a motionless form.*" },
        ziel = { "%s, hear my voice. Your place is still among us.", "May the road back be gentle, %s. We are waiting." },
    },

    CONSECRATION = { name = "Consecration",
        gruppe = { "This ground shall offer no hiding place from justice.", "Let courage and righteousness take root where we stand.", "*draws a shining boundary across the dust with the sword.*", "*plants a heel firmly and consecrates the battlefield in prayer.*" },
    },

    EXORCISM = { name = "Exorcism",
        gruppe = { "Let corruption stand before the Light no longer.", "Even ancient shadows fear the dawn.", "*extends an open hand and hurls a blinding ray forward.*", "*traces a sacred sign and speaks the words of banishment.*" },
        ziel = { "%s, your darkness has no place here.", "Turn back, %s. The Light knows what you have become." },
    },

    FLASH_OF_LIGHT = { name = "Flash of Light",
        gruppe = { "No time for sermons. Only for a miracle.", "A flash of radiance and another breath of hope.", "*closes the fingers around a small and brilliant healing sign.*", "*briefly touches a companion's shoulder as light flickers.*" },
        ziel = { "Hold on, %s. I am here already.", "Just one breath, %s. Then you can fight on." },
    },

    VOICE_OF_TRUTH = { name = "Voice of Truth",
        gruppe = { "You may question my words, but you shall not silence them.", "Truth needs no thunderous witness.", "*stands upright and speaks the next words with steady resolve.*", "*touches the sacred symbol at the throat and concentrates.*" },
    },

    TURN_UNDEAD = { name = "Turn Undead",
        gruppe = { "Turn back, restless shadows. These living souls are not yours.", "A grave is no license for cruelty.", "*raises a consecrated symbol and speaks a warding prayer.*", "*draws a radiant circle between the living and the dark.*" },
        ziel = { "Back, %s. Your path ends before this Light.", "%s, no more souls shall follow your hunger." },
    },

    HOLY_SHOCK = { name = "Holy Shock",
        gruppe = { "The Light can mend. It can also awaken.", "Not every flash announces a storm.", "*throws one hand upward as a short burst of light leaps out.*", "*gathers sacred power in a single swift gesture.*" },
        ziel = { "A flash of light for you, %s. What it brings is another matter.", "%s, the Light is not limited to a single answer." },
    },

    LIGHT_WATCH = { name = "Lightwatch",
        gruppe = { "I keep my promise even when my eyes grow weary.", "Where the vigil begins, loneliness ends.", "*traces a small glowing ward in the air.*", "*places two fingers over the heart and swears to keep watch.*" },
        ziel = { "%s, my light stays with you even when we stand apart.", "Trust this sign, %s. You do not stand alone." },
    },

    HOLY_WRATH = { name = "Holy Wrath",
        gruppe = { "The storm of Light does not count its enemies.", "When darkness surrounds us, we answer in every direction.", "*spreads both arms as golden sparks whirl across the ground.*", "*lifts the weapon and calls forth a wave of blinding power.*" },
    },

    DIVINE_FAVOR = { name = "Divine Favor",
        gruppe = { "Sometimes the smallest hope is precisely enough.", "May the Light guide my next decision.", "*holds perfectly still until breath and hand are steady.*", "*draws a golden mark across the open palm.*" },
    },

    OATH_OF_LIGHT = { name = "Oath of Light",
        gruppe = { "An oath matters most when nobody else is listening.", "What I have sworn to protect, I shall not abandon.", "*places a hand over the heart and whispers a binding promise.*", "*kneels briefly before resuming a silent vigil.*" },
        ziel = { "%s, I swear not to look away when you need me.", "This oath is for you, %s. Not for my glory." },
    },

    DIVINE_PROTECTION = { name = "Divine Protection",
        gruppe = { "A shield of Light does not excuse me from my duty.", "Today I claim one moment in which to breathe.", "*raises the shield as a pale glow gathers over the armor.*", "*closes the eyes while a radiant veil takes shape.*" },
    },

    DIVINE_INTERVENTION = { name = "Divine Intervention",
        gruppe = { "Some sacrifices are not weighed. They are borne.", "If only one may return, let it be the one who can help the others.", "*bows the head and draws a protective seal with a trembling hand.*", "*offers a final prayer and touches the chest.*" },
        ziel = { "%s, take this protection. My decision is made.", "Your story goes on, %s. That is all I ask." },
    },

    HOLY_SHIELD = { name = "Holy Shield",
        gruppe = { "Each blow upon my shield is one less blow upon my friends.", "Those who promise protection must learn to stand firm.", "*strikes the shield rim against the earth and summons a golden glow.*", "*raises a shield where shining runes flare into life.*" },
    },

    HAMMER_OF_THE_RIGHTEOUS = { name = "Hammer of the Righteous",
        gruppe = { "Justice does not always strike the loudest threat first.", "My hammer is unimpressed by the size of anyone's boasting.", "*swings the weapon in a wide, deliberate arc.*", "*lands a heavy blow as bright light dances along the blade.*" },
        ziel = { "%s, face my shield and my decision.", "You are not alone here, %s. But you are in my way." },
    },

    SACRIFICE = { name = "Blessing of Sacrifice",
        gruppe = { "A burden is lighter when shared.", "I do not promise a painless road. I promise you will not walk alone.", "*traces a blessing between two armored shoulders.*", "*nods and lays a determined hand over the heart.*" },
        ziel = { "%s, I will share whatever strikes you.", "Stand firm, %s. You shall not pay this price alone." },
    },

    TEMPLARS_BULWARK = { name = "Templar's Bulwark",
        gruppe = { "This far, and not a step further.", "A worthy shield is made of more than steel.", "*plants the shield firmly before the feet.*", "*stands beneath a dome of blinding protection.*" },
    },

    SWIFT_JUDGEMENT = { name = "Swift Judgement",
        gruppe = { "An honest verdict must be clear, not slow.", "When injustice returns, I answer without hesitation.", "*draws the sword in a single flowing motion.*", "*whispers a quick prayer and gathers resolve.*" },
    },

    JUDGEMENT = { name = "Judgement",
        gruppe = { "The verdict of the Light is no whisper.", "A seal bears a promise. Now that promise is fulfilled.", "*extends the weapon as a golden sigil flares into life.*", "*strikes the shield with a fist and pronounces an unmistakable verdict.*" },
        ziel = { "%s, the Light has not overlooked your deeds.", "Receive my judgement, %s. May it bring you to your senses." },
    },

    HOLY_STRIKE = { name = "Holy Strike",
        gruppe = { "My sword delivers the blow. My conscience chooses its purpose.", "The strength of Light needs no hatred.", "*makes a short, precise strike accompanied by a flash of radiance.*", "*shifts forward as bright light runs along the weapon.*" },
        ziel = { "%s, this strike belongs to justice, not hatred.", "Stand against me, %s. The Light guides my arm." },
    },

    REPENTANCE = { name = "Repentance",
        gruppe = { "Sometimes turning back takes greater courage than attacking.", "Lay down your pride. It weighs more than any weapon.", "*lowers the weapon and offers an open, admonishing hand.*", "*draws a silent sign and waits for a moment of understanding.*" },
        ziel = { "%s, face your deeds before you repeat them.", "Be still, %s. Perhaps it is not too late." },
    },

    SUMMON_WARHORSE = { name = "Summon Warhorse",
        gruppe = { "The road is long. Thankfully we need not walk every mile.", "Even a holy knight occasionally needs four hooves.", "*whistles for the warhorse and checks the saddle strap.*", "*soothes an approaching horse with a gentle hand.*" },
    },

    SUMMON_CHARGER = { name = "Summon Charger",
        gruppe = { "For the long road and the next just fight.", "A proud steed bears more than armor. It bears trust.", "*summons a charger with a solemn sign.*", "*checks the saddle and gathers the reins with practiced hands.*" },
    },
}
