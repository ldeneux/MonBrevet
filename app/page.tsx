"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { getSubjects } from "@/lib/queries";
import { Subject } from "@/lib/types";

export default function Home() {
  const [subjects, setSubjects] = useState<Subject[] | null>(null);

  useEffect(() => {
    getSubjects().then(setSubjects).catch(console.error);
  }, []);

  return (
    <div className="app">
      <div className="sidebar">
        <div>
          <p className="brand-title">Prépa Brevet</p>
          <p className="brand-sub">Programmes 2026</p>
        </div>
      </div>
      <div className="main">
        <p className="eyebrow">Bienvenue</p>
        <h1 className="module-title">Choisis une matière</h1>
        <p className="module-tag">Cours, exemples et quiz pour t'entraîner au brevet.</p>

        {!subjects && <p className="loading">Chargement…</p>}

        <div style={{ display: "flex", flexDirection: "column", gap: 10, marginTop: 20 }}>
          {subjects?.map((s) => (
            <Link key={s.id} href={`/matieres/${s.id}`} style={{ textDecoration: "none" }}>
              <div className="example-card" style={{ cursor: "pointer" }}>
                <div className="ex-title">
                  {s.icon} {s.name}
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </div>
  );
}
