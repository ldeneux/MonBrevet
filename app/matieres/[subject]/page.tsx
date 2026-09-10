"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import Sidebar from "@/components/Sidebar";
import { getModules, getSubjects } from "@/lib/queries";
import { Module, Subject } from "@/lib/types";

export default function SubjectPage({ params }: { params: { subject: string } }) {
  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [modules, setModules] = useState<Module[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    Promise.all([getSubjects(), getModules(params.subject)])
      .then(([s, m]) => {
        setSubjects(s);
        setModules(m);
      })
      .finally(() => setLoading(false));
  }, [params.subject]);

  const subject = subjects.find((s) => s.id === params.subject);

  return (
    <div className="app">
      <Sidebar subjects={subjects} activeSubjectId={params.subject} modules={modules} />
      <div className="main">
        <p className="eyebrow">{subject?.name}</p>
        <h1 className="module-title">Modules</h1>

        {loading && <p className="loading">Chargement…</p>}

        {!loading && modules.length === 0 && (
          <p style={{ color: "var(--ink-soft)" }}>
            Cette matière arrive bientôt.
          </p>
        )}

        <div style={{ display: "flex", flexDirection: "column", gap: 10, marginTop: 20 }}>
          {modules.map((m) => (
            <Link key={m.id} href={`/matieres/${params.subject}/${m.id}`} style={{ textDecoration: "none" }}>
              <div className="example-card" style={{ cursor: "pointer" }}>
                <div className="ex-title">{m.title}</div>
                <div className="ex-body">{m.tag}</div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
