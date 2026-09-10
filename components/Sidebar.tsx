"use client";

import Link from "next/link";
import { Module, Subject } from "@/lib/types";

export default function Sidebar({
  subjects,
  activeSubjectId,
  modules,
  currentModuleId,
}: {
  subjects: Subject[];
  activeSubjectId: string;
  modules: Module[];
  currentModuleId?: string;
}) {
  return (
    <div className="sidebar">
      <div>
        <p className="brand-title">Prépa Brevet</p>
        <p className="brand-sub">Programmes 2026</p>
      </div>

      <div className="subject-list">
        {subjects.map((s) =>
          s.id === activeSubjectId ? (
            <button key={s.id} className="subject-btn active">
              {s.icon} {s.name}
            </button>
          ) : (
            <Link key={s.id} href={`/matieres/${s.id}`} style={{ textDecoration: "none" }}>
              <button className="subject-btn">
                <span>
                  {s.icon} {s.name}
                </span>
              </button>
            </Link>
          )
        )}
      </div>

      <div className="module-list">
        {modules.map((m) => (
          <Link key={m.id} href={`/matieres/${activeSubjectId}/${m.id}`} style={{ textDecoration: "none" }}>
            <button className={`module-btn ${m.id === currentModuleId ? "current" : ""}`}>
              {m.title}
            </button>
          </Link>
        ))}
        {modules.length === 0 && (
          <p style={{ color: "#C9D6E4", fontSize: "0.8rem", padding: "0 12px" }}>
            Modules à venir
          </p>
        )}
      </div>

      <div className="legend">
        <div className="legend-item">
          <span className="dot" style={{ background: "var(--def)" }}></span>
          Définition à connaître
        </div>
        <div className="legend-item">
          <span className="dot" style={{ background: "var(--method)" }}></span>
          Méthode / formule
        </div>
        <div className="legend-item">
          <span className="dot" style={{ background: "var(--piege)" }}></span>
          Piège fréquent
        </div>
        <div className="legend-item">
          <span className="dot" style={{ background: "var(--retenir)" }}></span>
          À retenir absolument
        </div>
      </div>
    </div>
  );
}
