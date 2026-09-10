import {
  IllustrationPythagore,
  IllustrationThales,
  IllustrationTrigo,
  IllustrationVolumes,
  IllustrationAtome,
  IllustrationMelanges,
  IllustrationEtatsMatiere,
  IllustrationPriorites,
  IllustrationConversions,
  IllustrationPuissances,
  IllustrationIdentitesRemarquables,
  IllustrationFonctionAffine,
  IllustrationPourcentages,
  IllustrationMoyenneMediane,
  IllustrationProbabilites,
  IllustrationBoucleCondition,
  IllustrationReactionChimique,
  IllustrationCircuits,
  IllustrationForces,
  IllustrationHeredite,
  IllustrationArcReflexe,
  IllustrationSelectionNaturelle,
  IllustrationPlaquesTectoniques,
  IllustrationObjetTechnique,
  IllustrationClientServeur,
  IllustrationCycleVie,
} from "@/components/illustrations";

// Clé : "module_id::titre exact de la leçon" (voir supabase/schema.sql et sciences.sql)
const MAP: Record<string, React.FC> = {
  "geometrie::Le théorème de Pythagore": IllustrationPythagore,
  "geometrie::Le théorème de Thalès": IllustrationThales,
  "geometrie::La trigonométrie dans le triangle rectangle": IllustrationTrigo,
  "geometrie::Aires et volumes": IllustrationVolumes,

  "pc-matiere::Atomes et molécules": IllustrationAtome,
  "pc-matiere::Corps purs et mélanges": IllustrationMelanges,
  "pc-matiere::Les états de la matière et leurs changements": IllustrationEtatsMatiere,

  "automatismes::Les priorités opératoires": IllustrationPriorites,
  "automatismes::Conversions d'unités": IllustrationConversions,

  "nombres::Les puissances": IllustrationPuissances,
  "nombres::Calcul littéral : développer et factoriser": IllustrationIdentitesRemarquables,

  "fonctions::Fonctions linéaires et fonctions affines": IllustrationFonctionAffine,
  "fonctions::Proportionnalité et pourcentages": IllustrationPourcentages,

  "stats::Moyenne, médiane et étendue": IllustrationMoyenneMediane,
  "stats::Les probabilités": IllustrationProbabilites,

  "algo::Les boucles": IllustrationBoucleCondition,

  "pc-transformations::Qu'est-ce qu'une transformation chimique ?": IllustrationReactionChimique,
  "pc-electricite::Circuits électriques : série et dérivation": IllustrationCircuits,
  "pc-mouvement-energie::Les forces et leurs effets": IllustrationForces,

  "svt-reproduction::Du gène au caractère : notions de génétique": IllustrationHeredite,
  "svt-nerveux-immunite::Le système nerveux et la commande du mouvement": IllustrationArcReflexe,
  "svt-evolution::Le mécanisme de la sélection naturelle": IllustrationSelectionNaturelle,
  "svt-risques-ressources::Séismes et volcans : comprendre les risques": IllustrationPlaquesTectoniques,

  "techno-objets::Analyser un objet technique": IllustrationObjetTechnique,
  "techno-info::Internet : du client au serveur": IllustrationClientServeur,
  "techno-cycle-vie::Le cycle de vie d'un objet technique": IllustrationCycleVie,
};

export function getIllustration(moduleId: string, title: string): React.FC | null {
  return MAP[`${moduleId}::${title}`] ?? null;
}
