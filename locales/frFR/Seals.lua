-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.Seals = {RIGHTEOUSNESS={name="Sceau de piété",gruppe={"Que la droiture guide ma main.","La justice sans compassion n'est qu'une lame affûtée.","Un coup juste exige un esprit calme.","Mon arme sert mon serment, jamais ma colère.","Que la Lumière juge mes actes avant mes ennemis."}},COMMAND={name="Sceau d'autorité",gruppe={"Par la Lumière, je commande à ma force.","Aucun ordre ne doit couvrir la voix de la conscience.","Je tiens cette arme, mais mon serment me guide.","En avant, tant que le courage écoute la raison.","Une voix ferme rassemble mieux qu'un cri."}},WISDOM={name="Sceau de sagesse",gruppe={"Que la sagesse tempère chaque coup.","Une pause réfléchie peut éviter une longue bataille.","Tous les problèmes ne cèdent pas au marteau.","Que la Lumière m'accorde le discernement avant la force.","Même un paladin doit écouter avant de frapper."}},LIGHT={name="Sceau de lumière",gruppe={"La Lumière accompagne chaque frappe.","Une étincelle d'espoir peut éclairer la nuit la plus longue.","Je porte la Lumière pour guider les autres, non pour briller.","Quand les ombres s'étirent, je veille sur la flamme.","Que cette lueur atteigne ceux qui en ont besoin."}},CRUSADER={name="Sceau du croisé",gruppe={"La croisade continue.","Je pars défendre le juste, pas seulement avoir raison.","Un serment solide exige des bottes plus solides encore.","La route est longue. Mon vœu marche avec moi.","Que chaque pas soit digne de notre bannière."}},FURY={name="Sceau de fureur",gruppe={
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
    gruppe = { "Un sceau n'est pas une parure. C'est une promesse.", "Aujourd'hui, même les plus rapides devront s'arrêter.", "*dessine un sceau rayonnant au-dessus de son arme levée.*", "*pose la main libre sur la garde et prononce un bref serment.*",
    "Courez si vous le voulez. La justice sait attendre.",
    "Un jugement équitable n'a pas besoin de se hâter.",
    "On peut tourner le dos à la Lumière, pas à ses responsabilités.",
    "Mon marteau n'est pas un juge. Mon serment me le rappelle.",
    "Aucun pas rapide ne dépasse sa propre faute.",
    "Je ne demande pas votre reddition, seulement un instant d'arrêt.",
    "Le chemin de la justice commence parfois par un simple arrêt.",
    "Un sceau pour retenir, non pour se vanter.",
    "*dessine un croissant doré dans l'air avec son marteau.*",
    "*frappe le bord de son bouclier et barre la route de la fuite.*",
    "*passe le pouce sur le sceau lumineux de son gantelet.*",
    "*abaisse un instant son arme, comme pour écouter un verdict silencieux.*",
    },

}
