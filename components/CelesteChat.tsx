"use client";

import { useEffect, useRef, useState } from "react";
import { usePathname } from "next/navigation";
import CelesteMascot from "./CelesteMascot";
import { getModule, getSubjects } from "@/lib/queries";

type ChatMessage = { role: "user" | "assistant"; content: string };

export default function CelesteChat() {
  const pathname = usePathname();
  const [open, setOpen] = useState(false);
  const [messages, setMessages] = useState<ChatMessage[]>([
    {
      role: "assistant",
      content: "Salut, je suis Céleste ! Une notion pas claire, une question sur le quiz ? Je suis là pour t'aider à réviser.",
    },
  ]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const [context, setContext] = useState<{ subjectName?: string; moduleTitle?: string }>({});
  const scrollRef = useRef<HTMLDivElement>(null);

  // Déduit le module courant depuis l'URL (/matieres/[subject]/[module]) pour
  // donner à Céleste le contexte de ce que l'élève est en train de consulter.
  useEffect(() => {
    const parts = pathname.split("/").filter(Boolean);
    if (parts[0] === "matieres" && parts[1] && parts[2]) {
      Promise.all([getModule(parts[2]), getSubjects()])
        .then(([mod, subjects]) => {
          const subject = subjects.find((s) => s.id === parts[1]);
          setContext({ subjectName: subject?.name, moduleTitle: mod?.title });
        })
        .catch(() => setContext({}));
    } else {
      setContext({});
    }
  }, [pathname]);

  useEffect(() => {
    scrollRef.current?.scrollTo({ top: scrollRef.current.scrollHeight, behavior: "smooth" });
  }, [messages, loading]);

  async function send() {
    const text = input.trim();
    if (!text || loading) return;
    const nextMessages: ChatMessage[] = [...messages, { role: "user", content: text }];
    setMessages(nextMessages);
    setInput("");
    setLoading(true);
    try {
      const res = await fetch("/api/celeste", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ messages: nextMessages, context }),
      });
      const data = await res.json();
      if (data.text) {
        setMessages((m) => [...m, { role: "assistant", content: data.text }]);
      } else {
        setMessages((m) => [
          ...m,
          { role: "assistant", content: "Petit souci de connexion, tu peux réessayer ?" },
        ]);
      }
    } catch {
      setMessages((m) => [
        ...m,
        { role: "assistant", content: "Petit souci de connexion, tu peux réessayer ?" },
      ]);
    } finally {
      setLoading(false);
    }
  }

  return (
    <>
      <button className="celeste-fab" onClick={() => setOpen((o) => !o)} aria-label="Ouvrir Céleste">
        <CelesteMascot size={40} />
      </button>

      {open && (
        <div className="celeste-panel">
          <div className="celeste-panel-header">
            <CelesteMascot size={28} />
            <span>Céleste</span>
            <button className="celeste-close" onClick={() => setOpen(false)} aria-label="Fermer">
              ×
            </button>
          </div>
          <div className="celeste-messages" ref={scrollRef}>
            {messages.map((m, i) => (
              <div key={i} className={`celeste-bubble ${m.role}`}>
                {m.content}
              </div>
            ))}
            {loading && <div className="celeste-bubble assistant celeste-typing">...</div>}
          </div>
          <div className="celeste-input-row">
            <input
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={(e) => e.key === "Enter" && send()}
              placeholder="Pose ta question sur le cours..."
            />
            <button onClick={send} disabled={loading || !input.trim()}>
              Envoyer
            </button>
          </div>
        </div>
      )}
    </>
  );
}
