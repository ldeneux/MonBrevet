-- ============================================================
-- Prépa Brevet — contenu Histoire-Géo-EMC
-- À exécuter APRÈS schema.sql (qui crée déjà le sujet "histoire-geo-emc").
-- Additif : n'efface rien des autres matières. Ré-exécutable.
-- ============================================================

delete from modules where id in (
  'hist-guerres-totalitarismes','hist-guerre-froide-decolonisation','hist-monde-actuel',
  'geo-amenagement-territoire','geo-mondialisation','geo-france-monde',
  'emc-valeurs-republique','emc-citoyennete-engagement'
);

insert into modules (id, subject_id, title, tag, timed, position) values
  ('hist-guerres-totalitarismes', 'histoire-geo-emc', 'Histoire · Guerres mondiales et totalitarismes', $$Première Guerre mondiale · Seconde Guerre mondiale · régimes totalitaires$$, false, 1),
  ('hist-guerre-froide-decolonisation', 'histoire-geo-emc', 'Histoire · Guerre froide et décolonisation', $$Monde bipolaire · indépendances · tiers-monde$$, false, 2),
  ('hist-monde-actuel', 'histoire-geo-emc', 'Histoire · La France et le monde depuis 1989', $$Ve République · construction européenne · enjeux contemporains$$, false, 3),
  ('geo-amenagement-territoire', 'histoire-geo-emc', 'Géographie · Aménager le territoire français', $$Espaces productifs · inégalités territoriales · transition$$, false, 4),
  ('geo-mondialisation', 'histoire-geo-emc', 'Géographie · La mondialisation', $$Flux · acteurs · espaces moteurs$$, false, 5),
  ('geo-france-monde', 'histoire-geo-emc', 'Géographie · La France et l''UE dans le monde', $$Rayonnement · territoires ultramarins · Union européenne$$, false, 6),
  ('emc-valeurs-republique', 'histoire-geo-emc', 'EMC · Valeurs et principes de la République', $$Liberté, égalité, fraternité · laïcité · droits et devoirs$$, false, 7),
  ('emc-citoyennete-engagement', 'histoire-geo-emc', 'EMC · Citoyenneté et engagement', $$Vote · engagement associatif · lutte contre les discriminations$$, false, 8);

-- ============================================================
-- COURS COMPLETS (onglet "Cours")
-- ============================================================

-- ----- Histoire : Guerres mondiales et totalitarismes -----
insert into lecons (module_id, title, body, position) values
('hist-guerres-totalitarismes', $$La Première Guerre mondiale (1914-1918)$$, $$La Première Guerre mondiale débute en 1914, déclenchée par l'assassinat de l'archiduc François-Ferdinand mais résultant surtout de tensions accumulées entre grandes puissances européennes (rivalités coloniales, alliances militaires opposées).

Le conflit se caractérise par une guerre de position : les armées s'enterrent dans des tranchées, où les combats s'enlisent pendant des années dans des conditions extrêmement difficiles. De nouvelles armes (gaz, artillerie lourde, aviation) rendent le conflit particulièrement meurtrier.

La guerre s'achève en 1918 par la victoire des Alliés. Le traité de Versailles (1919) impose de lourdes conditions à l'Allemagne vaincue. Le bilan humain est considérable : plusieurs millions de morts et de blessés, une génération durablement marquée.$$, 1),
('hist-guerres-totalitarismes', $$Les régimes totalitaires de l'entre-deux-guerres$$, $$Après la Première Guerre mondiale, plusieurs régimes totalitaires s'installent en Europe. Un régime totalitaire se caractérise par un parti unique, un chef tout-puissant, une propagande omniprésente, l'embrigadement de la population et une répression violente de toute opposition.

L'Italie fasciste de Mussolini (à partir de 1922) est le premier exemple. L'Allemagne nazie d'Hitler s'installe en 1933, portée par la crise économique et le ressentiment lié au traité de Versailles. L'URSS de Staline développe, de son côté, un régime communiste totalitaire marqué par la collectivisation forcée et une répression de masse (les grandes purges).

Malgré des idéologies différentes (nationalisme raciste pour le nazisme, communisme pour le stalinisme), ces régimes partagent des méthodes communes de contrôle total de la société.$$, 2),
('hist-guerres-totalitarismes', $$La Seconde Guerre mondiale et le génocide des Juifs$$, $$La Seconde Guerre mondiale débute en septembre 1939 avec l'invasion de la Pologne par l'Allemagne nazie. Le conflit s'étend rapidement à l'échelle mondiale, opposant les forces de l'Axe (Allemagne, Italie, Japon) aux Alliés (dont la France, le Royaume-Uni, l'URSS à partir de 1941, les États-Unis à partir de 1941).

Le régime nazi met en œuvre la Shoah, l'extermination systématique des Juifs d'Europe, ainsi que la persécution d'autres groupes (Roms, personnes handicapées, opposants politiques). Ce génocide, organisé notamment dans des camps de concentration et d'extermination, fait environ six millions de victimes juives.

La guerre s'achève en 1945 par la défaite de l'Allemagne puis du Japon. Le bilan humain est le plus lourd de l'histoire (plusieurs dizaines de millions de morts), ce qui conduit à la création de l'ONU pour tenter de préserver la paix mondiale.$$, 3);

-- ----- Histoire : Guerre froide et décolonisation -----
insert into lecons (module_id, title, body, position) values
('hist-guerre-froide-decolonisation', $$La guerre froide : un monde bipolaire$$, $$À partir de 1947, le monde se retrouve divisé en deux blocs opposés : le bloc occidental, mené par les États-Unis (modèle capitaliste et démocratique), et le bloc de l'Est, mené par l'URSS (modèle communiste).

Cette période, appelée guerre froide, se caractérise par une opposition idéologique et une course aux armements (notamment nucléaire), sans affrontement militaire direct entre les deux superpuissances. Des crises majeures ponctuent cette période, comme le blocus de Berlin (1948-1949) ou la crise des missiles de Cuba (1962), qui font craindre un conflit ouvert.

L'Europe est elle-même divisée, symbolisée par le mur de Berlin construit en 1961, qui sépare Berlin-Ouest et Berlin-Est.$$, 1),
('hist-guerre-froide-decolonisation', $$La décolonisation$$, $$Après 1945, les empires coloniaux européens s'affaiblissent : les puissances coloniales sont économiquement fragilisées par la guerre, tandis que les mouvements nationalistes se renforcent dans les colonies, portés par le principe du droit des peuples à disposer d'eux-mêmes.

La décolonisation prend des formes variées selon les territoires : elle se fait par la négociation dans certains cas, mais par un conflit armé dans d'autres, comme la guerre d'Algérie (1954-1962), particulièrement marquante pour la France.

Ce processus conduit à la naissance de nombreux nouveaux États indépendants, notamment en Afrique et en Asie, qui cherchent souvent à se positionner en dehors des deux blocs de la guerre froide (mouvement des non-alignés, apparu à la conférence de Bandung en 1955).$$, 2),
('hist-guerre-froide-decolonisation', $$Vers la fin de la guerre froide$$, $$À partir des années 1980, le bloc soviétique s'essouffle : difficultés économiques, contestations internes, réformes engagées par Mikhaïl Gorbatchev (glasnost, perestroïka).

En 1989, la chute du mur de Berlin marque symboliquement la fin de la division de l'Europe. En 1991, l'URSS se dissout officiellement, mettant fin à la guerre froide et à l'opposition entre les deux blocs qui avait structuré les relations internationales pendant plus de quarante ans.$$, 3);

-- ----- Histoire : La France et le monde depuis 1989 -----
insert into lecons (module_id, title, body, position) values
('hist-monde-actuel', $$La Ve République : institutions et évolutions$$, $$La Ve République est fondée en 1958 sous l'impulsion du général de Gaulle, dans un contexte de crise politique. Elle met en place un régime semi-présidentiel, qui donne un rôle important au président de la République tout en conservant un Premier ministre responsable devant le Parlement.

Depuis 1962, le président de la République est élu au suffrage universel direct par l'ensemble des citoyens, ce qui renforce sa légitimité démocratique. Le Parlement, composé de l'Assemblée nationale et du Sénat, vote les lois et contrôle l'action du gouvernement.

Ces institutions ont connu plusieurs évolutions depuis 1958 (réduction du mandat présidentiel à cinq ans en 2000, révisions constitutionnelles diverses), tout en conservant leur architecture générale.$$, 1),
('hist-monde-actuel', $$La construction européenne$$, $$La construction européenne débute dans les années 1950, dans un objectif principal de préserver la paix entre des pays qui se sont opposés à plusieurs reprises, en les liant par des intérêts économiques communs. La Communauté européenne du charbon et de l'acier (CECA, 1951) en est la première étape.

Le traité de Rome (1957) crée la Communauté économique européenne (marché commun). La construction européenne s'approfondit ensuite progressivement : le traité de Maastricht (1992) crée l'Union européenne et pose les bases de la monnaie unique, l'euro, mise en circulation en 2002.

L'Union européenne s'est aussi élargie au fil des décennies, intégrant progressivement de nouveaux pays, notamment après la fin de la guerre froide.$$, 2),
('hist-monde-actuel', $$Le monde depuis les années 1990 : enjeux contemporains$$, $$Depuis la fin de la guerre froide, la mondialisation s'accélère : les échanges économiques, financiers et culturels se multiplient à l'échelle planétaire, et de nouvelles puissances émergent sur la scène internationale.

Le monde contemporain est marqué par de nouveaux défis : le terrorisme international, dont les attentats du 11 septembre 2001 aux États-Unis constituent un tournant majeur, mais aussi les enjeux environnementaux (changement climatique) et les mouvements migratoires internationaux, qui deviennent des questions centrales du débat international.$$, 3);

-- ----- Géographie : Aménager le territoire français -----
insert into lecons (module_id, title, body, position) values
('geo-amenagement-territoire', $$Les espaces productifs français$$, $$Le territoire français comprend différents types d'espaces productifs : des espaces agricoles (grandes cultures, élevage, viticulture, selon les régions), des espaces industriels (souvent concentrés autour de grandes villes ou de zones portuaires) et des espaces dédiés aux services, très majoritaires dans l'économie française actuelle.

On observe deux tendances marquantes : la littoralisation, c'est-à-dire la concentration croissante des activités et de la population sur le littoral, et la métropolisation, c'est-à-dire la concentration des fonctions de commandement économique dans les grandes métropoles, en particulier l'aire urbaine de Paris.$$, 1),
('geo-amenagement-territoire', $$Les inégalités territoriales$$, $$Le territoire français connaît des inégalités entre différents types d'espaces. On observe des contrastes entre les villes, dynamiques et bien connectées, et certaines zones rurales plus isolées, parfois confrontées à des difficultés d'accès aux services (on parle de déserts médicaux quand l'accès aux soins devient difficile).

À l'intérieur même des villes, des inégalités existent aussi entre les centres, souvent valorisés, et certains quartiers périphériques, qui peuvent cumuler des difficultés économiques et sociales : ce sont les quartiers prioritaires de la politique de la ville, qui font l'objet de dispositifs spécifiques de soutien.$$, 2),
('geo-amenagement-territoire', $$Aménager et développer les territoires$$, $$Face à ces inégalités, l'État et les collectivités territoriales mettent en œuvre des politiques d'aménagement du territoire, qui visent à améliorer la répartition des activités, des infrastructures et des services sur l'ensemble du territoire (par exemple, le développement des transports ou le soutien à la revitalisation des centres-villes).

Ces politiques intègrent de plus en plus les enjeux de transition écologique : développement des mobilités douces, rénovation énergétique des bâtiments, préservation des espaces naturels, dans l'objectif de concilier développement des territoires et réduction de l'impact environnemental.$$, 3);

-- ----- Géographie : La mondialisation -----
insert into lecons (module_id, title, body, position) values
('geo-mondialisation', $$Qu'est-ce que la mondialisation ?$$, $$La mondialisation désigne la mise en relation croissante des différentes parties du monde par la multiplication des échanges de marchandises, de capitaux, de personnes et d'informations. Elle s'appuie notamment sur la baisse du coût des transports et le développement des technologies de communication.

Ce phénomène crée une interdépendance croissante entre les économies nationales : un évènement survenant dans une région du monde peut avoir des répercussions à l'échelle planétaire.$$, 1),
('geo-mondialisation', $$Les acteurs de la mondialisation$$, $$Plusieurs types d'acteurs participent à la mondialisation. Les firmes transnationales (FTN), entreprises présentes dans plusieurs pays, organisent une partie de leur production à l'échelle mondiale pour réduire leurs coûts et accéder à de nouveaux marchés.

Les États restent des acteurs majeurs, à travers leurs politiques économiques et commerciales. Des organisations internationales (comme l'Organisation mondiale du commerce) encadrent les échanges, tandis que des organisations non gouvernementales (ONG) interviennent sur des enjeux sociaux et environnementaux liés à la mondialisation.$$, 2),
('geo-mondialisation', $$Les espaces moteurs et les inégalités de la mondialisation$$, $$La mondialisation s'organise autour de certains espaces moteurs : les grandes métropoles mondiales (qui concentrent les fonctions de commandement économique et financier) et les grandes façades maritimes, par lesquelles transite l'essentiel du commerce mondial de marchandises.

Cependant, tous les territoires et toutes les populations ne bénéficient pas de la même manière des effets de la mondialisation : elle génère aussi des inégalités importantes, ce qui explique l'existence de contestations et de débats sur ses effets, tant à l'échelle internationale que locale.$$, 3);

-- ----- Géographie : La France et l'UE dans le monde -----
insert into lecons (module_id, title, body, position) values
('geo-france-monde', $$La France, une puissance mondiale$$, $$La France exerce une influence à l'échelle mondiale à travers plusieurs types de rayonnement : diplomatique (membre permanent du Conseil de sécurité de l'ONU), culturel (langue française, patrimoine, francophonie), et économique (entreprises présentes dans de nombreux pays).

Elle dispose également d'un large réseau diplomatique et d'une présence militaire dans plusieurs régions du monde, qui contribuent à sa capacité d'action sur la scène internationale.$$, 1),
('geo-france-monde', $$Les territoires ultramarins français$$, $$La France possède des territoires situés en dehors de l'Europe, dans plusieurs océans (Antilles, Guyane, Réunion, Nouvelle-Calédonie, Polynésie française...), regroupés sous les sigles DROM (départements et régions d'outre-mer) et COM (collectivités d'outre-mer).

Ces territoires confèrent à la France une présence maritime mondiale importante, mais font aussi face à des enjeux spécifiques : éloignement de la métropole, vulnérabilité face aux risques climatiques, préservation d'une biodiversité souvent exceptionnelle.$$, 2),
('geo-france-monde', $$L'Union européenne, un espace de puissance$$, $$L'Union européenne constitue un des principaux ensembles économiques mondiaux, avec un marché intérieur unifié entre ses États membres. Elle dispose d'institutions communes (Commission européenne, Parlement européen, Conseil de l'UE) qui élaborent des règles applicables à l'ensemble des pays membres.

L'UE fait cependant face à plusieurs défis : l'hétérogénéité économique entre ses membres, des débats internes sur son fonctionnement et son élargissement, ainsi que des évolutions de sa composition, comme le retrait du Royaume-Uni (Brexit) effectif en 2020.$$, 3);

-- ----- EMC : Valeurs et principes de la République -----
insert into lecons (module_id, title, body, position) values
('emc-valeurs-republique', $$Liberté, égalité, fraternité$$, $$« Liberté, égalité, fraternité » est la devise de la République française, héritée de la Révolution française et inscrite dans la Constitution. La liberté désigne la capacité de penser, de s'exprimer et d'agir, dans le respect de la loi et de la liberté d'autrui.

L'égalité signifie que tous les citoyens ont les mêmes droits, quels que soient leur origine, leur sexe ou leur religion, et sont égaux devant la loi. La fraternité renvoie à la solidarité entre les citoyens, qui se traduit notamment par le système de protection sociale.$$, 1),
('emc-valeurs-republique', $$La laïcité$$, $$La laïcité est un principe fondamental de la République française, inscrit notamment dans la loi de 1905 qui organise la séparation des Églises et de l'État. Elle garantit à chacun la liberté de croire ou de ne pas croire, et assure la neutralité de l'État et des services publics à l'égard des religions.

À l'école, la laïcité implique que l'enseignement public soit neutre sur le plan religieux, permettant à tous les élèves, quelles que soient leurs convictions, d'étudier ensemble dans un cadre commun.$$, 2),
('emc-valeurs-republique', $$Droits et devoirs du citoyen$$, $$Être citoyen implique de disposer de droits fondamentaux, reconnus notamment par la Déclaration des droits de l'homme et du citoyen de 1789 : liberté d'expression, sûreté, propriété, résistance à l'oppression.

Ces droits s'accompagnent de devoirs : respecter les lois, contribuer aux charges communes (comme l'impôt), et plus largement participer à la vie collective. Droits et devoirs sont ainsi indissociables dans l'exercice de la citoyenneté.$$, 3);

-- ----- EMC : Citoyenneté et engagement -----
insert into lecons (module_id, title, body, position) values
('emc-citoyennete-engagement', $$Voter et participer à la vie démocratique$$, $$Le droit de vote est un droit fondamental des citoyens majeurs, qui leur permet de participer aux décisions collectives en élisant leurs représentants (élections présidentielle, législatives, municipales, européennes...).

Au-delà du vote, la démocratie offre d'autres formes de participation : la pétition, la manifestation, la consultation ou le référendum local, qui permettent aux citoyens de s'exprimer sur des sujets précis. L'abstention, c'est-à-dire le fait de ne pas voter, reste un enjeu important pour le fonctionnement de la démocratie.$$, 1),
('emc-citoyennete-engagement', $$S'engager : associations, bénévolat, défense$$, $$L'engagement citoyen ne se limite pas au vote : il peut prendre la forme d'un engagement associatif ou bénévole (aide humanitaire, protection de l'environnement, sport, culture...), qui contribue au fonctionnement de la société.

Tous les jeunes Français doivent aussi participer à la Journée défense et citoyenneté (JDC), qui les sensibilise aux enjeux de défense nationale. Ces différentes formes d'engagement développent le sens de la responsabilité collective.$$, 2),
('emc-citoyennete-engagement', $$Vivre ensemble : lutte contre les discriminations$$, $$Le principe d'égalité implique l'interdiction des discriminations, c'est-à-dire des traitements différents et injustifiés fondés sur des critères comme l'origine, le sexe, la religion, le handicap ou l'orientation sexuelle. La loi française sanctionne ces discriminations.

Plusieurs institutions veillent au respect de ce principe, comme le Défenseur des droits, qui peut être saisi en cas de discrimination. Vivre ensemble suppose ainsi le respect mutuel entre tous les citoyens, dans le cadre commun fixé par la loi.$$, 3);

-- ============================================================
-- SYNTHÈSE EN COULEUR (onglet "Synthèse")
-- ============================================================

insert into cours_sections (module_id, type, content, position) values
('hist-guerres-totalitarismes', 'def', $$Un régime totalitaire impose un parti unique, un chef tout-puissant, une propagande omniprésente et une répression violente de toute opposition.$$, 1),
('hist-guerres-totalitarismes', 'method', $$Pour situer un évènement historique, on le replace toujours dans sa chronologie ET son contexte (causes, déroulement, conséquences).$$, 2),
('hist-guerres-totalitarismes', 'method', $$Pour comparer deux régimes totalitaires, on identifie d'abord leurs points communs (méthodes de contrôle) avant leurs différences (idéologie).$$, 3),
('hist-guerres-totalitarismes', 'piege', $$Ne pas confondre les dates : 1914-1918 (Première Guerre mondiale) et 1939-1945 (Seconde Guerre mondiale).$$, 4),
('hist-guerres-totalitarismes', 'retenir', $$La Shoah est le génocide des Juifs d'Europe organisé par le régime nazi pendant la Seconde Guerre mondiale : environ 6 millions de victimes.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('hist-guerre-froide-decolonisation', 'def', $$La guerre froide est l'opposition, entre 1947 et 1991, entre le bloc occidental (mené par les États-Unis) et le bloc de l'Est (mené par l'URSS), sans conflit armé direct.$$, 1),
('hist-guerre-froide-decolonisation', 'method', $$Pour expliquer la décolonisation, on distingue toujours les causes (affaiblissement des empires, nationalismes) des moyens employés (négociation ou guerre).$$, 2),
('hist-guerre-froide-decolonisation', 'method', $$Le mouvement des non-alignés regroupe les États qui refusent de choisir entre les deux blocs de la guerre froide.$$, 3),
('hist-guerre-froide-decolonisation', 'piege', $$La chute du mur de Berlin (1989) et la dissolution de l'URSS (1991) sont deux évènements distincts, à ne pas confondre.$$, 4),
('hist-guerre-froide-decolonisation', 'retenir', $$La guerre d'Algérie (1954-1962) est l'épisode de décolonisation le plus marquant pour la France.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('hist-monde-actuel', 'def', $$La Ve République, fondée en 1958, est un régime semi-présidentiel : le président et le Premier ministre partagent le pouvoir exécutif.$$, 1),
('hist-monde-actuel', 'method', $$Pour situer une étape de la construction européenne, on retient sa date, son objectif et ce qu'elle a concrètement changé.$$, 2),
('hist-monde-actuel', 'method', $$Depuis 1962, le président de la République est élu au suffrage universel direct.$$, 3),
('hist-monde-actuel', 'piege', $$Ne pas confondre l'Union européenne (créée en 1992 par le traité de Maastricht) et la zone euro (monnaie mise en circulation en 2002).$$, 4),
('hist-monde-actuel', 'retenir', $$Les attentats du 11 septembre 2001 marquent un tournant dans la lutte internationale contre le terrorisme.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('geo-amenagement-territoire', 'def', $$La littoralisation est la concentration croissante des activités sur le littoral ; la métropolisation est la concentration des fonctions de commandement dans les grandes métropoles.$$, 1),
('geo-amenagement-territoire', 'method', $$Pour analyser une carte du territoire français, on repère toujours les contrastes entre espaces dynamiques et espaces en difficulté.$$, 2),
('geo-amenagement-territoire', 'method', $$L'aménagement du territoire vise à réduire les inégalités entre les territoires par des politiques publiques ciblées.$$, 3),
('geo-amenagement-territoire', 'piege', $$Un désert médical désigne un manque d'accès aux soins, pas une région sans habitants.$$, 4),
('geo-amenagement-territoire', 'retenir', $$Les quartiers prioritaires de la politique de la ville bénéficient de dispositifs spécifiques de soutien.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('geo-mondialisation', 'def', $$La mondialisation est la mise en relation croissante des différentes parties du monde par les échanges de marchandises, de capitaux, de personnes et d'informations.$$, 1),
('geo-mondialisation', 'method', $$Pour identifier un acteur de la mondialisation dans un document, on se demande s'il s'agit d'une entreprise (FTN), d'un État, d'une organisation internationale ou d'une ONG.$$, 2),
('geo-mondialisation', 'method', $$Les grandes façades maritimes concentrent l'essentiel du commerce mondial de marchandises.$$, 3),
('geo-mondialisation', 'piege', $$La mondialisation ne profite pas également à tous les territoires : elle crée aussi des inégalités et des contestations.$$, 4),
('geo-mondialisation', 'retenir', $$FTN = firme transnationale : entreprise implantée dans plusieurs pays.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('geo-france-monde', 'def', $$La France exerce un rayonnement mondial diplomatique, culturel et économique, renforcé par son siège permanent au Conseil de sécurité de l'ONU.$$, 1),
('geo-france-monde', 'method', $$DROM = département et région d'outre-mer ; COM = collectivité d'outre-mer.$$, 2),
('geo-france-monde', 'method', $$Pour situer la puissance de la France, on combine toujours plusieurs échelles : la métropole, les territoires ultramarins, et son rôle au sein de l'UE.$$, 3),
('geo-france-monde', 'piege', $$Les territoires ultramarins ne sont pas des colonies : ce sont des territoires français à part entière (DROM ou COM).$$, 4),
('geo-france-monde', 'retenir', $$Le Royaume-Uni a quitté l'Union européenne (Brexit) en 2020.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('emc-valeurs-republique', 'def', $$« Liberté, égalité, fraternité » est la devise de la République française, inscrite dans la Constitution.$$, 1),
('emc-valeurs-republique', 'method', $$La laïcité garantit à la fois la liberté de croire ou de ne pas croire, et la neutralité religieuse de l'État et des services publics.$$, 2),
('emc-valeurs-republique', 'method', $$Pour analyser un droit ou un devoir, on se demande toujours à quel texte fondateur il se rattache (Déclaration de 1789, Constitution, loi de 1905...).$$, 3),
('emc-valeurs-republique', 'piege', $$La laïcité n'interdit pas la religion : elle garantit la liberté de conscience de chacun et la neutralité de l'État.$$, 4),
('emc-valeurs-republique', 'retenir', $$La loi de 1905 organise la séparation des Églises et de l'État en France.$$, 5);

insert into cours_sections (module_id, type, content, position) values
('emc-citoyennete-engagement', 'def', $$Le droit de vote permet aux citoyens majeurs d'élire leurs représentants et de participer aux décisions collectives.$$, 1),
('emc-citoyennete-engagement', 'method', $$Au-delà du vote, on peut participer à la vie démocratique par la pétition, la manifestation ou l'engagement associatif.$$, 2),
('emc-citoyennete-engagement', 'method', $$Une discrimination est un traitement différent et injustifié fondé sur un critère interdit par la loi (origine, sexe, religion, handicap...).$$, 3),
('emc-citoyennete-engagement', 'piege', $$L'abstention (ne pas voter) n'est pas illégale en France, mais elle affaiblit la représentativité des élus.$$, 4),
('emc-citoyennete-engagement', 'retenir', $$Le Défenseur des droits est l'institution qui peut être saisie en cas de discrimination.$$, 5);

-- ============================================================
-- EXEMPLES (onglet "Exemples")
-- ============================================================

insert into examples (module_id, title, body, position) values
('hist-guerres-totalitarismes', $$Repère chronologique$$, $$1914-1918 : Première Guerre mondiale
1933 : arrivée d'Hitler au pouvoir en Allemagne
1939-1945 : Seconde Guerre mondiale$$, 1),
('hist-guerre-froide-decolonisation', $$Repère chronologique$$, $$1947 : début de la guerre froide
1954-1962 : guerre d'Algérie
1989 : chute du mur de Berlin
1991 : dissolution de l'URSS$$, 1),
('hist-monde-actuel', $$Repère chronologique$$, $$1958 : fondation de la Ve République
1992 : traité de Maastricht (création de l'UE)
2001 : attentats du 11 septembre$$, 1),
('geo-amenagement-territoire', $$Lire un contraste territorial$$, $$Une carte des espaces productifs montre :
littoral = zones industrialo-portuaires denses
arrière-pays rural = agriculture, densité plus faible$$, 1),
('geo-mondialisation', $$Identifier un acteur$$, $$Une entreprise implantée dans 40 pays, qui délocalise sa production
→ c'est une firme transnationale (FTN)$$, 1),
('geo-france-monde', $$Situer un territoire ultramarin$$, $$La Réunion : DROM français
située dans l'océan Indien, loin de la métropole$$, 1),
('emc-valeurs-republique', $$Appliquer la laïcité$$, $$À l'école publique :
enseignement neutre sur le plan religieux, ouvert à tous les élèves$$, 1),
('emc-citoyennete-engagement', $$Une forme d'engagement$$, $$S'inscrire dans une association de protection de l'environnement
→ un exemple d'engagement citoyen bénévole$$, 1);

-- ============================================================
-- QUIZ (onglet "Quiz")
-- ============================================================

insert into quiz_questions (module_id, question, options, correct_index, explanation, position) values
('hist-guerres-totalitarismes', $$La Première Guerre mondiale se déroule de...$$, '["1914 à 1918","1939 à 1945","1918 à 1922","1900 à 1914"]', 0, $$C'est la période exacte du premier conflit mondial.$$, 1),
('hist-guerres-totalitarismes', $$Un régime totalitaire se caractérise par...$$, '["un parti unique et une répression de toute opposition","des élections libres régulières","une presse totalement indépendante","l''absence de chef d''État"]', 0, $$C'est la définition même d'un régime totalitaire.$$, 2),
('hist-guerres-totalitarismes', $$La Shoah désigne...$$, '["le génocide des Juifs d''Europe par le régime nazi","la bataille de Stalingrad","le traité de Versailles","la crise de 1929"]', 0, $$C'est le nom donné à ce génocide perpétré pendant la Seconde Guerre mondiale.$$, 3),
('hist-guerres-totalitarismes', $$L'URSS de Staline est un régime...$$, '["communiste totalitaire","démocratique parlementaire","fasciste","monarchique"]', 0, $$Le stalinisme est une forme de totalitarisme communiste.$$, 4),
('hist-guerres-totalitarismes', $$Le traité de Versailles est signé en...$$, '["1919","1914","1939","1945"]', 0, $$Il met fin à la Première Guerre mondiale en imposant des conditions à l'Allemagne.$$, 5),
('hist-guerres-totalitarismes', $$La Seconde Guerre mondiale débute par...$$, '["l''invasion de la Pologne par l''Allemagne","l''attaque de Pearl Harbor","la chute de Berlin","le débarquement de Normandie"]', 0, $$L'invasion de la Pologne en septembre 1939 déclenche le conflit.$$, 6),
('hist-guerre-froide-decolonisation', $$La guerre froide oppose...$$, '["le bloc occidental (États-Unis) et le bloc de l''Est (URSS)","la France et l''Allemagne","le Nord et le Sud des États-Unis","l''Europe et l''Afrique"]', 0, $$Ce sont les deux blocs qui structurent le monde de 1947 à 1991.$$, 1),
('hist-guerre-froide-decolonisation', $$Le mur de Berlin tombe en...$$, '["1989","1991","1961","1947"]', 0, $$C'est un évènement symbolique de la fin de la guerre froide.$$, 2),
('hist-guerre-froide-decolonisation', $$La guerre d'Algérie a lieu de...$$, '["1954 à 1962","1945 à 1950","1962 à 1970","1939 à 1945"]', 0, $$C'est l'épisode de décolonisation le plus marquant pour la France.$$, 3),
('hist-guerre-froide-decolonisation', $$Le mouvement des non-alignés regroupe des États qui...$$, '["refusent de choisir entre les deux blocs","font partie du bloc occidental","font partie du bloc de l''Est","sont tous européens"]', 0, $$Ils cherchent à se tenir à l'écart de l'opposition Est-Ouest.$$, 4),
('hist-guerre-froide-decolonisation', $$L'URSS se dissout en...$$, '["1991","1989","1985","2001"]', 0, $$C'est la date officielle de la fin de l'URSS.$$, 5),
('hist-guerre-froide-decolonisation', $$La décolonisation se fait...$$, '["parfois par négociation, parfois par la guerre","toujours par la guerre","toujours par la négociation","jamais complètement"]', 0, $$Les formes varient selon les territoires et les puissances coloniales.$$, 6),
('hist-monde-actuel', $$La Ve République est fondée en...$$, '["1958","1945","1962","1992"]', 0, $$Elle est fondée sous l'impulsion du général de Gaulle.$$, 1),
('hist-monde-actuel', $$Depuis 1962, le président de la République est élu...$$, '["au suffrage universel direct","uniquement par les députés","par les maires de France","par tirage au sort"]', 0, $$C'est une réforme majeure des institutions de la Ve République.$$, 2),
('hist-monde-actuel', $$L'euro est mis en circulation en...$$, '["2002","1992","1958","1989"]', 0, $$Le traité de Maastricht (1992) pose les bases de la monnaie unique, mise en circulation en 2002.$$, 3),
('hist-monde-actuel', $$Les attentats du 11 septembre 2001 ont lieu...$$, '["aux États-Unis","en France","en Allemagne","au Royaume-Uni"]', 0, $$Ils marquent un tournant dans la lutte contre le terrorisme international.$$, 4),
('hist-monde-actuel', $$La CECA (1951) est la première étape de...$$, '["la construction européenne","la guerre froide","la décolonisation","la Ve République"]', 0, $$C'est l'ancêtre de l'actuelle Union européenne.$$, 5),
('hist-monde-actuel', $$Le régime de la Ve République est qualifié de...$$, '["semi-présidentiel","totalement présidentiel","parlementaire pur","monarchique"]', 0, $$Le pouvoir exécutif est partagé entre le président et le Premier ministre.$$, 6),
('geo-amenagement-territoire', $$La littoralisation désigne...$$, '["la concentration des activités sur le littoral","la construction de ports uniquement","le déplacement des frontières","l''abandon des littoraux"]', 0, $$C'est une tendance forte de l'organisation du territoire français.$$, 1),
('geo-amenagement-territoire', $$Un désert médical est une zone où...$$, '["l''accès aux soins est difficile","il n''y a aucun habitant","il fait très chaud","il n''y a pas d''école"]', 0, $$Ce terme désigne un manque d'accès aux soins, pas un désert géographique.$$, 2),
('geo-amenagement-territoire', $$La métropolisation désigne...$$, '["la concentration des fonctions de commandement dans les grandes métropoles","la création de nouvelles régions","la disparition des campagnes","la construction de métros"]', 0, $$Les grandes métropoles concentrent de plus en plus les fonctions économiques majeures.$$, 3),
('geo-amenagement-territoire', $$Les quartiers prioritaires de la politique de la ville bénéficient...$$, '["de dispositifs spécifiques de soutien","d''aucune aide particulière","uniquement d''aides agricoles","de statuts d''indépendance"]', 0, $$Ils font l'objet de politiques publiques ciblées pour réduire les inégalités.$$, 4),
('geo-amenagement-territoire', $$L'aménagement du territoire vise à...$$, '["réduire les inégalités entre les territoires","créer de nouvelles frontières","supprimer les villes","uniformiser tous les paysages"]', 0, $$C'est l'objectif principal des politiques d'aménagement.$$, 5),
('geo-amenagement-territoire', $$La transition écologique dans l'aménagement inclut...$$, '["le développement des mobilités douces","la suppression de tous les transports","l''arrêt de toute construction","la disparition des villes"]', 0, $$Elle vise à concilier développement des territoires et réduction de l'impact environnemental.$$, 6),
('geo-mondialisation', $$La mondialisation désigne...$$, '["la mise en relation croissante des différentes parties du monde","la disparition des frontières politiques","la fin du commerce international","un phénomène uniquement européen"]', 0, $$Elle se traduit par la multiplication des échanges à l'échelle mondiale.$$, 1),
('geo-mondialisation', $$Une FTN est...$$, '["une firme transnationale, implantée dans plusieurs pays","une organisation non gouvernementale","un traité international","une institution de l''ONU"]', 0, $$C'est un acteur économique majeur de la mondialisation.$$, 2),
('geo-mondialisation', $$Les grandes façades maritimes concentrent...$$, '["l''essentiel du commerce mondial de marchandises","uniquement la pêche","aucune activité économique","seulement le tourisme"]', 0, $$Elles sont des espaces moteurs majeurs de la mondialisation.$$, 3),
('geo-mondialisation', $$La mondialisation profite...$$, '["inégalement aux territoires et aux populations","également à tous les territoires","uniquement aux pays pauvres","uniquement aux zones rurales"]', 0, $$Elle crée des inégalités qui expliquent certaines contestations.$$, 4),
('geo-mondialisation', $$Une ONG intervient principalement sur des enjeux...$$, '["sociaux et environnementaux","uniquement militaires","uniquement financiers","uniquement sportifs"]', 0, $$Les ONG jouent un rôle spécifique, différent des entreprises ou des États.$$, 5),
('geo-mondialisation', $$L'OMC est une organisation qui...$$, '["encadre les échanges commerciaux internationaux","gère la monnaie européenne","organise les Jeux olympiques","dirige l''ONU"]', 0, $$L'Organisation mondiale du commerce régule les échanges entre pays.$$, 6),
('geo-france-monde', $$La France siège en permanence...$$, '["au Conseil de sécurité de l''ONU","au gouvernement allemand","au Parlement britannique","au Congrès américain"]', 0, $$C'est un des éléments de son rayonnement diplomatique mondial.$$, 1),
('geo-france-monde', $$DROM signifie...$$, '["département et région d''outre-mer","direction régionale de l''outre-mer","district de la République outre-mer","aucune de ces réponses"]', 0, $$C'est le statut de territoires comme la Réunion ou la Guadeloupe.$$, 2),
('geo-france-monde', $$Le Brexit, retrait du Royaume-Uni de l'UE, est effectif en...$$, '["2020","2016","1992","2002"]', 0, $$Le référendum a eu lieu en 2016, le retrait effectif en 2020.$$, 3),
('geo-france-monde', $$Les territoires ultramarins français sont...$$, '["des territoires français à part entière","des colonies","des pays indépendants alliés à la France","des territoires sous mandat de l''ONU"]', 0, $$Ce sont des DROM ou des COM, intégrés à la République française.$$, 4),
('geo-france-monde', $$L'Union européenne dispose notamment...$$, '["d''un Parlement européen et d''une Commission européenne","uniquement d''une armée commune","uniquement d''une monnaie commune sans institutions","d''un seul chef d''État pour tous les pays"]', 0, $$Ce sont deux de ses institutions principales.$$, 5),
('geo-france-monde', $$Le rayonnement culturel de la France s'appuie notamment sur...$$, '["la francophonie","uniquement le tourisme","uniquement le sport","uniquement l''agriculture"]', 0, $$La langue française et son usage dans le monde en sont un vecteur important.$$, 6),
('emc-valeurs-republique', $$La devise de la République française est...$$, '["Liberté, égalité, fraternité","Unité, travail, progrès","Paix, justice, liberté","Ordre, travail, patrie"]', 0, $$Elle est inscrite dans la Constitution française.$$, 1),
('emc-valeurs-republique', $$La loi de 1905 organise...$$, '["la séparation des Églises et de l''État","le droit de vote des femmes","la journée de 8 heures","la création de la Sécurité sociale"]', 0, $$C'est le texte fondateur de la laïcité en France.$$, 2),
('emc-valeurs-republique', $$La laïcité garantit...$$, '["la liberté de croire ou de ne pas croire","l''obligation de pratiquer une religion","l''interdiction de toute religion","la religion d''État obligatoire"]', 0, $$Elle assure la liberté de conscience de chacun, dans un cadre neutre.$$, 3),
('emc-valeurs-republique', $$La Déclaration des droits de l'homme et du citoyen date de...$$, '["1789","1905","1958","1848"]', 0, $$Elle est adoptée pendant la Révolution française.$$, 4),
('emc-valeurs-republique', $$Un devoir du citoyen est notamment...$$, '["de respecter les lois","de voter obligatoirement à chaque élection","de payer un impôt fixe identique pour tous","d''appartenir à une association"]', 0, $$Le respect des lois fait partie des devoirs fondamentaux du citoyen.$$, 5),
('emc-valeurs-republique', $$À l'école publique, la laïcité implique...$$, '["un enseignement neutre sur le plan religieux","l''enseignement d''une seule religion","l''interdiction de tout enseignement sur les religions","rien de particulier"]', 0, $$L'école publique doit rester neutre pour accueillir tous les élèves.$$, 6),
('emc-citoyennete-engagement', $$Le droit de vote en France est accordé...$$, '["à partir de la majorité (18 ans)","dès la naissance","à partir de 21 ans","uniquement aux fonctionnaires"]', 0, $$La majorité électorale est fixée à 18 ans en France.$$, 1),
('emc-citoyennete-engagement', $$L'abstention désigne...$$, '["le fait de ne pas voter","l''obligation de voter","un mode de scrutin","une forme de discrimination"]', 0, $$C'est un enjeu important pour la représentativité démocratique.$$, 2),
('emc-citoyennete-engagement', $$La JDC (Journée défense et citoyenneté) sensibilise notamment...$$, '["aux enjeux de défense nationale","uniquement au sport","uniquement à l''orientation scolaire","uniquement à la santé"]', 0, $$Elle concerne tous les jeunes Français.$$, 3),
('emc-citoyennete-engagement', $$Une discrimination est...$$, '["un traitement différent et injustifié fondé sur un critère interdit par la loi","une opinion personnelle","un vote démocratique","un débat public"]', 0, $$Elle est sanctionnée par la loi française.$$, 4),
('emc-citoyennete-engagement', $$Le Défenseur des droits peut être saisi...$$, '["en cas de discrimination","uniquement pour des questions fiscales","uniquement par les entreprises","uniquement pour des accidents de la route"]', 0, $$C'est l'institution compétente en matière de discrimination.$$, 5),
('emc-citoyennete-engagement', $$S'engager dans une association est un exemple...$$, '["d''engagement citoyen bénévole","d''obligation légale","de sanction judiciaire","de devoir fiscal"]', 0, $$C'est une des formes possibles de participation à la vie collective.$$, 6);
