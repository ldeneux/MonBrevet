import { Lecon } from "@/lib/types";
import { getIllustration } from "@/lib/illustrationMap";
import { ArrowMarkers } from "./illustrations";

function renderInline(text: string, keyPrefix: string) {
  const parts = text.split(/(\*\*[^*]+\*\*)/g);
  return parts.map((p, i) =>
    p.startsWith("**") && p.endsWith("**") ? (
      <strong key={`${keyPrefix}-${i}`}>{p.slice(2, -2)}</strong>
    ) : (
      <span key={`${keyPrefix}-${i}`}>{p}</span>
    )
  );
}

function renderBody(body: string) {
  const blocks = body.split(/\n\n+/);
  return blocks.map((block, i) => {
    const trimmed = block.trim();
    if (trimmed.startsWith("- ")) {
      const items = trimmed.split("\n").map((l) => l.replace(/^- /, ""));
      return (
        <ul key={i}>
          {items.map((it, j) => (
            <li key={j}>{renderInline(it, `${i}-${j}`)}</li>
          ))}
        </ul>
      );
    }
    return <p key={i}>{renderInline(trimmed, `${i}`)}</p>;
  });
}

export default function CoursComplet({ lecons, moduleId }: { lecons: Lecon[]; moduleId: string }) {
  if (lecons.length === 0) {
    return <p className="loading">Le cours complet de ce module arrive bientôt.</p>;
  }
  return (
    <div>
      <ArrowMarkers />
      {lecons.map((l) => {
        const Illustration = getIllustration(moduleId, l.title);
        return (
          <div className="lesson-section" key={l.id}>
            <h2>{l.title}</h2>
            {Illustration && (
              <div className="lesson-illustration">
                <Illustration />
              </div>
            )}
            <div className="lesson-body">{renderBody(l.body)}</div>
          </div>
        );
      })}
    </div>
  );
}
