-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.Seals = {RIGHTEOUSNESS={name="Sceau de piété",gruppe={"Que la droiture guide ma main."}},COMMAND={name="Sceau d'autorité",gruppe={"Par la Lumière, je commande à ma force."}},WISDOM={name="Sceau de sagesse",gruppe={"Que la sagesse tempère chaque coup."}},LIGHT={name="Sceau de lumière",gruppe={"La Lumière accompagne chaque frappe."}},CRUSADER={name="Sceau du croisé",gruppe={"La croisade continue."}},FURY={name="Sceau de fureur",gruppe={
            "Que la juste fureur retienne leur regard.",
            "Essayez donc de passer. Mes compagnons sont derrière ce bouclier.",
            "Un bouclier d'acier. Une volonté de pierre. Un serment dans la Lumière.",
            "Que l'ennemi me voie et que mes compagnons restent à l'abri.",
            "À chaque pas de votre avance, ma ligne tient plus fermement.",
            "La Lumière n'est pas un doux oreiller. Aujourd'hui, c'est un rempart.",
            "La fureur n'est pas une colère aveugle. C'est la promesse de tenir.",
            "Menacez mes compagnons et vous rencontrerez d'abord mon marteau.",
            "L'aube peut tarder. Pas mon bouclier.",
            "Même la tempête la plus violente se brise sur ce bouclier.",
            "Je suis le rempart entre le danger et l'espoir.",
            "Que les ancêtres voient que ce nain ne cède pas.",
            "Pour Khaz Modan, pour nos compagnons et pour une nouvelle aube !",
            "*plante ses bottes au sol et lève son bouclier.*",
            "*trace un bref signe de la Lumière sur sa cuirasse.*",
            "*frappe deux fois le bord du bouclier et protège les rangs.*",
            "*abaisse son centre de gravité et attend la prochaine charge.*",
        }}}

-- Explicit Seal of Wisdom key avoids collision with Blessing of Wisdom.
addon.localeData.frFR.Seals.SEAL_OF_WISDOM = addon.localeData.frFR.Seals.WISDOM
addon.localeData.frFR.Seals.SEAL_OF_JUSTICE = {
    name = "Sceau de justice",
    gruppe = { "Un sceau n'est pas une parure. C'est une promesse.", "Aujourd'hui, même les plus rapides devront s'arrêter.", "*dessine un sceau rayonnant au-dessus de son arme levée.*", "*pose la main libre sur la garde et prononce un bref serment.*" },
}
