"use client";

import { useEffect, useState } from "react";
import Sidebar from "@/components/Sidebar";
import ModuleContent from "@/components/ModuleContent";
import {
  getCoursSections,
  getExamples,
  getLecons,
  getModule,
  getModules,
  getQuizQuestions,
  getSubjects,
} from "@/lib/queries";
import { CoursSection, Example, Lecon, Module, QuizQuestion, Subject } from "@/lib/types";

export default function ModulePage({
  params,
}: {
  params: { subject: string; module: string };
}) {
  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [modules, setModules] = useState<Module[]>([]);
  const [current, setCurrent] = useState<Module | null>(null);
  const [lecons, setLecons] = useState<Lecon[]>([]);
  const [synthese, setSynthese] = useState<CoursSection[]>([]);
  const [examples, setExamples] = useState<Example[]>([]);
  const [quiz, setQuiz] = useState<QuizQuestion[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    Promise.all([
      getSubjects(),
      getModules(params.subject),
      getModule(params.module),
      getLecons(params.module),
      getCoursSections(params.module),
      getExamples(params.module),
      getQuizQuestions(params.module),
    ])
      .then(([s, m, cur, lec, c, ex, q]) => {
        setSubjects(s);
        setModules(m);
        setCurrent(cur);
        setLecons(lec);
        setSynthese(c);
        setExamples(ex);
        setQuiz(q);
      })
      .finally(() => setLoading(false));
  }, [params.subject, params.module]);

  return (
    <div className="app">
      <Sidebar
        subjects={subjects}
        activeSubjectId={params.subject}
        modules={modules}
        currentModuleId={params.module}
      />
      {loading || !current ? (
        <div className="main">
          <p className="loading">Chargement…</p>
        </div>
      ) : (
        <ModuleContent module={current} lecons={lecons} synthese={synthese} examples={examples} quiz={quiz} />
      )}
    </div>
  );
}
