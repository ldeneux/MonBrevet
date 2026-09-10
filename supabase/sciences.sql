-- ============================================================
-- Prépa Brevet — contenu Sciences (Physique-Chimie, SVT, Technologie)
-- À exécuter APRÈS schema.sql (qui crée déjà le sujet "sciences").
-- Ce script est additif : il n'efface rien des Maths.
-- Ré-exécutable : il supprime d'abord ses propres modules avant de les recréer.
-- ============================================================

delete from modules where id in (
  'pc-matiere','pc-transformations','pc-electricite','pc-mouvement-energie',
  'svt-reproduction','svt-nerveux-immunite','svt-evolution','svt-risques-ressources',
  'techno-objets','techno-info','techno-cycle-vie'
);

insert into modules (id, subject_id, title, tag, timed, position) values
  ('pc-matiere', 'sciences', 'Physique-Chimie · Constitution de la matière', $$Atomes · molécules · mélanges · tableau périodique$$, false, 1),
  ('pc-transformations', 'sciences', 'Physique-Chimie · Transformations chimiques', $$Réactions chimiques · conservation de la masse · équations$$, false, 2),
  ('pc-electricite', 'sciences', 'Physique-Chimie · Électricité', $$Circuits · tension · intensité · loi d'Ohm · puissance$$, false, 3),
  ('pc-mouvement-energie', 'sciences', 'Physique-Chimie · Mouvement et énergie', $$Vitesse · forces · énergie et ses conversions$$, false, 4),
  ('svt-reproduction', 'sciences', 'SVT · Reproduction et hérédité', $$Reproduction humaine · génétique · hérédité$$, false, 5),
  ('svt-nerveux-immunite', 'sciences', 'SVT · Système nerveux et immunité', $$Système nerveux · réflexes · immunité · vaccination$$, false, 6),
  ('svt-evolution', 'sciences', 'SVT · Évolution et biodiversité', $$Évolution des espèces · sélection naturelle · biodiversité$$, false, 7),
  ('svt-risques-ressources', 'sciences', 'SVT · Risques géologiques et ressources', $$Séismes · volcans · ressources naturelles · action humaine$$, false, 8),
  ('techno-objets', 'sciences', 'Technologie · Objets techniques et matériaux', $$Fonctionnement · matériaux · cycle de conception$$, false, 9),
  ('techno-info', 'sciences', 'Technologie · Informatique et réseaux', $$Réseaux · Internet · sécurité informatique$$, false, 10),
  ('techno-cycle-vie', 'sciences', 'Technologie · Cycle de vie et développement durable', $$Cycle de vie d'un objet · impact environnemental · recyclage$$, false, 11);

-- ============================================================
-- COURS COMPLETS (onglet "Cours")
-- ============================================================

-- ----- PC : Constitution de la matière -----
insert into lecons (module_id, title, body, position) values
('pc-matiere', $$Atomes et molécules$$, $$Toute matière est constituée d'atomes, des particules extrêmement petites qui ne peuvent pas être coupées lors d'une transformation chimique. Un atome est formé d'un noyau (contenant des protons et des neutrons) entouré d'électrons.

Chaque type d'atome est représenté par un symbole chimique : H pour l'hydrogène, O pour l'oxygène, C pour le carbone, Fe pour le fer... Le tableau périodique classe tous les atomes connus selon leurs propriétés.

Une molécule est un assemblage de plusieurs atomes liés entre eux. Sa formule chimique indique quels atomes la composent et en quelle quantité : par exemple, l'eau H₂O est formée de 2 atomes d'hydrogène et 1 atome d'oxygène.$$, 1),
('pc-matiere', $$Corps purs et mélanges$$, $$Un corps pur ne contient qu'une seule espèce chimique (un seul type de molécule ou d'atome), comme l'eau pure ou le dioxygène. Un mélange contient plusieurs espèces chimiques différentes.

On distingue deux types de mélanges : un mélange homogène, où l'on ne distingue pas les différents constituants à l'œil nu (l'eau salée, l'air), et un mélange hétérogène, où l'on distingue plusieurs phases (l'eau et l'huile, l'eau boueuse).

Pour séparer les constituants d'un mélange, on utilise différentes techniques selon la nature du mélange : la filtration sépare un solide d'un liquide, la distillation sépare des liquides selon leur température d'ébullition.$$, 2),
('pc-matiere', $$Les états de la matière et leurs changements$$, $$La matière existe sous trois états principaux : l'état solide (forme et volume propres), l'état liquide (volume propre mais prend la forme du récipient) et l'état gazeux (occupe tout l'espace disponible).

Le passage d'un état à un autre s'appelle un changement d'état : la fusion (solide → liquide), la solidification (liquide → solide), la vaporisation (liquide → gaz), la liquéfaction (gaz → liquide), la sublimation (solide → gaz directement).

Pendant un changement d'état, la température reste constante (pour un corps pur) tant que le changement n'est pas terminé : c'est ce qu'on appelle un palier de changement d'état, par exemple 0°C pour la fusion de la glace.$$, 3);

-- ----- PC : Transformations chimiques -----
insert into lecons (module_id, title, body, position) values
('pc-transformations', $$Qu'est-ce qu'une transformation chimique ?$$, $$Une transformation chimique est une réaction au cours de laquelle des espèces chimiques (les réactifs) disparaissent tandis que d'autres (les produits) se forment. Contrairement à un simple changement d'état, de nouvelles molécules apparaissent.

Certains signes permettent de repérer qu'une transformation chimique a eu lieu : un changement de couleur, un dégagement de gaz (effervescence), la formation d'un précipité (un solide qui apparaît dans un liquide), un dégagement ou une absorption de chaleur.

Exemple classique : la combustion, où un combustible réagit avec le dioxygène pour produire, entre autres, du dioxyde de carbone et de l'eau.$$, 1),
('pc-transformations', $$La conservation de la masse$$, $$Lors d'une transformation chimique, la masse totale des produits obtenus est toujours égale à la masse totale des réactifs consommés : c'est la loi de conservation de la masse (loi de Lavoisier). Rien ne se perd, rien ne se crée, tout se transforme.

Cette loi permet de vérifier qu'une réaction est correctement décrite : si on pèse tous les réactifs avant la réaction et tous les produits après, on doit retrouver la même masse totale (dans un système fermé, sans échange avec l'extérieur).$$, 2),
('pc-transformations', $$Écrire et équilibrer une équation chimique$$, $$Une équation chimique représente une transformation chimique à l'aide de symboles et de formules : réactifs à gauche, produits à droite, séparés par une flèche.

Pour respecter la conservation de la masse, une équation doit être équilibrée : il doit y avoir le même nombre de chaque type d'atome de chaque côté de la flèche. On ajuste les nombres devant les formules (les coefficients stœchiométriques) pour équilibrer, sans jamais modifier les indices à l'intérieur d'une formule.

Exemple : la combustion du carbone s'écrit C + O₂ → CO₂. Il y a bien 1 atome de carbone et 2 atomes d'oxygène de chaque côté.$$, 3);

-- ----- PC : Électricité -----
insert into lecons (module_id, title, body, position) values
('pc-electricite', $$Circuits électriques : série et dérivation$$, $$Un circuit électrique est un ensemble de composants (générateur, résistances, lampes...) reliés par des fils conducteurs, parcouru par un courant électrique.

Dans un circuit en série, tous les composants sont placés les uns à la suite des autres : il n'y a qu'un seul chemin possible pour le courant. Si un composant est débranché, tout le circuit s'arrête.

Dans un circuit en dérivation (ou en parallèle), les composants sont placés sur des branches différentes : le courant se répartit entre elles. Si une branche est coupée, les autres continuent de fonctionner.$$, 1),
('pc-electricite', $$Tension, intensité et résistance : la loi d'Ohm$$, $$L'intensité (notée I, en ampères A) mesure le débit du courant électrique dans un circuit ; on la mesure avec un ampèremètre placé en série. La tension (notée U, en volts V) mesure la différence de potentiel électrique entre deux points ; on la mesure avec un voltmètre placé en dérivation.

La résistance (notée R, en ohms Ω) caractérise la capacité d'un composant à s'opposer au passage du courant. La loi d'Ohm relie ces trois grandeurs pour un conducteur ohmique : U = R × I.

Cette relation permet de calculer l'une des trois grandeurs à partir des deux autres, en isolant l'inconnue dans la formule.$$, 2),
('pc-electricite', $$La puissance électrique$$, $$La puissance électrique (notée P, en watts W) d'un appareil indique la quantité d'énergie électrique qu'il consomme ou produit chaque seconde. Elle se calcule avec la formule P = U × I.

Cette formule permet, par exemple, de calculer l'intensité qui traverse un appareil si l'on connaît sa puissance nominale (indiquée sur l'appareil) et la tension du secteur, ou inversement.

L'énergie électrique consommée sur une durée se calcule ensuite en multipliant la puissance par le temps d'utilisation, ce qui permet notamment d'estimer une consommation électrique.$$, 3);

-- ----- PC : Mouvement et énergie -----
insert into lecons (module_id, title, body, position) values
('pc-mouvement-energie', $$Décrire un mouvement : vitesse et trajectoire$$, $$Le mouvement d'un objet se décrit toujours par rapport à un référentiel (un objet ou un point fixe choisi comme référence) : un même objet peut être immobile dans un référentiel et en mouvement dans un autre.

La trajectoire est l'ensemble des positions successives occupées par un objet en mouvement ; elle peut être rectiligne (une droite), circulaire, ou quelconque.

La vitesse moyenne d'un objet se calcule en divisant la distance parcourue par la durée du trajet (vitesse = distance ÷ temps), et s'exprime généralement en m/s ou en km/h.$$, 1),
('pc-mouvement-energie', $$Les forces et leurs effets$$, $$Une force est une action mécanique exercée par un objet sur un autre. Elle peut modifier le mouvement d'un objet (le mettre en mouvement, l'arrêter, dévier sa trajectoire ou modifier sa vitesse) ou le déformer.

Une force se représente par une flèche (un vecteur), caractérisée par son point d'application, sa direction, son sens et son intensité, mesurée en newtons (N).

Le poids d'un objet est la force exercée par la Terre sur lui du fait de la gravité ; il est proportionnel à sa masse (poids = masse × intensité de pesanteur). Le poids et la masse sont deux grandeurs différentes : la masse (en kg) ne change pas selon l'endroit, contrairement au poids (en N).$$, 2),
('pc-mouvement-energie', $$Les formes d'énergie et leurs conversions$$, $$L'énergie existe sous plusieurs formes : énergie cinétique (liée au mouvement), énergie potentielle (liée à la position, par exemple l'altitude), énergie thermique, énergie électrique, énergie chimique, énergie lumineuse...

Un objet ou un système peut convertir une forme d'énergie en une autre : par exemple, un panneau solaire convertit l'énergie lumineuse en énergie électrique, un moteur convertit l'énergie électrique ou chimique en énergie cinétique.

Un principe fondamental gouverne toutes ces conversions : l'énergie totale se conserve toujours, elle ne disparaît jamais, elle se transforme seulement d'une forme à une autre (parfois avec des pertes sous forme de chaleur).$$, 3);

-- ----- SVT : Reproduction et hérédité -----
insert into lecons (module_id, title, body, position) values
('svt-reproduction', $$La reproduction humaine$$, $$La reproduction humaine est une reproduction sexuée : elle nécessite la fusion d'une cellule reproductrice masculine (le spermatozoïde) et d'une cellule reproductrice féminine (l'ovule), lors de la fécondation.

Cette fécondation donne naissance à une cellule-œuf, qui se divise ensuite de nombreuses fois pour former un embryon, puis un fœtus, au cours de la grossesse qui dure environ 9 mois.

Les appareils reproducteurs masculin et féminin produisent ces cellules reproductrices sous le contrôle d'hormones, qui régulent également le cycle menstruel chez la femme.$$, 1),
('svt-reproduction', $$Du gène au caractère : notions de génétique$$, $$L'information génétique d'un individu est portée par l'ADN, une molécule présente dans le noyau de chaque cellule, organisée en chromosomes. Un gène est une portion d'ADN qui porte l'information nécessaire à un caractère particulier (par exemple la couleur des yeux).

Chaque individu possède deux exemplaires de chaque gène (un hérité de chaque parent), appelés allèles, qui peuvent être identiques ou différents. C'est la combinaison de ces allèles qui détermine les caractères observables d'un individu.

Les cellules reproductrices (spermatozoïdes et ovules) ne contiennent qu'un seul exemplaire de chaque chromosome ; la fécondation rétablit la paire complète chez l'enfant, qui hérite ainsi d'un mélange des caractères de ses deux parents.$$, 2),
('svt-reproduction', $$La transmission de l'hérédité$$, $$L'hérédité désigne la transmission des caractères génétiques d'une génération à la suivante, par l'intermédiaire des cellules reproductrices.

Certaines maladies génétiques peuvent être héréditaires, c'est-à-dire transmises des parents aux enfants, lorsqu'elles sont liées à un allèle particulier présent sur un chromosome transmis.

L'étude d'arbres généalogiques permet de suivre la transmission d'un caractère ou d'une maladie sur plusieurs générations, et d'en déduire le mode de transmission (par exemple si l'allèle responsable est dominant ou récessif).$$, 3);

-- ----- SVT : Système nerveux et immunité -----
insert into lecons (module_id, title, body, position) values
('svt-nerveux-immunite', $$Le système nerveux et la commande du mouvement$$, $$Le système nerveux est constitué du cerveau, de la moelle épinière et des nerfs, qui relient ces organes centraux à tout le corps. Il permet de recevoir des informations (par les organes sensoriels), de les traiter, puis de commander une réponse (souvent un mouvement musculaire).

Un réflexe est une réponse motrice rapide et involontaire à un stimulus : le trajet de l'information (du récepteur sensoriel au muscle, en passant par la moelle épinière) est appelé un arc réflexe.

Le message nerveux circule le long des neurones, les cellules spécialisées du système nerveux, sous forme d'un signal électrique.$$, 1),
('svt-nerveux-immunite', $$Le fonctionnement du système immunitaire$$, $$Le corps humain est constamment exposé à des micro-organismes (bactéries, virus...) qui peuvent provoquer des infections. Le système immunitaire est l'ensemble des mécanismes qui protègent l'organisme contre ces agents infectieux.

Une première ligne de défense, dite innée, est rapide mais peu spécifique : elle inclut des barrières physiques (la peau) et des cellules qui attaquent tout corps étranger, quel qu'il soit.

Une seconde ligne de défense, dite adaptative, est plus lente à se mettre en place mais très spécifique : elle produit des anticorps qui reconnaissent précisément un agent infectieux particulier, et garde en mémoire cette reconnaissance pour réagir plus vite en cas de nouvelle infection par le même agent.$$, 2),
('svt-nerveux-immunite', $$La vaccination$$, $$La vaccination consiste à injecter dans l'organisme une version inactivée ou affaiblie d'un agent infectieux (ou une de ses parties), afin de déclencher une réponse immunitaire sans provoquer la maladie elle-même.

Cette première exposition permet au système immunitaire de produire des cellules mémoire, capables de reconnaître très rapidement le véritable agent infectieux s'il se présente plus tard, et de déclencher une réponse immunitaire beaucoup plus rapide et efficace qu'en l'absence de vaccination.

La vaccination protège ainsi non seulement la personne vaccinée, mais contribue aussi, lorsqu'une large part de la population est vaccinée, à limiter la circulation de l'agent infectieux dans la population (immunité collective).$$, 3);

-- ----- SVT : Évolution et biodiversité -----
insert into lecons (module_id, title, body, position) values
('svt-evolution', $$Les preuves de l'évolution$$, $$La théorie de l'évolution explique la diversité actuelle des espèces vivantes par une origine commune et des transformations progressives au cours du temps, sur des échelles de temps très longues (millions d'années).

Plusieurs types de preuves soutiennent cette théorie : les fossiles montrent des espèces disparues et des formes intermédiaires entre groupes actuels ; les comparaisons anatomiques révèlent des structures communes entre espèces différentes (par exemple le squelette des membres chez les vertébrés) ; les comparaisons de l'ADN montrent des degrés de parenté entre espèces.

Plus deux espèces partagent de caractéristiques communes (anatomiques ou génétiques), plus leur ancêtre commun est considéré comme récent.$$, 1),
('svt-evolution', $$Le mécanisme de la sélection naturelle$$, $$Au sein d'une même espèce, les individus présentent des différences génétiques (variabilité). Certaines de ces différences peuvent conférer un avantage dans un milieu donné (par exemple, mieux résister à un prédateur ou à une maladie).

Les individus porteurs de ce caractère avantageux ont statistiquement plus de chances de survivre et de se reproduire, transmettant ainsi plus souvent ce caractère à leur descendance : c'est le principe de la sélection naturelle.

Au fil des générations, la fréquence de ce caractère avantageux augmente dans la population, ce qui peut conduire, sur le très long terme, à l'apparition de nouvelles espèces.$$, 2),
('svt-evolution', $$La biodiversité, une notion dynamique$$, $$La biodiversité désigne la diversité du vivant à différentes échelles : diversité des écosystèmes, diversité des espèces au sein d'un écosystème, et diversité génétique au sein d'une même espèce.

La biodiversité n'est pas figée : elle a toujours évolué au cours de l'histoire de la Terre, avec l'apparition de nouvelles espèces et la disparition d'autres (extinctions), parfois massives.

Aujourd'hui, les activités humaines (destruction des milieux naturels, pollution, changement climatique, espèces invasives) accélèrent fortement la disparition d'espèces, ce qui pose la question de la préservation de la biodiversité actuelle.$$, 3);

-- ----- SVT : Risques géologiques et ressources -----
insert into lecons (module_id, title, body, position) values
('svt-risques-ressources', $$Séismes et volcans : comprendre les risques$$, $$La surface de la Terre est découpée en plaques tectoniques, qui se déplacent très lentement les unes par rapport aux autres. La plupart des séismes et des éruptions volcaniques se produisent aux frontières entre ces plaques.

Un séisme correspond à une libération brutale d'énergie le long d'une faille, provoquant des vibrations du sol. Son intensité est mesurée par sa magnitude.

Une éruption volcanique correspond à la remontée de magma (roche en fusion) depuis l'intérieur de la Terre jusqu'à la surface. La prévention des risques liés à ces phénomènes s'appuie sur la surveillance des zones à risque et sur des plans d'aménagement du territoire adaptés (normes de construction, zones d'évacuation).$$, 1),
('svt-risques-ressources', $$Les ressources géologiques et leur exploitation$$, $$La Terre fournit de nombreuses ressources exploitées par l'être humain : des ressources énergétiques (charbon, pétrole, gaz, mais aussi énergies renouvelables comme le solaire ou l'éolien), des ressources minérales (métaux, roches) et des ressources en eau.

Ces ressources ne se renouvellent pas toutes à la même vitesse : les énergies fossiles se sont formées sur des millions d'années et sont donc considérées comme non renouvelables à l'échelle humaine, contrairement à l'énergie solaire ou éolienne.

La gestion durable de ces ressources implique de limiter leur surexploitation et de privilégier, quand c'est possible, les ressources renouvelables.$$, 2),
('svt-risques-ressources', $$L'impact humain sur l'environnement$$, $$Les activités humaines (industrie, agriculture, transports, urbanisation) modifient profondément l'environnement : pollution de l'air, de l'eau et des sols, déforestation, émissions de gaz à effet de serre qui contribuent au changement climatique.

Le changement climatique se traduit notamment par une augmentation de la température moyenne de la planète, une multiplication des événements climatiques extrêmes, et une élévation du niveau des océans.

Face à ces constats, des actions sont mises en place à différentes échelles (individuelle, locale, nationale, internationale) pour limiter cet impact : réduction des émissions, protection des espaces naturels, transition vers des sources d'énergie moins polluantes.$$, 3);

-- ----- Techno : Objets techniques et matériaux -----
insert into lecons (module_id, title, body, position) values
('techno-objets', $$Analyser un objet technique$$, $$Un objet technique est conçu par l'être humain pour répondre à un besoin précis. Pour l'analyser, on peut se poser plusieurs questions : à quel besoin répond-il ? quelle est sa fonction d'usage principale ? de quoi est-il constitué ? comment fonctionne-t-il ?

On distingue la fonction d'usage (à quoi sert l'objet pour son utilisateur) des fonctions techniques (les solutions concrètes mises en œuvre pour assurer cette fonction d'usage, par exemple un mécanisme ou un composant électronique).

L'analyse d'un objet technique permet aussi d'identifier les évolutions possibles, en comparant plusieurs versions d'un même objet dans le temps (par exemple, l'évolution des téléphones).$$, 1),
('techno-objets', $$Les familles de matériaux$$, $$Les objets techniques sont fabriqués à partir de différentes familles de matériaux, choisies selon leurs propriétés : les matériaux métalliques (résistants, souvent conducteurs), les matériaux polymères ou plastiques (légers, faciles à mettre en forme), les matériaux céramiques (durs, résistants à la chaleur), et les matériaux composites (associant plusieurs matériaux pour combiner leurs qualités).

Le choix d'un matériau dépend de plusieurs critères : sa résistance mécanique, son coût, sa masse, sa capacité à être recyclé, et bien sûr sa capacité à remplir la fonction attendue.$$, 2),
('techno-objets', $$Le cahier des charges et la démarche de conception$$, $$Avant de concevoir un objet technique, on rédige un cahier des charges qui liste précisément les fonctions que l'objet doit remplir et les contraintes à respecter (coût, taille, matériaux disponibles, normes de sécurité...).

La démarche de conception suit généralement plusieurs étapes : identifier le besoin, rechercher des solutions possibles, réaliser des prototypes ou des maquettes, les tester, puis les améliorer avant la fabrication finale.

Cette démarche itérative (on répète les étapes de test et d'amélioration) permet d'aboutir à un objet qui répond au mieux au besoin initial tout en respectant les contraintes fixées.$$, 3);

-- ----- Techno : Informatique et réseaux -----
insert into lecons (module_id, title, body, position) values
('techno-info', $$Comment fonctionne un réseau informatique$$, $$Un réseau informatique est un ensemble d'appareils (ordinateurs, téléphones, serveurs...) reliés entre eux pour échanger des informations. Ces informations circulent sous forme de données numériques, c'est-à-dire codées en 0 et en 1 (le codage binaire).

À petite échelle, on parle de réseau local, qui relie des appareils proches (dans une maison, une entreprise). À grande échelle, Internet est un réseau mondial qui relie des millions de réseaux locaux entre eux.

Chaque appareil connecté à un réseau possède une adresse qui permet de l'identifier et de lui envoyer des données de façon précise, un peu comme une adresse postale.$$, 1),
('techno-info', $$Internet : du client au serveur$$, $$Sur Internet, on distingue généralement deux rôles : le client, qui demande une information (par exemple, un navigateur web qui demande à afficher une page), et le serveur, qui stocke cette information et la fournit en réponse à la demande.

Quand on tape l'adresse d'un site web, le navigateur (client) envoie une requête qui transite par plusieurs équipements réseau jusqu'à atteindre le serveur qui héberge le site ; le serveur renvoie alors les données nécessaires pour afficher la page.

Cette communication suit des règles précises, appelées protocoles, qui définissent comment les appareils doivent échanger les données pour se comprendre.$$, 2),
('techno-info', $$Sécurité informatique et protection des données$$, $$La sécurité informatique vise à protéger les appareils, les réseaux et les données contre des accès non autorisés, des pertes ou des utilisations malveillantes.

Quelques bonnes pratiques permettent de limiter les risques : utiliser des mots de passe complexes et différents pour chaque service, ne pas cliquer sur des liens ou pièces jointes suspectes, mettre à jour régulièrement ses logiciels, et vérifier les autorisations demandées par les applications.

Les données personnelles (nom, adresse, photos, données de localisation...) doivent être particulièrement protégées, car leur divulgation peut avoir des conséquences sur la vie privée et la sécurité d'une personne.$$, 3);

-- ----- Techno : Cycle de vie et développement durable -----
insert into lecons (module_id, title, body, position) values
('techno-cycle-vie', $$Le cycle de vie d'un objet technique$$, $$Le cycle de vie d'un objet technique décrit toutes les étapes de son existence : l'extraction des matières premières nécessaires à sa fabrication, la fabrication elle-même, la distribution, l'utilisation par le consommateur, puis sa fin de vie (réparation, recyclage ou élimination).

Chacune de ces étapes a un impact environnemental : consommation de ressources et d'énergie, émissions de gaz à effet de serre, production de déchets. Prendre en compte l'ensemble du cycle de vie permet d'évaluer l'impact réel d'un objet, plutôt que de se limiter à sa seule phase d'utilisation.$$, 1),
('techno-cycle-vie', $$L'éco-conception$$, $$L'éco-conception consiste à intégrer, dès la phase de conception d'un objet, une réflexion sur la réduction de son impact environnemental tout au long de son cycle de vie.

Cela peut passer par le choix de matériaux moins polluants ou plus faciles à recycler, la réduction de la quantité de matière utilisée, l'allongement de la durée de vie de l'objet (solidité, réparabilité), ou encore la facilité de démontage en fin de vie pour séparer les différents matériaux.

L'éco-conception cherche un équilibre entre la fonction attendue de l'objet, son coût, et son impact sur l'environnement.$$, 2),
('techno-cycle-vie', $$Recyclage et économie circulaire$$, $$Le recyclage consiste à transformer un déchet en une nouvelle matière première, réutilisable pour fabriquer de nouveaux objets, plutôt que de l'éliminer définitivement.

L'économie circulaire est un modèle économique qui vise à limiter le gaspillage des ressources en favorisant la réutilisation, la réparation et le recyclage des objets, par opposition à l'économie linéaire classique (extraire, fabriquer, consommer, jeter).

Le tri sélectif, réalisé par les particuliers, est une première étape indispensable pour permettre ensuite le recyclage effectif des matériaux dans des filières spécialisées.$$, 3);

-- ============================================================
-- SYNTHÈSE EN COULEUR (onglet "Synthèse")
-- ============================================================

insert into cours_sections (module_id, type, content, position) values
('pc-matiere', 'def', $$Un atome est la plus petite particule de matière. Une molécule est un assemblage d'atomes. Un corps pur ne contient qu'une seule espèce chimique, un mélange en contient plusieurs.$$, 1),
('pc-matiere', 'method', $$Pour séparer un mélange : filtration pour séparer un solide d'un liquide, distillation pour séparer des liquides selon leur température d'ébullition.$$, 2),
('pc-matiere', 'method', $$Changements d'état : fusion (solide→liquide), solidification (liquide→solide), vaporisation (liquide→gaz), liquéfaction (gaz→liquide).$$, 3),
('pc-matiere', 'piege', $$Pendant un changement d'état, la température reste constante (palier) : elle ne varie que quand le changement est terminé.$$, 4),
('pc-matiere', 'retenir', $$L'eau H₂O contient 2 atomes d'hydrogène et 1 atome d'oxygène. Mélange homogène = pas de phases visibles ; hétérogène = plusieurs phases visibles.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('pc-transformations', 'def', $$Une transformation chimique fait disparaître des réactifs et apparaître des produits (nouvelles molécules), contrairement à un simple changement d'état.$$, 1),
('pc-transformations', 'method', $$On repère une transformation chimique par : changement de couleur, dégagement de gaz, formation d'un précipité, dégagement ou absorption de chaleur.$$, 2),
('pc-transformations', 'method', $$Pour équilibrer une équation chimique, on ajuste les coefficients devant les formules pour avoir le même nombre de chaque atome des deux côtés — sans jamais modifier les indices dans une formule.$$, 3),
('pc-transformations', 'piege', $$Ne jamais changer les indices d'une formule chimique pour équilibrer une équation (H₂O ne devient pas H₄O₂) : on ajuste seulement les coefficients devant.$$, 4),
('pc-transformations', 'retenir', $$Loi de Lavoisier : la masse totale des produits = la masse totale des réactifs. Rien ne se perd, rien ne se crée, tout se transforme.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('pc-electricite', 'def', $$L'intensité I (en ampères) mesure le débit de courant. La tension U (en volts) mesure la différence de potentiel. La résistance R (en ohms) s'oppose au passage du courant.$$, 1),
('pc-electricite', 'method', $$Circuit en série : un seul chemin, un composant débranché arrête tout. Circuit en dérivation : plusieurs branches, une branche coupée n'affecte pas les autres.$$, 2),
('pc-electricite', 'method', $$Loi d'Ohm : U = R × I. Pour trouver R ou I, on isole l'inconnue : R = U/I ou I = U/R.$$, 3),
('pc-electricite', 'piege', $$Ne pas confondre l'ampèremètre (branché en série, mesure I) et le voltmètre (branché en dérivation, mesure U).$$, 4),
('pc-electricite', 'retenir', $$Puissance électrique : P = U × I (en watts).$$, 5);

insert into cours_sections (module_id, type, content, position) values
('pc-mouvement-energie', 'def', $$Le mouvement se décrit toujours par rapport à un référentiel. Une force est une action mécanique qui peut modifier un mouvement ou déformer un objet.$$, 1),
('pc-mouvement-energie', 'method', $$Vitesse moyenne = distance ÷ temps. Une force se représente par une flèche : point d'application, direction, sens, intensité (en newtons).$$, 2),
('pc-mouvement-energie', 'method', $$Poids = masse × intensité de pesanteur. Le poids (en N) et la masse (en kg) sont deux grandeurs différentes.$$, 3),
('pc-mouvement-energie', 'piege', $$Ne pas confondre masse (kg, ne change pas selon le lieu) et poids (N, dépend de la gravité du lieu).$$, 4),
('pc-mouvement-energie', 'retenir', $$L'énergie totale se conserve toujours : elle se transforme d'une forme à une autre (cinétique, potentielle, thermique, électrique...), parfois avec des pertes en chaleur.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('svt-reproduction', 'def', $$La reproduction humaine est sexuée : fusion d'un spermatozoïde et d'un ovule lors de la fécondation. Un gène est une portion d'ADN qui porte l'information d'un caractère.$$, 1),
('svt-reproduction', 'method', $$Chaque individu possède deux allèles de chaque gène (un de chaque parent) ; les cellules reproductrices n'en portent qu'un seul, rétabli en paire à la fécondation.$$, 2),
('svt-reproduction', 'method', $$Un arbre généalogique permet de suivre la transmission d'un caractère sur plusieurs générations et d'en déduire le mode de transmission.$$, 3),
('svt-reproduction', 'piege', $$Un caractère observable dépend de la combinaison des deux allèles reçus, pas d'un seul : ne pas confondre allèle et caractère.$$, 4),
('svt-reproduction', 'retenir', $$L'ADN, organisé en chromosomes, porte l'information génétique dans le noyau de chaque cellule.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('svt-nerveux-immunite', 'def', $$Le système nerveux (cerveau, moelle épinière, nerfs) reçoit, traite et commande une réponse motrice. Le système immunitaire protège l'organisme contre les agents infectieux.$$, 1),
('svt-nerveux-immunite', 'method', $$Un réflexe suit un arc réflexe : récepteur sensoriel → moelle épinière → muscle, une réponse rapide et involontaire.$$, 2),
('svt-nerveux-immunite', 'method', $$La vaccination injecte une version inactivée d'un agent infectieux pour déclencher des cellules mémoire, sans provoquer la maladie.$$, 3),
('svt-nerveux-immunite', 'piege', $$L'immunité adaptative (spécifique, avec mémoire) est différente de l'immunité innée (rapide mais non spécifique) : ne pas les confondre.$$, 4),
('svt-nerveux-immunite', 'retenir', $$Les anticorps sont spécifiques à un agent infectieux précis et permettent une reconnaissance plus rapide lors d'une nouvelle exposition.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('svt-evolution', 'def', $$La théorie de l'évolution explique la diversité des espèces par une origine commune et des transformations progressives sur de longues échelles de temps.$$, 1),
('svt-evolution', 'method', $$Les preuves de l'évolution : fossiles, comparaisons anatomiques, comparaisons de l'ADN entre espèces.$$, 2),
('svt-evolution', 'method', $$Sélection naturelle : un caractère avantageux se transmet plus souvent car les individus qui le portent survivent et se reproduisent davantage.$$, 3),
('svt-evolution', 'piege', $$La sélection naturelle n'est pas dirigée par une volonté : c'est un processus statistique lié à la survie et la reproduction différentielles.$$, 4),
('svt-evolution', 'retenir', $$La biodiversité se mesure à 3 échelles : écosystèmes, espèces, gènes au sein d'une espèce.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('svt-risques-ressources', 'def', $$Les séismes et éruptions volcaniques se produisent surtout aux frontières des plaques tectoniques. Les ressources géologiques ne se renouvellent pas toutes à la même vitesse.$$, 1),
('svt-risques-ressources', 'method', $$La prévention des risques géologiques s'appuie sur la surveillance des zones à risque et des normes de construction adaptées.$$, 2),
('svt-risques-ressources', 'method', $$Distinguer ressources renouvelables (solaire, éolien) et non renouvelables (charbon, pétrole, gaz, formés sur des millions d'années).$$, 3),
('svt-risques-ressources', 'piege', $$La magnitude mesure l'énergie libérée par un séisme, pas ses conséquences (les dégâts dépendent aussi de la profondeur, de la densité de population...).$$, 4),
('svt-risques-ressources', 'retenir', $$Le changement climatique est lié aux émissions de gaz à effet de serre issues des activités humaines.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('techno-objets', 'def', $$Un objet technique répond à un besoin par une fonction d'usage, assurée par des fonctions techniques (solutions concrètes).$$, 1),
('techno-objets', 'method', $$Pour analyser un objet technique : identifier son besoin, sa fonction d'usage, ses fonctions techniques, ses matériaux.$$, 2),
('techno-objets', 'method', $$Démarche de conception : identifier le besoin → rechercher des solutions → prototyper → tester → améliorer (démarche itérative).$$, 3),
('techno-objets', 'piege', $$Ne pas confondre la fonction d'usage (à quoi sert l'objet) et les fonctions techniques (comment il le fait concrètement).$$, 4),
('techno-objets', 'retenir', $$Familles de matériaux : métalliques, polymères/plastiques, céramiques, composites — chacune avec des propriétés différentes.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('techno-info', 'def', $$Un réseau informatique relie des appareils pour échanger des données numériques codées en binaire (0 et 1).$$, 1),
('techno-info', 'method', $$Sur Internet : le client demande une information, le serveur la fournit, selon des règles appelées protocoles.$$, 2),
('techno-info', 'method', $$Bonnes pratiques de sécurité : mots de passe complexes et différents, prudence avec les liens/pièces jointes, mises à jour régulières.$$, 3),
('techno-info', 'piege', $$Une adresse identifie un appareil sur un réseau, un peu comme une adresse postale — ce n'est pas la même chose qu'un mot de passe.$$, 4),
('techno-info', 'retenir', $$Les données personnelles doivent être protégées : leur divulgation peut avoir des conséquences sur la vie privée et la sécurité.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('techno-cycle-vie', 'def', $$Le cycle de vie d'un objet couvre l'extraction des matières premières, la fabrication, la distribution, l'utilisation et la fin de vie.$$, 1),
('techno-cycle-vie', 'method', $$L'éco-conception intègre dès la conception la réduction de l'impact environnemental : matériaux, durée de vie, réparabilité, démontabilité.$$, 2),
('techno-cycle-vie', 'method', $$Le recyclage transforme un déchet en nouvelle matière première ; le tri sélectif est la première étape indispensable.$$, 3),
('techno-cycle-vie', 'piege', $$L'impact environnemental d'un objet ne se limite pas à son utilisation : il faut considérer tout le cycle de vie, y compris la fabrication.$$, 4),
('techno-cycle-vie', 'retenir', $$Économie circulaire (réutiliser, réparer, recycler) s'oppose à l'économie linéaire (extraire, fabriquer, consommer, jeter).$$, 5);

-- ============================================================
-- EXEMPLES (onglet "Exemples")
-- ============================================================

insert into examples (module_id, title, body, position) values
('pc-matiere', $$Formule de l'eau$$, $$La molécule d'eau H₂O contient :
2 atomes d'hydrogène (H)
1 atome d'oxygène (O)$$, 1),
('pc-matiere', $$Séparer un mélange$$, $$Eau + sable (mélange hétérogène)
→ filtration : le sable reste sur le filtre, l'eau passe à travers$$, 2),
('pc-transformations', $$Équilibrer une équation$$, $$Combustion du carbone :
C + O₂ → CO₂
1 atome de C et 2 atomes de O de chaque côté : équation équilibrée$$, 1),
('pc-transformations', $$Conservation de la masse$$, $$10 g de réactif A + 5 g de réactif B
→ masse totale des produits obtenus = 15 g$$, 2),
('pc-electricite', $$Loi d'Ohm$$, $$Un conducteur de résistance R = 20 Ω est traversé par un courant I = 0,5 A
U = R × I = 20 × 0,5 = 10 V$$, 1),
('pc-electricite', $$Puissance électrique$$, $$Un appareil fonctionne sous U = 230 V avec I = 2 A
P = U × I = 230 × 2 = 460 W$$, 2),
('pc-mouvement-energie', $$Vitesse moyenne$$, $$Un cycliste parcourt 30 km en 1,5 h
vitesse = 30 ÷ 1,5 = 20 km/h$$, 1),
('pc-mouvement-energie', $$Poids et masse$$, $$Un objet de masse 10 kg sur Terre (g ≈ 10 N/kg)
poids = masse × g = 10 × 10 = 100 N$$, 2),
('svt-reproduction', $$Transmission d'un allèle$$, $$Un enfant reçoit un allèle de chaque parent pour un même gène
→ il possède donc 2 allèles, qui peuvent être identiques ou différents$$, 1),
('svt-nerveux-immunite', $$Un arc réflexe$$, $$Toucher une surface brûlante
récepteur sensoriel (peau) → moelle épinière → muscle (retrait de la main)$$, 1),
('svt-evolution', $$Sélection naturelle$$, $$Population d'insectes de couleurs variées, prédateur les repérant sur fond clair
→ les insectes foncés (mieux camouflés) survivent et se reproduisent davantage$$, 1),
('svt-risques-ressources', $$Énergie renouvelable ou non$$, $$Pétrole : formé sur des millions d'années → non renouvelable à l'échelle humaine
Énergie solaire : disponible en continu → renouvelable$$, 1),
('techno-objets', $$Fonction d'usage vs fonction technique$$, $$Un vélo :
Fonction d'usage : permettre de se déplacer
Fonction technique : la chaîne transmet le mouvement du pédalier à la roue$$, 1),
('techno-info', $$Client / serveur$$, $$Tu tapes une adresse de site web dans ton navigateur (client)
→ requête envoyée au serveur qui héberge le site → le serveur renvoie la page$$, 1),
('techno-cycle-vie', $$Cycle de vie d'un tee-shirt$$, $$Culture du coton → fabrication du tissu → confection → transport →
utilisation → fin de vie (don, recyclage ou déchet)$$, 1);

-- ============================================================
-- QUIZ (onglet "Quiz")
-- ============================================================

insert into quiz_questions (module_id, question, options, correct_index, explanation, position) values
('pc-matiere', $$L'eau (H₂O) est un exemple de...$$, '["molécule","atome","mélange hétérogène","élément chimique"]', 0, $$H₂O est un assemblage de 3 atomes : c'est une molécule.$$, 1),
('pc-matiere', $$Un mélange homogène est un mélange où...$$, '["on ne distingue pas les constituants à l''œil nu","on voit plusieurs phases","il n''y a qu''un seul constituant","c''est toujours un solide"]', 0, $$Dans un mélange homogène, les constituants sont indiscernables à l'œil nu.$$, 2),
('pc-matiere', $$La fusion est le passage de l'état...$$, '["solide à liquide","liquide à solide","liquide à gaz","gaz à liquide"]', 0, $$La fusion transforme un solide en liquide.$$, 3),
('pc-matiere', $$Pour séparer de l'eau et du sable, on utilise...$$, '["la filtration","la distillation","l''évaporation seule","rien, c''est impossible"]', 0, $$Le sable (solide) est retenu par le filtre, l'eau (liquide) passe.$$, 4),
('pc-matiere', $$Pendant un changement d'état, la température...$$, '["reste constante","augmente toujours","diminue toujours","double"]', 0, $$C'est le palier de changement d'état : la température ne varie pas tant que le changement n'est pas terminé.$$, 5),
('pc-matiere', $$Un corps pur contient...$$, '["une seule espèce chimique","plusieurs espèces chimiques","toujours de l''eau","toujours un métal"]', 0, $$C'est la définition d'un corps pur, par opposition à un mélange.$$, 6),
('pc-transformations', $$Lors d'une transformation chimique, la masse totale...$$, '["se conserve","augmente toujours","diminue toujours","dépend du hasard"]', 0, $$Loi de Lavoisier : la masse totale se conserve.$$, 1),
('pc-transformations', $$Un signe qui indique une transformation chimique est...$$, '["un dégagement de gaz","un changement de récipient","un changement de position","rien de visible n''indique jamais rien"]', 0, $$Un dégagement gazeux (effervescence) est un signe classique de réaction chimique.$$, 2),
('pc-transformations', $$Dans C + O₂ → CO₂, l'équation est équilibrée car...$$, '["il y a le même nombre de chaque atome de chaque côté","les réactifs sont plus nombreux","le carbone disparaît","les produits pèsent moins"]', 0, $$1 atome de C et 2 atomes de O de chaque côté de la flèche.$$, 3),
('pc-transformations', $$Pour équilibrer une équation, on modifie...$$, '["les coefficients devant les formules","les indices dans les formules","les noms des éléments","rien, ce n''est jamais possible"]', 0, $$On ajoute des coefficients devant les formules, sans jamais changer les indices.$$, 4),
('pc-transformations', $$Avant une réaction : 8 g de A + 4 g de B. Masse des produits obtenus ?$$, '["12 g","8 g","4 g","impossible à savoir"]', 0, $$Conservation de la masse : 8 + 4 = 12 g.$$, 5),
('pc-electricite', $$Dans un circuit en série...$$, '["il n''y a qu''un seul chemin pour le courant","le courant se répartit entre plusieurs branches","il n''y a jamais de courant","les lampes s''allument différemment selon leur position"]', 0, $$Tous les composants sont sur un unique chemin en série.$$, 1),
('pc-electricite', $$La tension se mesure avec...$$, '["un voltmètre en dérivation","un ampèremètre en série","un thermomètre","une balance"]', 0, $$Le voltmètre mesure la tension U, branché en dérivation.$$, 2),
('pc-electricite', $$Loi d'Ohm : U = R × I. Si R = 10 Ω et I = 2 A, U = ?$$, '["20 V","5 V","12 V","8 V"]', 0, $$U = 10 × 2 = 20 V.$$, 3),
('pc-electricite', $$La puissance électrique se calcule par...$$, '["P = U × I","P = U + I","P = U / I","P = U − I"]', 0, $$C'est la formule de la puissance électrique.$$, 4),
('pc-electricite', $$Un appareil sous 230 V avec I = 1 A a une puissance de...$$, '["230 W","231 W","229 W","23 W"]', 0, $$P = U × I = 230 × 1 = 230 W.$$, 5),
('pc-mouvement-energie', $$La vitesse moyenne se calcule par...$$, '["distance ÷ temps","temps ÷ distance","distance × temps","distance + temps"]', 0, $$C'est la définition de la vitesse moyenne.$$, 1),
('pc-mouvement-energie', $$Le poids d'un objet dépend...$$, '["de sa masse et de la gravité du lieu","uniquement de sa masse","uniquement de sa couleur","de rien de particulier"]', 0, $$Poids = masse × intensité de pesanteur, qui varie selon le lieu.$$, 2),
('pc-mouvement-energie', $$Une force se représente par...$$, '["une flèche (vecteur)","un point seul","un nombre seul","un cercle"]', 0, $$Une force est caractérisée par une direction, un sens, un point d'application et une intensité : elle se représente par une flèche.$$, 3),
('pc-mouvement-energie', $$L'énergie totale d'un système...$$, '["se conserve toujours","disparaît parfois","augmente toujours","diminue toujours"]', 0, $$Principe de conservation de l'énergie : elle se transforme, elle ne disparaît jamais.$$, 4),
('pc-mouvement-energie', $$Cycliste : 40 km parcourus en 2 h. Vitesse moyenne ?$$, '["20 km/h","40 km/h","80 km/h","2 km/h"]', 0, $$40 ÷ 2 = 20 km/h.$$, 5),
('svt-reproduction', $$La fécondation résulte de la fusion de...$$, '["un spermatozoïde et un ovule","deux ovules","deux spermatozoïdes","un neurone et un ovule"]', 0, $$C'est la définition de la fécondation.$$, 1),
('svt-reproduction', $$Un gène est...$$, '["une portion d''ADN portant l''information d''un caractère","un organe","une cellule entière","un chromosome entier"]', 0, $$Un gène est une portion précise d'ADN, pas la molécule entière.$$, 2),
('svt-reproduction', $$Un individu possède, pour un gène donné...$$, '["deux allèles, un de chaque parent","un seul allèle","trois allèles","aucun allèle"]', 0, $$Chaque individu hérite d'un allèle de chaque parent pour chaque gène.$$, 3),
('svt-reproduction', $$L'ADN se trouve...$$, '["dans le noyau des cellules","uniquement dans le sang","uniquement dans les os","à l''extérieur des cellules"]', 0, $$L'ADN est présent dans le noyau de chaque cellule, organisé en chromosomes.$$, 4),
('svt-nerveux-immunite', $$Un arc réflexe relie...$$, '["un récepteur sensoriel, la moelle épinière et un muscle","seulement le cerveau et un muscle","deux muscles entre eux","rien de précis"]', 0, $$C'est le trajet caractéristique d'un réflexe.$$, 1),
('svt-nerveux-immunite', $$La vaccination permet de...$$, '["produire des cellules mémoire sans provoquer la maladie","guérir instantanément une maladie déjà présente","remplacer le système immunitaire","empêcher toute infection future d''un autre agent"]', 0, $$Elle prépare le système immunitaire à réagir vite face au véritable agent infectieux.$$, 2),
('svt-nerveux-immunite', $$Les anticorps sont...$$, '["spécifiques à un agent infectieux précis","efficaces contre tous les agents infectieux","produits uniquement avant la naissance","situés uniquement dans le cerveau"]', 0, $$L'immunité adaptative produit des anticorps spécifiques à chaque agent infectieux.$$, 3),
('svt-evolution', $$La sélection naturelle favorise...$$, '["les individus portant un caractère avantageux dans leur milieu","toujours les individus les plus gros","des individus au hasard, sans lien avec le milieu","uniquement les individus les plus rapides"]', 0, $$Le caractère avantageux dépend du milieu, pas d'une règle universelle.$$, 1),
('svt-evolution', $$Les fossiles sont une preuve de l'évolution car ils montrent...$$, '["des espèces disparues et des formes intermédiaires","uniquement des espèces actuelles","que rien n''a changé au cours du temps","des objets fabriqués par l''être humain"]', 0, $$Ils témoignent de la diversité des espèces passées et de leur transformation.$$, 2),
('svt-evolution', $$La biodiversité se mesure...$$, '["à l''échelle des écosystèmes, des espèces et des gènes","uniquement au nombre d''espèces animales","uniquement à l''échelle d''un seul individu","uniquement en zone tropicale"]', 0, $$Trois échelles : écosystèmes, espèces, diversité génétique intraspécifique.$$, 3),
('svt-risques-ressources', $$Les séismes se produisent le plus souvent...$$, '["aux frontières des plaques tectoniques","au centre des plaques tectoniques","uniquement en montagne","au hasard, sans lien avec la géologie"]', 0, $$Les frontières de plaques concentrent l'essentiel de l'activité sismique.$$, 1),
('svt-risques-ressources', $$Le pétrole est une ressource...$$, '["non renouvelable à l''échelle humaine","renouvelable en quelques années","inépuisable","fabriquée par l''être humain"]', 0, $$Il s'est formé sur des millions d'années : sa consommation est bien plus rapide que sa formation.$$, 2),
('svt-risques-ressources', $$Le changement climatique est notamment lié à...$$, '["l''augmentation des émissions de gaz à effet de serre","la diminution des activités humaines","l''absence totale de causes connues","la seule activité volcanique"]', 0, $$Les émissions de gaz à effet de serre d'origine humaine sont un facteur majeur reconnu.$$, 3),
('techno-objets', $$La fonction d'usage d'un objet correspond à...$$, '["ce à quoi il sert pour l''utilisateur","son prix de fabrication","sa couleur","son poids"]', 0, $$C'est le besoin auquel répond l'objet pour celui qui l'utilise.$$, 1),
('techno-objets', $$Un matériau composite est...$$, '["une association de plusieurs matériaux","un métal pur","toujours transparent","uniquement utilisé en alimentaire"]', 0, $$Un composite associe plusieurs matériaux pour combiner leurs propriétés.$$, 2),
('techno-objets', $$Le cahier des charges sert à...$$, '["lister les fonctions et contraintes que doit respecter un objet","fabriquer directement l''objet sans réflexion","remplacer le prototype","fixer uniquement le prix"]', 0, $$C'est le document de référence avant de concevoir un objet.$$, 3),
('techno-info', $$Sur Internet, le serveur est celui qui...$$, '["fournit l''information demandée","demande toujours l''information","n''intervient jamais","sert uniquement à afficher des images"]', 0, $$Le client demande, le serveur répond en fournissant les données.$$, 1),
('techno-info', $$Une bonne pratique de sécurité informatique est...$$, '["utiliser des mots de passe différents pour chaque service","utiliser le même mot de passe partout","cliquer sur tous les liens reçus par email","désactiver toutes les mises à jour"]', 0, $$Varier les mots de passe limite les conséquences si l'un d'eux est compromis.$$, 2),
('techno-info', $$Les données circulent sur un réseau sous forme de...$$, '["données numériques codées en binaire","ondes sonores uniquement","lumière visible uniquement","texte manuscrit"]', 0, $$Toutes les données numériques sont codées en 0 et en 1.$$, 3),
('techno-cycle-vie', $$Le cycle de vie d'un objet commence par...$$, '["l''extraction des matières premières","son utilisation par le consommateur","son recyclage","sa mise en vente"]', 0, $$La première étape est l'extraction des matières premières nécessaires à sa fabrication.$$, 1),
('techno-cycle-vie', $$L'éco-conception vise à...$$, '["réduire l''impact environnemental dès la conception","augmenter le coût de fabrication sans autre objectif","ignorer la fin de vie de l''objet","ne concerner que l''emballage"]', 0, $$Elle intègre la réduction de l'impact environnemental dès la phase de conception.$$, 2),
('techno-cycle-vie', $$L'économie circulaire s'oppose à...$$, '["l''économie linéaire (extraire, fabriquer, consommer, jeter)","l''économie mondiale","l''économie locale","l''économie numérique"]', 0, $$L'économie circulaire privilégie réutilisation, réparation et recyclage plutôt que le modèle linéaire jetable.$$, 3);
