-- ============================================================
-- Prépa Brevet — schéma Supabase
-- À exécuter dans Supabase : SQL Editor > New query > coller > Run
-- Ce script est ré-exécutable (il supprime puis recrée les tables).
-- ============================================================

create extension if not exists "pgcrypto";

-- ---------- Nettoyage (pour pouvoir relancer le script) ----------
drop table if exists module_progress cascade;
drop table if exists quiz_attempts cascade;
drop table if exists annales cascade;
drop table if exists quiz_questions cascade;
drop table if exists examples cascade;
drop table if exists cours_sections cascade;
drop table if exists lecons cascade;
drop table if exists modules cascade;
drop table if exists subjects cascade;

-- ---------- TABLES DE CONTENU (lecture publique) ----------

create table subjects (
  id text primary key,
  name text not null,
  icon text,
  position int not null default 0
);

create table modules (
  id text primary key,
  subject_id text not null references subjects(id) on delete cascade,
  title text not null,
  tag text,
  timed boolean not null default false,
  position int not null default 0
);

-- Cours complet façon manuel : un ou plusieurs "chapitres" par module
create table lecons (
  id uuid primary key default gen_random_uuid(),
  module_id text not null references modules(id) on delete cascade,
  title text not null,
  body text not null,
  position int not null default 0
);

-- Synthèse : les points clés en couleur (définition / méthode / piège / à retenir)
create table cours_sections (
  id uuid primary key default gen_random_uuid(),
  module_id text not null references modules(id) on delete cascade,
  type text not null check (type in ('def','method','piege','retenir')),
  content text not null,
  position int not null default 0
);

create table examples (
  id uuid primary key default gen_random_uuid(),
  module_id text not null references modules(id) on delete cascade,
  title text not null,
  body text not null,
  position int not null default 0
);

create table quiz_questions (
  id uuid primary key default gen_random_uuid(),
  module_id text not null references modules(id) on delete cascade,
  question text not null,
  options jsonb not null,
  correct_index int not null,
  explanation text,
  position int not null default 0
);

create table annales (
  id uuid primary key default gen_random_uuid(),
  subject_id text not null references subjects(id) on delete cascade,
  year int,
  title text not null,
  description text,
  pdf_url text,
  position int not null default 0
);

-- ---------- PROGRESSION (privée, propre à chaque session anonyme) ----------

create table quiz_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  module_id text not null references modules(id) on delete cascade,
  score int not null,
  total int not null,
  created_at timestamptz not null default now()
);

create table module_progress (
  user_id uuid not null references auth.users(id) on delete cascade,
  module_id text not null references modules(id) on delete cascade,
  cours_read boolean not null default false,
  best_score int,
  attempts int not null default 0,
  updated_at timestamptz not null default now(),
  primary key (user_id, module_id)
);

-- ---------- SÉCURITÉ (RLS) ----------

alter table subjects enable row level security;
alter table modules enable row level security;
alter table lecons enable row level security;
alter table cours_sections enable row level security;
alter table examples enable row level security;
alter table quiz_questions enable row level security;
alter table annales enable row level security;
alter table quiz_attempts enable row level security;
alter table module_progress enable row level security;

create policy "Lecture publique subjects" on subjects for select using (true);
create policy "Lecture publique modules" on modules for select using (true);
create policy "Lecture publique lecons" on lecons for select using (true);
create policy "Lecture publique cours_sections" on cours_sections for select using (true);
create policy "Lecture publique examples" on examples for select using (true);
create policy "Lecture publique quiz_questions" on quiz_questions for select using (true);
create policy "Lecture publique annales" on annales for select using (true);

create policy "Voir sa progression (attempts)" on quiz_attempts
  for select using (auth.uid() = user_id);
create policy "Ecrire sa progression (attempts)" on quiz_attempts
  for insert with check (auth.uid() = user_id);

create policy "Voir sa progression (module_progress)" on module_progress
  for select using (auth.uid() = user_id);
create policy "Ecrire sa progression (module_progress insert)" on module_progress
  for insert with check (auth.uid() = user_id);
create policy "Ecrire sa progression (module_progress update)" on module_progress
  for update using (auth.uid() = user_id);

-- ============================================================
-- DONNÉES : les 4 matières + le module Maths complet
-- ============================================================

insert into subjects (id, name, icon, position) values
  ('maths', 'Mathématiques', '📐', 1),
  ('francais', 'Français', '✍️', 2),
  ('histoire-geo-emc', 'Histoire-Géo-EMC', '🌍', 3),
  ('sciences', 'Sciences', '🔬', 4);

insert into modules (id, subject_id, title, tag, timed, position) values
  ('automatismes', 'maths', 'Automatismes', 'Nouveauté 2026 · épreuve de 20 min, sans calculatrice, notée sur 6 points', true, 1),
  ('nombres', 'maths', 'Nombres et calculs', $$Relatifs · fractions · puissances · calcul littéral$$, false, 2),
  ('geometrie', 'maths', 'Géométrie', $$Pythagore · Thalès · trigonométrie · volumes$$, false, 3),
  ('fonctions', 'maths', 'Fonctions et proportionnalité', $$Fonctions linéaires/affines · pourcentages · vitesse$$, false, 4),
  ('stats', 'maths', 'Statistiques et probabilités', $$Moyenne · médiane · étendue · probabilités$$, false, 5),
  ('algo', 'maths', 'Algorithmique et programmation', $$Variables · boucles · conditions$$, false, 6);

-- ============================================================
-- COURS COMPLETS (onglet "Cours")
-- ============================================================

-- ----- Automatismes -----
insert into lecons (module_id, title, body, position) values
('automatismes', $$Les priorités opératoires$$, $$Quand une expression contient plusieurs opérations, il existe un ordre obligatoire pour les effectuer : on ne calcule jamais « de gauche à droite » sans réfléchir.

L'ordre à respecter est le suivant :

- Ce qui est entre parenthèses, en premier
- Les puissances
- Les multiplications et les divisions, dans l'ordre où elles apparaissent
- Les additions et les soustractions, dans l'ordre où elles apparaissent

Par exemple, dans 7 × 8 − 15 ÷ 3, on commence par les deux opérations prioritaires : 7×8 = 56 et 15÷3 = 5. Il ne reste plus que 56 − 5 = 51.

**Astuce pour l'épreuve d'automatismes** : entraîne-toi à repérer en un coup d'œil quelle opération est prioritaire avant même de commencer à calculer. C'est ce réflexe qui fait gagner du temps le jour de l'épreuve.$$, 1),
('automatismes', $$Nombres relatifs : addition et soustraction$$, $$Un nombre relatif est un nombre précédé d'un signe + ou −. Pour additionner ou soustraire des relatifs sans erreur, deux règles suffisent.

- Additionner deux nombres de même signe : on additionne leurs distances à zéro et on garde le signe commun. Exemple : (−4) + (−7) = −11.
- Additionner deux nombres de signes différents : on soustrait la plus petite distance à zéro de la plus grande, et on garde le signe du nombre qui a la plus grande distance à zéro. Exemple : (−9) + 3 = −6.

Soustraire un nombre relatif revient toujours à additionner son opposé : a − b = a + (−b). C'est pour cela que (−7) + 3 − (−2) se transforme en (−7) + 3 + 2 = −2.

Multiplier ou diviser deux relatifs suit la règle des signes : deux signes identiques donnent un résultat positif, deux signes différents donnent un résultat négatif.$$, 2),
('automatismes', $$Conversions d'unités$$, $$Convertir une unité, c'est l'exprimer dans une autre unité de la même grandeur (longueur, masse, durée, contenance...) sans changer la quantité réelle.

Pour les longueurs, masses et contenances, chaque unité vaut 10 fois la suivante : km, hm, dam, m, dm, cm, mm. Passer à l'unité immédiatement inférieure revient à multiplier par 10 ; passer à l'unité immédiatement supérieure revient à diviser par 10.

Pour les durées, la base n'est pas 10 mais 60 (minutes, secondes) ou 24 (heures) : 1 h = 60 min, 1 min = 60 s.

**Repères à connaître par cœur** : 1 km = 1000 m, 1 L = 1000 mL, 1 kg = 1000 g, 1 h = 60 min.$$, 3),
('automatismes', $$Ordres de grandeur et pourcentages usuels$$, $$Donner un ordre de grandeur, c'est remplacer un calcul compliqué par un calcul simple et approché, pour vérifier rapidement qu'un résultat est plausible. La méthode consiste à arrondir chaque nombre à son chiffre le plus significatif avant de calculer.

Exemple : pour estimer 198 × 51, on arrondit à 200 × 50 = 10 000. Le résultat exact (10 098) est bien proche de cette estimation.

Certains pourcentages reviennent très souvent et doivent être automatiques :

- 50 % d'une quantité = la diviser par 2
- 25 % = la diviser par 4
- 10 % = la diviser par 10
- 75 % = la diviser par 4 puis multiplier par 3

Cette rapidité de calcul est exactement ce qui est testé le jour de l'épreuve d'automatismes.$$, 4);

-- ----- Nombres et calculs -----
insert into lecons (module_id, title, body, position) values
('nombres', $$Les nombres relatifs$$, $$Un nombre relatif est constitué d'un signe (+ ou −) et d'une distance à zéro. Les nombres positifs et 0 forment les nombres positifs ; les nombres négatifs sont plus petits que zéro.

Sur une droite graduée, plus un nombre est situé à droite, plus il est grand — même s'il est négatif : −2 est plus grand que −5, car −2 est plus proche de zéro.

Les règles de calcul sur les relatifs s'appuient toujours sur deux questions : quel est le signe du résultat, et quelle est sa distance à zéro ?$$, 1),
('nombres', $$Les fractions$$, $$Une fraction a/b représente une division qui n'a pas forcément été effectuée : a est le numérateur, b le dénominateur (jamais nul).

Pour additionner ou soustraire deux fractions, elles doivent avoir le même dénominateur. Si ce n'est pas le cas, on les met au même dénominateur en multipliant numérateur et dénominateur par le même nombre.

Pour multiplier deux fractions, on multiplie les numérateurs entre eux et les dénominateurs entre eux. Pour diviser par une fraction, on multiplie par son inverse.

Simplifier une fraction consiste à diviser le numérateur et le dénominateur par un même nombre (idéalement leur PGCD) jusqu'à ce que ce ne soit plus possible.$$, 2),
('nombres', $$Les puissances$$, $$Une puissance a^n désigne le nombre a multiplié par lui-même n fois. Le nombre a est appelé la base, n est l'exposant.

Trois règles permettent de manipuler les puissances sans tout redévelopper :

- a^m × a^n = a^(m+n) : on additionne les exposants
- a^m ÷ a^n = a^(m−n) : on soustrait les exposants
- (a^m)^n = a^(m×n) : on multiplie les exposants

Attention à ne pas confondre a^(-n), qui vaut 1/a^n, avec −a^n, qui est négatif.$$, 3),
('nombres', $$Calcul littéral : développer et factoriser$$, $$Une expression littérale contient une ou plusieurs lettres, appelées variables, qui représentent des nombres inconnus ou variables.

Développer une expression, c'est supprimer les parenthèses en utilisant la distributivité : k × (a + b) = k×a + k×b. Quand il y a deux parenthèses, chaque terme de la première se multiplie par chaque terme de la seconde.

Factoriser, c'est l'opération inverse : transformer une somme en produit, en repérant un facteur commun à tous les termes.

Trois identités remarquables sont à connaître par cœur :

- (a+b)² = a² + 2ab + b²
- (a−b)² = a² − 2ab + b²
- (a+b)(a−b) = a² − b²

Elles permettent de développer ou de factoriser très rapidement certaines expressions.$$, 4);

-- ----- Géométrie -----
insert into lecons (module_id, title, body, position) values
('geometrie', $$Le théorème de Pythagore$$, $$Le théorème de Pythagore ne s'applique que dans un triangle rectangle : c'est une condition indispensable, qu'il faut toujours vérifier ou justifier avant de l'utiliser.

Si un triangle ABC est rectangle en A, alors le carré de l'hypoténuse (le côté opposé à l'angle droit, toujours le plus long) est égal à la somme des carrés des deux autres côtés : BC² = AB² + AC².

Ce théorème sert dans deux sens : calculer l'hypoténuse à partir des deux autres côtés (on additionne les carrés puis on prend la racine carrée), ou calculer un côté de l'angle droit connaissant l'hypoténuse et l'autre côté (on soustrait les carrés).

Il existe aussi une réciproque : si dans un triangle, le carré du plus grand côté est égal à la somme des carrés des deux autres, alors ce triangle est rectangle. Elle sert à démontrer qu'un triangle est rectangle, ce que le théorème direct ne permet pas de faire.$$, 1),
('geometrie', $$Le théorème de Thalès$$, $$Le théorème de Thalès s'utilise dans une configuration précise : deux droites sécantes en un point, coupées par deux droites parallèles. On la reconnaît souvent sous la forme d'un triangle « réduit » ou d'un « papillon ».

Si, dans un triangle ADE, un point B appartient à [AD] et un point C appartient à [AE], et si les droites (BC) et (DE) sont parallèles, alors les longueurs sont proportionnelles :
AB/AD = AC/AE = BC/DE.

Pour utiliser ce théorème : vérifier et justifier que les droites sont bien parallèles, écrire les rapports de longueurs correspondants, puis résoudre l'égalité de produits en croix pour trouver la longueur manquante.

Comme pour Pythagore, il existe une réciproque du théorème de Thalès, qui permet de démontrer que deux droites sont parallèles à partir de rapports de longueurs égaux.$$, 2),
('geometrie', $$La trigonométrie dans le triangle rectangle$$, $$La trigonométrie permet de calculer un côté ou un angle dans un triangle rectangle, lorsque le théorème de Pythagore ne suffit pas.

Dans un triangle rectangle, pour un angle aigu donné, on distingue trois côtés : l'hypoténuse (le plus long), le côté opposé à l'angle (en face) et le côté adjacent (à côté, qui n'est pas l'hypoténuse).

Trois formules, résumées par le mot **SOHCAHTOA**, relient l'angle à ces côtés :

- cos(angle) = adjacent / hypoténuse
- sin(angle) = opposé / hypoténuse
- tan(angle) = opposé / adjacent

Pour calculer une longueur, on isole la longueur cherchée dans la formule correspondante. Pour calculer un angle à partir de deux longueurs connues, on utilise les fonctions inverses (cos⁻¹, sin⁻¹, tan⁻¹) de la calculatrice.$$, 3),
('geometrie', $$Aires et volumes$$, $$Le volume d'un solide se calcule avec une formule qui dépend de sa forme. Les formules à connaître par cœur pour le brevet sont :

- Cube de côté c : V = c³
- Pavé droit de dimensions L, l, h : V = L × l × h
- Cylindre de rayon r et hauteur h : V = π × r² × h
- Pyramide ou cône, de base d'aire B et de hauteur h : V = (1/3) × B × h
- Sphère de rayon r : V = (4/3) × π × r³

Un piège fréquent : le volume s'exprime toujours en unités « au cube » (cm³, m³...), jamais en unités simples ou au carré. Il faut aussi veiller à ce que toutes les longueurs utilisées dans une même formule soient exprimées dans la même unité avant de calculer.$$, 4);

-- ----- Fonctions et proportionnalité -----
insert into lecons (module_id, title, body, position) values
('fonctions', $$Fonctions linéaires et fonctions affines$$, $$Une fonction associe à un nombre x un unique nombre, noté f(x) et appelé l'image de x par f.

Une fonction linéaire s'écrit sous la forme f(x) = ax, où a est un nombre fixe appelé coefficient de proportionnalité. Sa représentation graphique est toujours une droite qui passe par l'origine du repère.

Une fonction affine s'écrit sous la forme f(x) = ax + b. Sa représentation graphique est une droite qui ne passe pas forcément par l'origine. Le nombre a est le coefficient directeur de la droite (il indique la pente), et b est l'ordonnée à l'origine.

Une fonction linéaire est un cas particulier de fonction affine, où b = 0. Toute fonction linéaire vérifie donc f(0) = 0, ce qui permet de la reconnaître rapidement.$$, 1),
('fonctions', $$Proportionnalité et pourcentages$$, $$Une situation est dite proportionnelle lorsque les valeurs d'une grandeur s'obtiennent en multipliant toujours par le même nombre les valeurs d'une autre grandeur. Dans un tableau de proportionnalité, tous les quotients colonne par colonne sont égaux.

Les pourcentages sont une application directe de la proportionnalité. Calculer t % d'une quantité N revient à calculer (t/100) × N.

Pour une évolution, on utilise un coefficient multiplicateur :

- Augmenter de t % revient à multiplier par (1 + t/100)
- Diminuer de t % revient à multiplier par (1 − t/100)

Ce coefficient multiplicateur permet d'obtenir directement la valeur finale, sans calculer d'abord le montant de l'évolution.$$, 2),
('fonctions', $$Vitesse moyenne et grandeurs quotients$$, $$La vitesse moyenne est un exemple de grandeur quotient : elle se calcule en divisant une distance parcourue par la durée du trajet : vitesse = distance ÷ temps.

À partir de cette relation, on peut retrouver la distance (distance = vitesse × temps) ou la durée (temps = distance ÷ vitesse), à condition d'utiliser des unités cohérentes entre elles.

D'autres grandeurs quotients suivent la même logique : le débit (volume ÷ temps), la masse volumique (masse ÷ volume)... Repérer qu'une situation implique une division de deux grandeurs différentes est souvent la clé pour poser le bon calcul.$$, 3);

-- ----- Statistiques et probabilités -----
insert into lecons (module_id, title, body, position) values
('stats', $$Moyenne, médiane et étendue$$, $$La moyenne d'une série de valeurs s'obtient en additionnant toutes les valeurs puis en divisant par leur nombre (l'effectif total). C'est l'indicateur le plus utilisé, mais il peut être fortement influencé par une valeur extrême.

La médiane est la valeur qui partage une série, une fois rangée dans l'ordre croissant, en deux groupes de même effectif. Si l'effectif est impair, la médiane est la valeur centrale ; si l'effectif est pair, elle est la moyenne des deux valeurs centrales.

L'étendue d'une série mesure sa dispersion : étendue = max − min.

**Piège classique** : oublier de ranger les valeurs par ordre croissant avant de chercher la médiane conduit presque toujours à un résultat faux.$$, 1),
('stats', $$Les probabilités$$, $$Une expérience aléatoire est une expérience dont on ne peut pas prévoir le résultat à l'avance. Chaque résultat possible est appelé une issue, et un événement est un ensemble d'issues.

Dans une situation d'équiprobabilité, la probabilité d'un événement se calcule ainsi :
probabilité = nombre de cas favorables ÷ nombre de cas possibles.

Une probabilité est toujours comprise entre 0 et 1 (ou entre 0 % et 100 %) : 0 correspond à un événement impossible, 1 à un événement certain. La somme des probabilités de toutes les issues possibles vaut toujours 1.$$, 2);

-- ----- Algorithmique et programmation -----
insert into lecons (module_id, title, body, position) values
('algo', $$Variables et affectation$$, $$Une variable est un espace de mémoire, désigné par un nom, qui contient une valeur pouvant changer au cours de l'exécution d'un programme.

Donner une valeur à une variable s'appelle une affectation, souvent notée avec une flèche (variable ← valeur) pour bien la distinguer du signe = qui, lui, sert à tester une égalité entre deux valeurs. Ces deux usages sont différents et ne doivent pas être confondus.$$, 1),
('algo', $$Les boucles$$, $$Une boucle permet de répéter une série d'instructions sans avoir à les recopier plusieurs fois.

La boucle « Pour i de 1 à n » est utilisée quand le nombre de répétitions est connu à l'avance : elle s'exécute exactement n fois.

La boucle « Tant que condition » se répète tant qu'une condition reste vraie, sans que le nombre de répétitions soit forcément connu au départ. Il est indispensable qu'une instruction à l'intérieur de la boucle finisse par rendre la condition fausse, sinon la boucle ne s'arrête jamais : on parle de boucle infinie.$$, 2),
('algo', $$Les conditions$$, $$Une structure conditionnelle permet d'exécuter des instructions différentes selon qu'une condition est vraie ou fausse. Elle s'écrit « Si condition Alors ... Sinon ... ».

Pour dérouler un algorithme contenant des conditions ou des boucles, la méthode consiste à suivre les instructions une par une, en notant à chaque étape la valeur de chaque variable, comme si on exécutait le programme à la main.$$, 3);

-- ============================================================
-- SYNTHÈSE EN COULEUR (onglet "Synthèse")
-- Une Méthode par notion citée dans le tag du module
-- ============================================================

-- ----- Automatismes -----
insert into cours_sections (module_id, type, content, position) values
('automatismes', 'def', $$Les automatismes sont des exercices courts qui testent la rapidité et la maîtrise des bases : calcul mental, conversions d'unités, ordres de grandeur, priorités opératoires. C'est une épreuve à part depuis 2026, réalisée sans calculatrice.$$, 1),
('automatismes', 'method', $$Priorités opératoires : parenthèses d'abord, puis puissances, puis multiplications/divisions (de gauche à droite), puis additions/soustractions (de gauche à droite).$$, 2),
('automatismes', 'method', $$Pour estimer un ordre de grandeur, on arrondit chaque nombre à son chiffre le plus significatif avant de calculer. Ex : 397 × 6 ≈ 400 × 6 = 2400.$$, 3),
('automatismes', 'piege', $$Ne pas confondre (-3)² = 9 et -3² = -9 : dans le second cas, seul le 3 est élevé au carré.$$, 4),
('automatismes', 'retenir', $$Conversions courantes : 1 km = 1000 m · 1 L = 1000 mL · 1 h = 60 min · 1 min = 60 s. Et : 50% = ÷2, 25% = ÷4, 10% = ÷10.$$, 5);

-- ----- Nombres et calculs -----
insert into cours_sections (module_id, type, content, position) values
('nombres', 'def', $$Un nombre relatif est positif ou négatif. Une puissance a^n signifie a multiplié par lui-même n fois. Une expression littérale contient des lettres représentant des nombres inconnus.$$, 1),
('nombres', 'method', $$Relatifs : même signe → on additionne les distances à zéro et on garde le signe. Signes différents → on soustrait la plus petite distance de la plus grande et on garde le signe du plus grand.$$, 2),
('nombres', 'method', $$Fractions : pour additionner/soustraire, il faut le même dénominateur. Pour multiplier, on multiplie numérateurs entre eux et dénominateurs entre eux. Pour diviser, on multiplie par l'inverse.$$, 3),
('nombres', 'method', $$Développer, c'est distribuer : k(a+b) = ka + kb. Factoriser, c'est l'inverse. Identités remarquables : (a+b)² = a²+2ab+b² · (a−b)² = a²−2ab+b² · (a+b)(a−b) = a²−b².$$, 4),
('nombres', 'method', $$Règles des puissances : a^m × a^n = a^(m+n) · a^m ÷ a^n = a^(m−n) · (a^m)^n = a^(m×n).$$, 5),
('nombres', 'piege', $$Attention au signe quand on distribue un moins : −(x−5) = −x+5, pas −x−5.$$, 6),
('nombres', 'retenir', $$Pour simplifier une fraction, on divise numérateur et dénominateur par leur PGCD.$$, 7);

-- ----- Géométrie -----
insert into cours_sections (module_id, type, content, position) values
('geometrie', 'def', $$Le théorème de Pythagore relie les 3 côtés d'un triangle rectangle. Le théorème de Thalès relie les longueurs dans une configuration de droites parallèles. La trigonométrie relie angles et côtés dans un triangle rectangle.$$, 1),
('geometrie', 'method', $$Pythagore : si ABC est rectangle en A, alors BC² = AB² + AC² (BC est l'hypoténuse, le côté le plus long, opposé à l'angle droit).$$, 2),
('geometrie', 'method', $$Thalès : si (BC) // (DE) dans le triangle ADE avec B sur [AD] et C sur [AE], alors AB/AD = AC/AE = BC/DE. On vérifie le parallélisme, on écrit les rapports, puis on résout par produit en croix.$$, 3),
('geometrie', 'method', $$Trigonométrie (SOHCAHTOA) : cos = adjacent/hypoténuse · sin = opposé/hypoténuse · tan = opposé/adjacent.$$, 4),
('geometrie', 'piege', $$Le théorème de Pythagore ne s'applique QUE si le triangle est rectangle — vérifier ou justifier l'angle droit avant de l'utiliser.$$, 5),
('geometrie', 'retenir', $$Volumes : cube = c³ · pavé = L×l×h · cylindre = π×r²×h · pyramide/cône = (1/3)×base×h · sphère = (4/3)×π×r³.$$, 6);

-- ----- Fonctions et proportionnalité -----
insert into cours_sections (module_id, type, content, position) values
('fonctions', 'def', $$Une fonction linéaire s'écrit y = ax. Une fonction affine s'écrit y = ax + b. Un tableau est proportionnel si tous les quotients colonne/ligne sont égaux.$$, 1),
('fonctions', 'method', $$Pour calculer une image f(x), on remplace x par sa valeur. Pour lire un graphique, l'abscisse donne x et l'ordonnée donne f(x).$$, 2),
('fonctions', 'method', $$Augmenter de t% revient à multiplier par (1 + t/100). Diminuer de t% revient à multiplier par (1 − t/100).$$, 3),
('fonctions', 'method', $$Vitesse moyenne = distance ÷ temps. On en déduit distance = vitesse × temps, et temps = distance ÷ vitesse (unités cohérentes obligatoires).$$, 4),
('fonctions', 'piege', $$Une fonction linéaire est un cas particulier de fonction affine (avec b=0) : toute fonction linéaire vérifie f(0)=0, mais pas l'inverse.$$, 5),
('fonctions', 'retenir', $$Dans y = ax + b : a est le coefficient directeur (la pente), b est l'ordonnée à l'origine.$$, 6);

-- ----- Statistiques et probabilités -----
insert into cours_sections (module_id, type, content, position) values
('stats', 'def', $$La moyenne est la somme des valeurs divisée par leur nombre. La médiane est la valeur qui partage la série rangée en deux parties égales. Une probabilité mesure la chance qu'un événement se réalise.$$, 1),
('stats', 'method', $$Moyenne = somme de toutes les valeurs ÷ effectif total.$$, 2),
('stats', 'method', $$Pour trouver la médiane, on range d'abord les valeurs dans l'ordre croissant, puis on prend la valeur du milieu (ou la moyenne des deux valeurs du milieu si effectif pair).$$, 3),
('stats', 'method', $$Probabilité = nombre de cas favorables ÷ nombre de cas possibles (dans une situation d'équiprobabilité).$$, 4),
('stats', 'piege', $$Ne pas oublier de ranger les valeurs avant de chercher la médiane — c'est l'erreur la plus fréquente.$$, 5),
('stats', 'retenir', $$Une probabilité est toujours comprise entre 0 (impossible) et 1 (certain). Étendue = valeur max − valeur min.$$, 6);

-- ----- Algorithmique et programmation -----
insert into cours_sections (module_id, type, content, position) values
('algo', 'def', $$Une variable stocke une valeur qui peut changer au cours du programme. Une boucle répète des instructions. Une condition (Si...Alors...Sinon) exécute des instructions différentes selon un test.$$, 1),
('algo', 'method', $$Boucle "Pour i de 1 à n" : le nombre de répétitions est connu à l'avance. Boucle "Tant que condition" : elle se répète tant que la condition reste vraie.$$, 2),
('algo', 'method', $$Une condition "Si...Alors...Sinon" exécute la branche Alors si le test est vrai, sinon elle exécute la branche Sinon.$$, 3),
('algo', 'method', $$Pour dérouler un algorithme à la main, on note l'état de chaque variable après chaque instruction, ligne par ligne.$$, 4),
('algo', 'piege', $$Une boucle "Tant que" sans mise à jour de la condition d'arrêt tourne indéfiniment (boucle infinie).$$, 5),
('algo', 'retenir', $$L'affectation (variable ← valeur) donne une valeur à une variable ; le test d'égalité (=) compare deux valeurs. Ce ne sont pas la même chose.$$, 6);

-- ============================================================
-- EXEMPLES (onglet "Exemples")
-- ============================================================

insert into examples (module_id, title, body, position) values
('automatismes', $$Priorités opératoires$$, $$Calculer : 7 × 8 − 15 ÷ 3
= 56 − 5
= 51$$, 1),
('automatismes', $$Conversion$$, $$Convertir 3,5 km en mètres
3,5 × 1000 = 3500 m$$, 2),
('automatismes', $$Ordre de grandeur$$, $$Estimer 198 × 51
≈ 200 × 50 = 10 000$$, 3),
('nombres', $$Développer$$, $$(2x+3)(x−5)
= 2x² −10x + 3x −15
= 2x² −7x −15$$, 1),
('nombres', $$Factoriser (identité remarquable)$$, $$9x² − 25
= (3x)² − 5²
= (3x−5)(3x+5)$$, 2),
('nombres', $$Puissance d'un relatif$$, $$(−2)³ × 5
= −8 × 5
= −40$$, 3),
('geometrie', $$Pythagore$$, $$Triangle rectangle, côtés 3 cm et 4 cm
hypoténuse² = 3² + 4² = 9+16 = 25
hypoténuse = √25 = 5 cm$$, 1),
('geometrie', $$Thalès$$, $$Si (BC) // (DE) dans un triangle ADE avec B sur [AD] et C sur [AE] :
AB/AD = AC/AE = BC/DE$$, 2),
('geometrie', $$Volume d'un cylindre$$, $$rayon 3 cm, hauteur 5 cm, π≈3,14
V = π × r² × h = 3,14 × 9 × 5 ≈ 141,3 cm³$$, 3),
('fonctions', $$Image d'une fonction$$, $$f(x) = 3x − 2
f(4) = 3×4 − 2 = 12−2 = 10$$, 1),
('fonctions', $$Pourcentage d'augmentation$$, $$Prix de 80 € + 25%
80 × 1,25 = 100 €$$, 2),
('fonctions', $$Vitesse moyenne$$, $$150 km parcourus en 2 h
vitesse = 150 ÷ 2 = 75 km/h$$, 3),
('stats', $$Moyenne et médiane$$, $$Notes : 10, 12, 14, 16, 18
Moyenne = (10+12+14+16+18)/5 = 70/5 = 14
Médiane = 14 (valeur du milieu)$$, 1),
('stats', $$Probabilité simple$$, $$Dé à 6 faces, P(obtenir un 6)
= 1 cas favorable ÷ 6 cas possibles = 1/6$$, 2),
('stats', $$Probabilité dans une urne$$, $$3 boules rouges, 2 boules bleues
P(tirer rouge) = 3/5$$, 3),
('algo', $$Boucle Pour$$, $$Pour i de 1 à 5 :
   afficher i
affiche : 1, 2, 3, 4, 5$$, 1),
('algo', $$Somme avec une variable$$, $$total ← 0
Pour chaque nombre de la liste [3,7,2] :
   total ← total + nombre
total final = 12$$, 2),
('algo', $$Condition$$, $$Si note ≥ 10 Alors
   afficher "admis"
Sinon
   afficher "recalé"$$, 3);

-- ============================================================
-- QUIZ (onglet "Quiz")
-- ============================================================

insert into quiz_questions (module_id, question, options, correct_index, explanation, position) values
('automatismes', $$12 × 5 − 20 = ?$$, '["30","40","60","80"]', 1, $$12×5=60, puis 60−20=40.$$, 1),
('automatismes', $$Convertir 2,5 L en mL$$, '["25 mL","250 mL","2500 mL","25000 mL"]', 2, $$1 L = 1000 mL, donc 2,5 × 1000 = 2500 mL.$$, 2),
('automatismes', $$(−3) + (−7) = ?$$, '["−10","10","−4","4"]', 0, $$Deux nombres négatifs s'additionnent : −3−7 = −10.$$, 3),
('automatismes', $$Ordre de grandeur de 397 × 6 ?$$, '["240","2400","24000","400"]', 1, $$397 ≈ 400, donc 400 × 6 = 2400.$$, 4),
('automatismes', $$3/4 en pourcentage ?$$, '["34%","75%","43%","340%"]', 1, $$3 ÷ 4 = 0,75 = 75%.$$, 5),
('automatismes', $$5² + 3 × 2 = ?$$, '["34","28","31","19"]', 2, $$5²=25, 3×2=6, priorité aux puissances/multiplications : 25+6=31.$$, 6),
('automatismes', $$Convertir 1 h 30 min en minutes$$, '["130 min","90 min","150 min","60 min"]', 1, $$1h = 60 min, donc 60+30 = 90 min.$$, 7),
('automatismes', $$−8 × (−2) = ?$$, '["−16","16","−10","10"]', 1, $$Négatif × négatif = positif : 8×2=16.$$, 8),
('nombres', $$(−5)² = ?$$, '["25","−25","10","−10"]', 0, $$(−5)×(−5) = 25 (négatif × négatif = positif).$$, 1),
('nombres', $$Développer (x+4)²$$, '["x²+16","x²+8x+16","x²+4x+16","2x+8"]', 1, $$Identité remarquable : a²+2ab+b² avec a=x, b=4 → x²+8x+16.$$, 2),
('nombres', $$Simplifier 3/9$$, '["1/3","3/9","1/2","2/3"]', 0, $$3 et 9 se divisent par 3 : 3/9 = 1/3.$$, 3),
('nombres', $$2³ × 2² = ?$$, '["2⁵ = 32","2⁶ = 64","4⁵","16"]', 0, $$On additionne les exposants : 3+2=5, donc 2⁵=32.$$, 4),
('nombres', $$Factoriser 4x+12$$, '["4(x+3)","4(x+8)","x(4+12)","4x+12"]', 0, $$4 est le facteur commun de 4x et 12 : 4x+12 = 4(x+3).$$, 5),
('nombres', $$(−7)+3−(−2) = ?$$, '["−12","−2","2","−6"]', 1, $$−7+3+2 = −2 (soustraire un négatif revient à ajouter).$$, 6),
('nombres', $$3/4 + 1/4 = ?$$, '["1","4/8","3/16","1/2"]', 0, $$Même dénominateur : (3+1)/4 = 4/4 = 1.$$, 7),
('geometrie', $$Le théorème de Pythagore relie...$$, '["les 3 côtés d''un triangle rectangle","les 2 angles aigus","seulement l''hypoténuse","les médianes"]', 0, $$Il relie les longueurs des 3 côtés via BC²=AB²+AC².$$, 1),
('geometrie', $$Hypoténuse d'un triangle rectangle de côtés 6 et 8 ?$$, '["10","14","48","7"]', 0, $$√(6²+8²) = √(36+64) = √100 = 10.$$, 2),
('geometrie', $$Le théorème de Thalès s'applique quand...$$, '["les droites sont parallèles","les droites sont perpendiculaires","le triangle est isocèle","toujours"]', 0, $$Il faut une configuration de droites parallèles.$$, 3),
('geometrie', $$cos(angle) = ?$$, '["adjacent/hypoténuse","opposé/hypoténuse","opposé/adjacent","hypoténuse/adjacent"]', 0, $$SOHCAHTOA : CAH → cos = adjacent/hypoténuse.$$, 4),
('geometrie', $$Volume d'un cube de côté 4 cm ?$$, '["16 cm³","64 cm³","12 cm³","48 cm³"]', 1, $$V = c³ = 4³ = 64 cm³.$$, 5),
('geometrie', $$Somme des angles d'un triangle ?$$, '["180°","360°","90°","270°"]', 0, $$C'est une propriété fondamentale du triangle.$$, 6),
('geometrie', $$Volume d'un cylindre rayon 3, hauteur 5 (π≈3,14) ?$$, '["141,3","47,1","94,2","15"]', 0, $$π×r²×h = 3,14×9×5 = 141,3.$$, 7),
('fonctions', $$f(x) = 2x+1, f(3) = ?$$, '["6","7","5","9"]', 1, $$2×3+1 = 7.$$, 1),
('fonctions', $$Une fonction linéaire vérifie toujours...$$, '["f(0)=0","f(0)=1","f(1)=0","b≠0"]', 0, $$y=ax donne f(0)=a×0=0.$$, 2),
('fonctions', $$Augmenter de 20% revient à multiplier par...$$, '["1,2","0,8","2,0","1,02"]', 0, $$1 + 20/100 = 1,2.$$, 3),
('fonctions', $$Vitesse moyenne = ?$$, '["distance ÷ temps","temps ÷ distance","distance × temps","distance + temps"]', 0, $$C'est la définition de la vitesse moyenne.$$, 4),
('fonctions', $$Dans y = ax+b, b représente...$$, '["l''ordonnée à l''origine","le coefficient directeur","l''abscisse","rien de précis"]', 0, $$b est la valeur de y quand x=0.$$, 5),
('fonctions', $$Un tableau est proportionnel si...$$, '["les quotients sont égaux","les produits sont égaux","les sommes sont égales","jamais"]', 0, $$Tous les rapports colonne/ligne doivent être identiques.$$, 6),
('fonctions', $$Remise de 15% sur 200 € → prix final ?$$, '["170 €","185 €","150 €","230 €"]', 0, $$200 × (1−0,15) = 200×0,85 = 170 €.$$, 7),
('stats', $$La médiane d'une série est...$$, '["la valeur du milieu une fois la série rangée","la moyenne","la valeur la plus fréquente","l''étendue"]', 0, $$On range puis on prend la valeur centrale.$$, 1),
('stats', $$Dé à 6 faces, P(nombre pair) = ?$$, '["1/2","1/3","1/6","2/3"]', 0, $$3 issues favorables (2,4,6) sur 6 : 3/6 = 1/2.$$, 2),
('stats', $$Moyenne de 8, 10, 12 = ?$$, '["10","9","11","30"]', 0, $$(8+10+12)/3 = 30/3 = 10.$$, 3),
('stats', $$Une probabilité est toujours comprise entre...$$, '["0 et 1","−1 et 1","0 et 100","1 et 10"]', 0, $$0 = impossible, 1 = certain.$$, 4),
('stats', $$L'étendue d'une série = ?$$, '["max − min","max + min","la moyenne","la médiane"]', 0, $$C'est l'écart entre la plus grande et la plus petite valeur.$$, 5),
('stats', $$Urne de 4 boules dont 1 rouge, P(rouge) = ?$$, '["1/4","4","1","1/3"]', 0, $$1 cas favorable sur 4 cas possibles.$$, 6),
('algo', $$Une boucle "Pour i de 1 à 3" s'exécute combien de fois ?$$, '["3","1","2","4"]', 0, $$De 1 à 3 inclus : 3 répétitions.$$, 1),
('algo', $$Une variable sert à...$$, '["stocker une valeur","afficher un dessin","dessiner un triangle","rien"]', 0, $$C'est un espace mémoire nommé qui contient une valeur.$$, 2),
('algo', $$Si a>10 Alors b←1 Sinon b←0 ; avec a=5, b = ?$$, '["0","1","5","10"]', 0, $$5 n'est pas supérieur à 10, donc on exécute le Sinon : b←0.$$, 3),
('algo', $$Une boucle sans condition d'arrêt correcte risque d'être...$$, '["infinie","rapide","fausse","inutile"]', 0, $$Sans mise à jour de la condition, elle ne s'arrête jamais.$$, 4),
('algo', $$"Tant que" répète tant que...$$, '["une condition est vraie","une condition est fausse","jamais","toujours"]', 0, $$C'est la définition de cette structure de boucle.$$, 5),
('algo', $$Pour additionner tous les éléments d'une liste on utilise généralement...$$, '["une boucle avec une variable total","une seule addition","une condition seule","rien"]', 0, $$On initialise total à 0 puis on l'incrémente à chaque tour de boucle.$$, 6);
