"use client";

import { useEffect, useState } from "react";
import { CoursSection, Example, Lecon, Module, QuizQuestion } from "@/lib/types";
import { ensureAnonymousSession } from "@/lib/supabaseClient";
import { markCoursRead } from "@/lib/queries";
import QuizView from "./QuizView";
import CoursComplet from "./CoursComplet";

const LABELS: Record<string, string> = {
  def: "Définition",
  method: "Méthode",
  piege: "Piège fréquent",
  retenir: "À retenir",
};

export default function ModuleContent({
  module,
  lecons,
  synthese,
  examples,
  quiz,
}: {
  module: Module;
  lecons: Lecon[];
  synthese: CoursSection[];
  examples: Example[];
  quiz: QuizQuestion[];
}) {
  const [tab, setTab] = useState<"cours" | "synthese" | "exemples" | "quiz">("cours");

  useEffect(() => {
    if (tab === "cours" || tab === "synthese") {
      (async () => {
        const session = await ensureAnonymousSession();
        if (session) await markCoursRead(session.user.id, module.id);
      })();
    }
  }, [tab, module.id]);

  return (
    <div className="main">
      <p className="eyebrow">Mathématiques</p>
      <h1 className="module-title">{module.title}</h1>
      <p className="module-tag">{module.tag}</p>

      <div className="tabs">
        <button className={`tab ${tab === "cours" ? "active" : ""}`} onClick={() => setTab("cours")}>
          Cours
        </button>
        <button className={`tab ${tab === "synthese" ? "active" : ""}`} onClick={() => setTab("synthese")}>
          Synthèse
        </button>
        <button className={`tab ${tab === "exemples" ? "active" : ""}`} onClick={() => setTab("exemples")}>
          Exemples
        </button>
        <button className={`tab ${tab === "quiz" ? "active" : ""}`} onClick={() => setTab("quiz")}>
          {module.timed ? "Quiz chronométré" : "Quiz"}
        </button>
      </div>

      {tab === "cours" && <CoursComplet lecons={lecons} moduleId={module.id} />}

      {tab === "synthese" &&
        synthese.map((c) => (
          <div key={c.id} className={`callout ${c.type}`}>
            <span className="label">{LABELS[c.type]}</span>
            {c.content}
          </div>
        ))}

      {tab === "exemples" &&
        examples.map((e) => (
          <div key={e.id} className="example-card">
            <div className="ex-title">{e.title}</div>
            <div className="ex-body">{e.body}</div>
          </div>
        ))}

      {tab === "quiz" && <QuizView moduleId={module.id} timed={module.timed} questions={quiz} />}
    </div>
  );
}
