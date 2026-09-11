import { NextRequest, NextResponse } from "next/server";

// Céleste tourne sur Groq (https://console.groq.com), qui héberge des modèles
// open-source (Llama) gratuitement : pas de carte bancaire, ~14 400 requêtes/jour
// sur le tier gratuit — largement suffisant pour ce type d'usage.
const MODEL = "llama-3.3-70b-versatile";

const SYSTEM_PROMPT = `Tu es Céleste, une petite comète espiègle et bienveillante, mascotte de l'application "Prépa Brevet" qui aide les collégiens à réviser le brevet des collèges (programmes 2026).

Ton rôle, dans cet ordre de priorité :
1. Expliquer ou reformuler une notion du cours si l'élève bloque dessus, avec des mots simples et des exemples concrets.
2. Encourager l'élève avec un ton chaleureux, positif, jamais condescendant.
3. Corriger une réponse de quiz et expliquer pourquoi, sans jamais se moquer d'une erreur.
4. Répondre à des questions scolaires ouvertes, mais UNIQUEMENT si elles concernent le programme du brevet (maths, français, histoire-géographie-EMC, sciences).

Règles strictes, à respecter systématiquement :
- Tu ne réponds JAMAIS à une demande sans lien avec les révisions scolaires (recherche web, actualité, carte géographique en dehors du programme, code informatique hors du module technologie, sujet personnel, etc.). Dans ce cas, décline poliment en une phrase et recentre l'élève sur ses révisions.
- Réponses courtes (quelques phrases maximum), claires, adaptées au niveau d'un élève de 3e.
- Tu t'adresses à un mineur : reste toujours bienveillante, jamais de contenu inapproprié, jamais de sujet sensible hors du cadre scolaire.
- Tu ne donnes jamais directement la réponse d'un exercice ou d'un quiz en cours sans expliquer le raisonnement qui y mène.`;

export async function POST(req: NextRequest) {
  const apiKey = process.env.GROQ_API_KEY;
  if (!apiKey) {
    return NextResponse.json(
      { error: "GROQ_API_KEY n'est pas configurée sur le serveur." },
      { status: 500 }
    );
  }

  const body = await req.json();
  const messages = Array.isArray(body?.messages) ? body.messages : [];
  const context = body?.context as { subjectName?: string; moduleTitle?: string } | undefined;

  if (messages.length === 0) {
    return NextResponse.json({ error: "Aucun message fourni." }, { status: 400 });
  }

  const contextLine = context?.moduleTitle
    ? `\n\nContexte actuel : l'élève consulte le module "${context.moduleTitle}"${
        context.subjectName ? ` (matière : ${context.subjectName})` : ""
      }.`
    : "";

  try {
    const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${apiKey}`,
      },
      body: JSON.stringify({
        model: MODEL,
        max_tokens: 500,
        messages: [
          { role: "system", content: SYSTEM_PROMPT + contextLine },
          ...messages.map((m: { role: string; content: string }) => ({
            role: m.role,
            content: m.content,
          })),
        ],
      }),
    });

    if (!response.ok) {
      const errText = await response.text();
      return NextResponse.json({ error: errText }, { status: response.status });
    }

    const data = await response.json();
    const text = data.choices?.[0]?.message?.content ?? "";

    return NextResponse.json({ text });
  } catch (err) {
    return NextResponse.json({ error: "Erreur de connexion à l'API Groq." }, { status: 502 });
  }
}
