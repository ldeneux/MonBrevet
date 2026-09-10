# Prépa Brevet — Maths (2026)

Appli de révision/entraînement pour le brevet des collèges.
Next.js (App Router) + Supabase. Module Maths complet (Automatismes,
Nombres et calculs, Géométrie, Fonctions et proportionnalité,
Statistiques et probabilités, Algorithmique). Les autres matières
(Français, Histoire-Géo-EMC, Sciences) sont déjà présentes dans le
menu, prêtes à recevoir leurs modules sur le même modèle.

Aucune authentification par email/mot de passe : chaque visiteur reçoit
automatiquement une session anonyme (Supabase Auth), ce qui permet de
sauvegarder sa progression (cours lus, meilleurs scores) sans compte à
créer, sans email, et sans tableau de bord parent — personne d'autre
que l'appareil utilisé n'a accès à cette progression.

## 1. Configurer Supabase

1. Dans ton projet Supabase → **SQL Editor** → New query.
2. Colle le contenu de `supabase/schema.sql` et clique **Run**.
   Cela crée toutes les tables, active la sécurité (RLS), et insère
   le contenu du module Maths.
3. Va dans **Authentication → Providers → Anonymous Sign-Ins** et
   active l'option (elle est désactivée par défaut). C'est ce qui
   permet à l'appli de créer une session sans email ni mot de passe.
4. Récupère tes clés dans **Project Settings → API** :
   - `Project URL`
   - `anon public` key

## 2. Configurer le projet en local

```bash
cp .env.local.example .env.local
```

Remplis `.env.local` avec les deux valeurs récupérées à l'étape 1.

```bash
npm install
npm run dev
```

L'appli tourne sur http://localhost:3000

## 3. Déployer sur Vercel

1. Pousse ce projet sur un dépôt GitHub.
2. Sur [vercel.com](https://vercel.com) → **Add New Project** → importe
   le dépôt.
3. Dans les paramètres du projet Vercel → **Environment Variables**,
   ajoute les deux mêmes variables que dans `.env.local` :
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
4. Déploie.

## 4. Ajouter les prochaines matières

Pour ajouter un module (Français, Histoire-Géo-EMC, Sciences...), il
suffit d'insérer des lignes dans les tables `modules`, `cours_sections`,
`examples` et `quiz_questions` — aucune modification de code n'est
nécessaire, l'interface est entièrement pilotée par les données. Un
exemple complet de ce format se trouve dans `supabase/schema.sql`
pour le module Maths.

Pour les sujets d'annales (examens complets), la table `annales` est
prête à recevoir un titre, une année et un lien vers un PDF stocké
dans **Supabase Storage**.

## Structure du projet

```
app/
  page.tsx                        page d'accueil (choix de la matière)
  matieres/[subject]/page.tsx     liste des modules d'une matière
  matieres/[subject]/[module]/    cours / exemples / quiz d'un module
  globals.css                     tokens de couleurs et typographie
components/
  Sidebar.tsx                     navigation matières/modules
  ModuleContent.tsx                onglets Cours / Exemples / Quiz
  QuizView.tsx                    logique du quiz (+ minuteur automatismes)
lib/
  supabaseClient.ts                client Supabase + session anonyme
  queries.ts                      lecture du contenu, écriture de la progression
  types.ts
supabase/
  schema.sql                      tables, sécurité (RLS), contenu Maths
```
