-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.Seals = {RIGHTEOUSNESS={name="Sceau de piété",gruppe={"Que la droiture guide ma main."}},COMMAND={name="Sceau d'autorité",gruppe={"Par la Lumière, je commande à ma force."}},WISDOM={name="Sceau de sagesse",gruppe={"Que la sagesse tempère chaque coup."}},LIGHT={name="Sceau de lumière",gruppe={"La Lumière accompagne chaque frappe."}},CRUSADER={name="Sceau du croisé",gruppe={"La croisade continue."}},FURY={name="Sceau de fureur",gruppe={"Que la juste fureur retienne leur regard."}}}

-- Explicit Seal of Wisdom key avoids collision with Blessing of Wisdom.
addon.localeData.frFR.Seals.SEAL_OF_WISDOM = addon.localeData.frFR.Seals.WISDOM
addon.localeData.frFR.Seals.SEAL_OF_JUSTICE = {
    name = "Sceau de justice",
    gruppe = { "Un sceau n'est pas une parure. C'est une promesse.", "Aujourd'hui, même les plus rapides devront s'arrêter.", "*dessine un sceau rayonnant au-dessus de son arme levée.*", "*pose la main libre sur la garde et prononce un bref serment.*" },
}
