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
            "Que leur fureur se tourne vers moi. Je protégerai mes compagnons !",
            "La justice exige de la fermeté. Je ne reculerai pas.",
            "C'est ici que votre avance prend fin.",
            "*lève son bouclier tandis qu'une lueur dorée enveloppe son armure.*",
            "*frappe son bouclier du poing et se place devant ses alliés.*",
            "*prononce un serment solennel et attire l'attention des ennemis.*",
        },
    },



    -- Dialogues et emotes nouveaux pour les compétences de Paladin Forever
    HOLY_LIGHT = { name = "Lumière sacrée",
        gruppe = { "Il faut parfois plus qu'une étincelle pour ranimer l'espoir.", "Que ces mains sauvent ce que mon épée ne peut sauver.", "*lève les deux paumes tandis qu'une lumière chaleureuse s'y rassemble.*", "*baisse la tête et prononce une longue prière de guérison.*" },
        ziel = { "Reste avec nous, %s. La Lumière n'a pas terminé ton histoire.", "Fais-moi confiance un instant, %s. Le prochain souffle est à toi." },
    },

    REDEMPTION = { name = "Rédemption",
        gruppe = { "Il est des adieux auxquels la Lumière refuse de consentir.", "Reviens, âme courageuse. Des voix t'attendent encore.", "*s'agenouille près du corps et pose doucement son épée.*", "*ferme les yeux et garde les mains au-dessus de la silhouette immobile.*" },
        ziel = { "%s, entends ma voix. Ta place est encore parmi nous.", "Que le retour soit doux, %s. Nous t'attendons." },
    },

    CONSECRATION = { name = "Consécration",
        gruppe = { "Cette terre ne cachera plus ceux qui fuient la justice.", "Que courage et droiture prennent racine ici.", "*dessine une frontière lumineuse dans la poussière avec son épée.*", "*plante le talon dans le sol et consacre le lieu par une prière.*" },
    },

    EXORCISM = { name = "Exorcisme",
        gruppe = { "Que la corruption cesse enfin de défier la Lumière.", "Même les ombres anciennes craignent l'aube.", "*tend une main ouverte et projette un rayon éblouissant.*", "*trace un symbole sacré et récite les mots de bannissement.*" },
        ziel = { "%s, tes ténèbres n'ont aucune place ici.", "Recule, %s. La Lumière sait ce que tu es devenu." },
    },

    FLASH_OF_LIGHT = { name = "Éclair lumineux",
        gruppe = { "Pas le temps de prêcher. Seulement d'accomplir un miracle.", "Une lueur, et un souffle d'espoir supplémentaire.", "*referme les doigts sur un petit signe de guérison brillant.*", "*effleure l'épaule d'un compagnon tandis que la lumière jaillit.*" },
        ziel = { "Tiens bon, %s. Je suis déjà là.", "Encore un souffle, %s. Tu pourras reprendre le combat." },
    },

    VOICE_OF_TRUTH = { name = "Voix de vérité",
        gruppe = { "Vous pouvez contester mes paroles, pas les faire taire.", "La vérité n'a pas besoin de tonnerre pour témoin.", "*se redresse et prononce ses mots d'une voix ferme.*", "*touche le symbole sacré à sa gorge et se concentre.*" },
    },

    TURN_UNDEAD = { name = "Renvoi des morts-vivants",
        gruppe = { "Retournez en arrière, ombres sans repos. Ces vies ne vous appartiennent pas.", "Une tombe ne donne aucun droit à la cruauté.", "*lève un symbole consacré et prononce une prière protectrice.*", "*trace un cercle rayonnant entre les vivants et les ombres.*" },
        ziel = { "Arrière, %s. Ton chemin s'arrête devant cette lumière.", "%s, aucune autre âme ne nourrira ta faim." },
    },

    HOLY_SHOCK = { name = "Horion sacré",
        gruppe = { "La Lumière peut guérir. Elle sait aussi réveiller.", "Tout éclair n'annonce pas une tempête.", "*lève brusquement la main et libère une courte décharge lumineuse.*", "*rassemble la puissance sacrée en un seul geste rapide.*" },
        ziel = { "Un éclat pour toi, %s. Ce qu'il apporte dépend du moment.", "%s, la Lumière ne se limite pas à une seule réponse." },
    },

    LIGHT_WATCH = { name = "Veille de lumière",
        gruppe = { "Je garde ma promesse même quand mes yeux se fatiguent.", "Quand commence la veille, la solitude s'efface.", "*trace un petit sceau protecteur dans l'air.*", "*pose deux doigts sur son cœur et jure de veiller.*" },
        ziel = { "%s, ma lumière reste avec toi même lorsque nous sommes séparés.", "Fie-toi à ce signe, %s. Tu n'es pas seul." },
    },

    HOLY_WRATH = { name = "Colère divine",
        gruppe = { "La tempête de Lumière ne compte pas ses ennemis.", "Lorsque l'ombre nous entoure, nous répondons de tous côtés.", "*écarte les bras tandis que des étincelles dorées tourbillonnent au sol.*", "*brandit son arme et appelle une vague de puissance aveuglante.*" },
    },

    DIVINE_FAVOR = { name = "Faveur divine",
        gruppe = { "Parfois, le plus petit espoir suffit exactement.", "Que la Lumière guide mon prochain choix.", "*reste immobile jusqu'à ce que son souffle soit parfaitement calme.*", "*trace un signe doré sur sa paume ouverte.*" },
    },

    OATH_OF_LIGHT = { name = "Serment de lumière",
        gruppe = { "Un serment compte surtout lorsque personne ne nous écoute.", "Je n'abandonnerai pas ce que j'ai juré de protéger.", "*pose une main sur son cœur et murmure une promesse solennelle.*", "*s'agenouille brièvement avant de reprendre sa veille.*" },
        ziel = { "%s, je jure de ne pas détourner les yeux quand tu auras besoin de moi.", "Ce serment est pour toi, %s. Pas pour ma gloire." },
    },

    DIVINE_PROTECTION = { name = "Protection divine",
        gruppe = { "Un bouclier de Lumière ne me dispense pas de mes devoirs.", "Aujourd'hui, je prends un instant pour respirer.", "*lève son bouclier tandis qu'une lueur enveloppe son armure.*", "*ferme les yeux alors qu'un voile rayonnant apparaît.*" },
    },

    DIVINE_INTERVENTION = { name = "Intervention divine",
        gruppe = { "Certains sacrifices ne se pèsent pas. Ils se portent.", "Si un seul doit revenir, que ce soit celui qui peut encore aider.", "*baisse la tête et dessine un sceau protecteur d'une main tremblante.*", "*prononce une dernière prière et touche sa poitrine.*" },
        ziel = { "%s, accepte cette protection. Ma décision est prise.", "Ton histoire continue, %s. Je ne demande rien de plus." },
    },

    HOLY_SHIELD = { name = "Bouclier sacré",
        gruppe = { "Chaque coup sur mon bouclier épargne un compagnon.", "Qui promet la protection doit savoir tenir bon.", "*frappe le bord du bouclier contre le sol et appelle une lueur dorée.*", "*lève son bouclier où s'allument des runes brillantes.*" },
    },

    HAMMER_OF_THE_RIGHTEOUS = { name = "Marteau du vertueux",
        gruppe = { "La justice ne frappe pas forcément celui qui crie le plus fort.", "Mon marteau se moque de la taille des vantardises.", "*décrit un large arc précis avec son arme.*", "*porte un coup lourd tandis que la lumière danse sur la lame.*" },
        ziel = { "%s, affronte mon bouclier et ma décision.", "Tu n'es pas seul ici, %s. Mais tu me barres la route." },
    },

    SACRIFICE = { name = "Bénédiction de sacrifice",
        gruppe = { "Un fardeau devient plus léger lorsqu'on le partage.", "Je ne promets pas une route sans douleur, mais pas une route solitaire.", "*trace une bénédiction entre deux épaules couvertes d'armure.*", "*hoche la tête et pose une main ferme sur son cœur.*" },
        ziel = { "%s, je partagerai les coups que tu recevras.", "Tiens bon, %s. Tu ne paieras pas ce prix seul." },
    },

    TEMPLARS_BULWARK = { name = "Rempart du templier",
        gruppe = { "Jusqu'ici. Pas un pas de plus.", "Un bon bouclier est fait de plus que d'acier.", "*plante fermement son bouclier devant ses pieds.*", "*se redresse sous un dôme de protection éblouissante.*" },
    },

    SWIFT_JUDGEMENT = { name = "Jugement rapide",
        gruppe = { "Un verdict juste doit être clair, pas lent.", "Quand l'injustice revient, je réponds sans hésiter.", "*tire son épée d'un seul mouvement fluide.*", "*prononce une courte prière et rassemble sa détermination.*" },
    },

    JUDGEMENT = { name = "Jugement",
        gruppe = { "Le verdict de la Lumière n'est pas un murmure.", "Un sceau porte une promesse. L'heure est venue de la tenir.", "*tend son arme tandis qu'un sceau doré s'illumine.*", "*frappe son bouclier du poing et prononce un verdict sans équivoque.*" },
        ziel = { "%s, la Lumière n'a pas oublié tes actes.", "Reçois mon jugement, %s. Puisses-tu retrouver la raison." },
    },

    HOLY_STRIKE = { name = "Frappe sacrée",
        gruppe = { "Mon épée porte le coup. Ma conscience lui donne son sens.", "La force de la Lumière n'a pas besoin de haine.", "*porte un coup bref et précis accompagné d'un éclat lumineux.*", "*avance d'un pas tandis qu'une clarté parcourt sa lame.*" },
        ziel = { "%s, cette frappe appartient à la justice, pas à la haine.", "Résiste, %s. La Lumière guide mon bras." },
    },

    REPENTANCE = { name = "Repentir",
        gruppe = { "Parfois, revenir sur ses pas demande plus de courage qu'attaquer.", "Dépose ton orgueil. Il pèse plus lourd que ton arme.", "*baisse son arme et tend une main ouverte en signe d'avertissement.*", "*dessine un symbole silencieux et attend un signe de compréhension.*" },
        ziel = { "%s, regarde tes actes avant de les recommencer.", "Arrête-toi, %s. Il n'est peut-être pas trop tard." },
    },

    SUMMON_WARHORSE = { name = "Invocation d'un cheval de guerre",
        gruppe = { "La route est longue. Heureusement, tout ne se fait pas à pied.", "Même un chevalier sacré a parfois besoin de quatre sabots.", "*siffle son cheval de guerre et vérifie les sangles.*", "*caresse la crinière d'un cheval qui s'approche.*" },
    },

    SUMMON_CHARGER = { name = "Invocation d'un destrier",
        gruppe = { "Pour la longue route et le prochain combat juste.", "Un fier destrier porte plus qu'une armure. Il porte la confiance.", "*appelle son destrier d'un signe solennel.*", "*vérifie la selle et rassemble les rênes d'un geste assuré.*" },
    },
}
