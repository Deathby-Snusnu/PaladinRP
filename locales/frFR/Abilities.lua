-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.Abilities = {HAMMER_OF_WRATH={name="Marteau de courroux",ziel={"Le jugement vient pour vous, %s.","*lance un marteau béni vers %s.*"},gruppe={"Par la Lumière !"}},LAYONHANDS={name="Imposition des mains",ziel={"Pas aujourd'hui, %s. La Lumière a encore besoin de vous.","*pose les deux mains sur %s et déverse toute sa réserve de Lumière dans la guérison.*"},gruppe={"La Lumière n'abandonne pas les siens."}},DIVINE_SHIELD={name="Bouclier divin",gruppe={"La Lumière est mon bouclier.","*lève une main tandis qu'une barrière radieuse se referme autour du corps.*"}},
    ["HAMMER_OF_JUSTICE"] = {
        name = "Marteau de justice",
        ziel = {
            "Au nom de la Lumière, arrêtez-vous, %s !",
            "Votre assaut s'arrête ici, %s !",
            "Pas un pas de plus, %s !",
            "Baissez vos armes, %s, tant qu'il est temps.",
            "La justice vous ordonne de vous arrêter, %s.",
            "Que cet instant vous ramène à la raison, %s.",
            "*projette un marteau de lumière sacrée sur %s.*",
            "*trace un sceau lumineux vers %s avant de frapper d'un marteau sacré.*",
            "*lève la main tandis qu'un marteau doré s'abat sur %s.*",
            "*invoque un marteau rayonnant et le dirige vers %s.*",
        },
        gruppe = {
            "Au nom de la Lumière, cela suffit !",
            "Que la justice fasse taire la violence.",
            "*lève la paume, faisant apparaître un marteau lumineux.*",
            "*prononce un jugement solennel au milieu d'étincelles dorées.*",
        },
    },

    ["PURIFY"] = {
        name = "Purification",
        ziel = {
            "Que la Lumière vous délivre de ce fardeau, %s.",
            "Tenez bon, %s. Je vais dissiper ce mal.",
            "Aucun poison ne doit affaiblir votre volonté, %s.",
            "Respirez, %s. La Lumière vous accompagne.",
            "Que cette corruption vous quitte, %s.",
            "*pose doucement une main sur %s et murmure une prière purificatrice.*",
            "*trace un symbole lumineux au-dessus de %s jusqu'à ce que la souillure s'efface.*",
            "*s'agenouille auprès de %s et invoque une lumière apaisante.*",
        },
        gruppe = {
            "Que la Lumière chasse ce qui nous affaiblit.",
            "Tenez bon. Ce mal va disparaître.",
            "*ouvre la paume et laisse rayonner une clarté purificatrice.*",
            "*dessine dans l'air un signe de purification.*",
        },
    },

    ["CLEANSE"] = {
        name = "Épuration",
        ziel = {
            "Que la Lumière vous libère de cet enchantement, %s.",
            "Votre volonté vous appartient, %s. Nul sort ne doit l'enchaîner.",
            "Cette malédiction n'a aucun droit sur vous, %s.",
            "Gardez courage, %s. Je vais rompre ce sort.",
            "Que la foi chasse l'ombre de votre esprit, %s.",
            "*lève la main au-dessus de %s et appelle une lueur dorée.*",
            "*récite une ancienne litanie tandis que la magie hostile se dissipe autour de %s.*",
            "*trace un signe lumineux devant %s et balaie la malédiction.*",
        },
        gruppe = {
            "Là où la magie enchaîne, la Lumière libère.",
            "Aucune malédiction ne nous barrera la route.",
            "*trace un cercle de lumière qui disperse les dernières traces de magie.*",
            "*prononce une prière de purification et abaisse lentement la main.*",
        },
    },

    ["RIGHTEOUS_FURY"] = {
        name = "Fureur vertueuse",
        gruppe = {
            "Que leur fureur se tourne vers moi. Je protegerai mes compagnons !",
            "La justice exige de la fermete. Je ne reculerai pas.",
            "C'est ici que votre avance prend fin.",
            "*leve son bouclier tandis qu'une lueur doree enveloppe son armure.*",
            "*frappe son bouclier du poing et se place devant ses allies.*",
            "*prononce un serment solennel et attire l'attention des ennemis.*",
        },
    },


}
