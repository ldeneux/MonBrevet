// Illustrations pastel pour les leçons. Chaque composant est un simple SVG
// décoratif, appelé depuis lib/illustrationMap.ts en fonction du module et
// du titre exact de la leçon (voir supabase/schema.sql et sciences.sql).

export const PALETTE = {
  blue: "#AEDFF7",
  blueDark: "#6FB8E0",
  green: "#BFEAD0",
  greenDark: "#7FCC9E",
  yellow: "#FCE8AE",
  yellowDark: "#F0C862",
  pink: "#F6CBDD",
  pinkDark: "#E894B8",
  purple: "#DBCCF2",
  purpleDark: "#B79AE8",
  orange: "#FBD8B4",
  orangeDark: "#F2AC66",
  ink: "#3A4A5C",
  inkLight: "#6B7A8C",
};

const labelStyle = {
  fontFamily: "'Public Sans', sans-serif",
  fontSize: 13,
  fill: PALETTE.ink,
  fontWeight: 600,
};

/* ---------- GÉOMÉTRIE ---------- */

export function IllustrationPythagore() {
  return (
    <svg viewBox="0 0 400 240" width="100%">
      <polygon points="70,190 300,190 70,60" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2.5" strokeLinejoin="round" />
      <rect x="70" y="170" width="20" height="20" fill="none" stroke={PALETTE.ink} strokeWidth="2" />
      <text x="175" y="212" style={labelStyle} textAnchor="middle">côté a</text>
      <text x="40" y="130" style={labelStyle} textAnchor="middle">côté b</text>
      <text x="200" y="115" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>hypoténuse</text>
    </svg>
  );
}

export function IllustrationThales() {
  return (
    <svg viewBox="0 0 400 240" width="100%">
      <polygon points="200,20 60,210 340,210" fill={PALETTE.purple} opacity="0.35" stroke={PALETTE.ink} strokeWidth="2" strokeLinejoin="round" />
      <line x1="140" y1="120" x2="260" y2="120" stroke={PALETTE.pinkDark} strokeWidth="4" strokeLinecap="round" />
      <line x1="60" y1="210" x2="340" y2="210" stroke={PALETTE.blueDark} strokeWidth="4" strokeLinecap="round" />
      <circle cx="200" cy="20" r="4" fill={PALETTE.ink} />
      <text x="200" y="14" style={labelStyle} textAnchor="middle">A</text>
      <text x="130" y="112" style={labelStyle} textAnchor="middle">B</text>
      <text x="270" y="112" style={labelStyle} textAnchor="middle">C</text>
      <text x="52" y="228" style={labelStyle} textAnchor="middle">D</text>
      <text x="348" y="228" style={labelStyle} textAnchor="middle">E</text>
      <text x="200" y="140" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>(BC) // (DE)</text>
    </svg>
  );
}

export function IllustrationTrigo() {
  return (
    <svg viewBox="0 0 400 240" width="100%">
      <polygon points="70,190 320,190 70,50" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2.5" strokeLinejoin="round" />
      <path d="M 100 190 A 30 30 0 0 0 88 165" fill="none" stroke={PALETTE.orangeDark} strokeWidth="2.5" />
      <text x="108" y="175" style={labelStyle}>θ</text>
      <text x="190" y="212" style={labelStyle} textAnchor="middle" fill={PALETTE.blueDark}>adjacent</text>
      <text x="40" y="120" style={labelStyle} textAnchor="middle" fill={PALETTE.greenDark}>opposé</text>
      <text x="220" y="105" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>hypoténuse</text>
    </svg>
  );
}

export function IllustrationVolumes() {
  return (
    <svg viewBox="0 0 400 200" width="100%">
      {/* cube */}
      <g transform="translate(20,60)">
        <polygon points="0,60 50,60 50,10 0,10" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
        <polygon points="0,10 15,0 65,0 50,10" fill={PALETTE.blueDark} stroke={PALETTE.ink} strokeWidth="2" />
        <polygon points="50,10 65,0 65,50 50,60" fill={PALETTE.blueDark} stroke={PALETTE.ink} strokeWidth="2" opacity="0.7" />
        <text x="25" y="95" style={labelStyle} textAnchor="middle">cube</text>
      </g>
      {/* cylinder */}
      <g transform="translate(120,55)">
        <ellipse cx="30" cy="10" rx="28" ry="10" fill={PALETTE.green} stroke={PALETTE.ink} strokeWidth="2" />
        <rect x="2" y="10" width="56" height="55" fill={PALETTE.green} stroke={PALETTE.ink} strokeWidth="2" />
        <ellipse cx="30" cy="65" rx="28" ry="10" fill={PALETTE.greenDark} stroke={PALETTE.ink} strokeWidth="2" />
        <text x="30" y="98" style={labelStyle} textAnchor="middle">cylindre</text>
      </g>
      {/* pyramid */}
      <g transform="translate(220,55)">
        <polygon points="30,0 60,60 0,60" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2" strokeLinejoin="round" />
        <line x1="30" y1="0" x2="30" y2="60" stroke={PALETTE.yellowDark} strokeWidth="2" />
        <text x="30" y="93" style={labelStyle} textAnchor="middle">pyramide</text>
      </g>
      {/* sphere */}
      <g transform="translate(310,55)">
        <circle cx="30" cy="35" r="30" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="2" />
        <ellipse cx="30" cy="35" rx="30" ry="10" fill="none" stroke={PALETTE.pinkDark} strokeWidth="1.5" opacity="0.6" />
        <text x="30" y="93" style={labelStyle} textAnchor="middle">sphère</text>
      </g>
    </svg>
  );
}

/* ---------- PHYSIQUE-CHIMIE : MATIÈRE ---------- */

export function IllustrationAtome() {
  return (
    <svg viewBox="0 0 400 240" width="100%">
      <ellipse cx="200" cy="120" rx="150" ry="55" fill="none" stroke={PALETTE.blueDark} strokeWidth="2" transform="rotate(15 200 120)" />
      <ellipse cx="200" cy="120" rx="150" ry="55" fill="none" stroke={PALETTE.greenDark} strokeWidth="2" transform="rotate(-15 200 120)" />
      <ellipse cx="200" cy="120" rx="150" ry="55" fill="none" stroke={PALETTE.purpleDark} strokeWidth="2" transform="rotate(90 200 120)" />
      <circle cx="188" cy="112" r="10" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="1.5" />
      <circle cx="205" cy="108" r="10" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="1.5" />
      <circle cx="196" cy="128" r="10" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="1.5" />
      <circle cx="213" cy="124" r="10" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="1.5" />
      <circle cx="50" cy="80" r="6" fill={PALETTE.orangeDark} />
      <circle cx="345" cy="150" r="6" fill={PALETTE.orangeDark} />
      <circle cx="200" cy="35" r="6" fill={PALETTE.orangeDark} />
      <text x="365" y="150" style={labelStyle}>électron</text>
      <text x="225" y="155" style={labelStyle}>noyau</text>
    </svg>
  );
}

export function IllustrationMelanges() {
  return (
    <svg viewBox="0 0 400 200" width="100%">
      <rect x="20" y="30" width="160" height="130" rx="10" fill={PALETTE.blue} opacity="0.3" stroke={PALETTE.ink} strokeWidth="2" />
      {Array.from({ length: 12 }).map((_, i) => (
        <circle key={i} cx={45 + (i % 4) * 35} cy={55 + Math.floor(i / 4) * 35} r="8" fill={PALETTE.blueDark} />
      ))}
      <text x="100" y="182" style={labelStyle} textAnchor="middle">mélange homogène</text>

      <rect x="220" y="30" width="160" height="130" rx="10" fill={PALETTE.pink} opacity="0.3" stroke={PALETTE.ink} strokeWidth="2" />
      <circle cx="270" cy="80" r="26" fill={PALETTE.pinkDark} opacity="0.8" />
      <circle cx="335" cy="120" r="18" fill={PALETTE.yellowDark} opacity="0.8" />
      <circle cx="255" cy="135" r="12" fill={PALETTE.greenDark} opacity="0.8" />
      <text x="300" y="182" style={labelStyle} textAnchor="middle">mélange hétérogène</text>
    </svg>
  );
}

export function IllustrationEtatsMatiere() {
  const grid = (color: string) => Array.from({ length: 9 }).map((_, i) => (
    <circle key={i} cx={20 + (i % 3) * 20} cy={20 + Math.floor(i / 3) * 20} r="6" fill={color} />
  ));
  return (
    <svg viewBox="0 0 420 190" width="100%">
      <g transform="translate(10,20)">
        <rect width="110" height="110" rx="8" fill={PALETTE.blue} opacity="0.25" stroke={PALETTE.ink} strokeWidth="2" />
        {grid(PALETTE.blueDark)}
        <text x="55" y="135" style={labelStyle} textAnchor="middle">solide</text>
      </g>
      <g transform="translate(155,20)">
        <rect width="110" height="110" rx="8" fill={PALETTE.green} opacity="0.25" stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="20" cy="25" r="6" fill={PALETTE.greenDark} />
        <circle cx="60" cy="35" r="6" fill={PALETTE.greenDark} />
        <circle cx="35" cy="60" r="6" fill={PALETTE.greenDark} />
        <circle cx="80" cy="70" r="6" fill={PALETTE.greenDark} />
        <circle cx="25" cy="90" r="6" fill={PALETTE.greenDark} />
        <circle cx="70" cy="95" r="6" fill={PALETTE.greenDark} />
        <text x="55" y="135" style={labelStyle} textAnchor="middle">liquide</text>
      </g>
      <g transform="translate(300,20)">
        <rect width="110" height="110" rx="8" fill={PALETTE.yellow} opacity="0.25" stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="15" cy="20" r="5" fill={PALETTE.yellowDark} />
        <circle cx="80" cy="15" r="5" fill={PALETTE.yellowDark} />
        <circle cx="45" cy="55" r="5" fill={PALETTE.yellowDark} />
        <circle cx="90" cy="80" r="5" fill={PALETTE.yellowDark} />
        <circle cx="20" cy="90" r="5" fill={PALETTE.yellowDark} />
        <circle cx="65" cy="95" r="5" fill={PALETTE.yellowDark} />
        <text x="55" y="135" style={labelStyle} textAnchor="middle">gaz</text>
      </g>
      <text x="135" y="70" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>→</text>
      <text x="280" y="70" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>→</text>
    </svg>
  );
}

/* ---------- AUTOMATISMES ---------- */

export function IllustrationPriorites() {
  const steps = [
    { label: "( )  parenthèses", color: PALETTE.pink },
    { label: "puissances", color: PALETTE.purple },
    { label: "×  ÷", color: PALETTE.blue },
    { label: "+  −", color: PALETTE.green },
  ];
  return (
    <svg viewBox="0 0 400 200" width="100%">
      {steps.map((s, i) => (
        <g key={i}>
          <rect x={40 + i * 20} y={20 + i * 40} width={320 - i * 40} height="34" rx="8" fill={s.color} stroke={PALETTE.ink} strokeWidth="1.5" />
          <text x="200" y={42 + i * 40} style={labelStyle} textAnchor="middle">{i + 1}. {s.label}</text>
        </g>
      ))}
    </svg>
  );
}

export function IllustrationConversions() {
  const units = ["km", "hm", "dam", "m", "dm", "cm", "mm"];
  return (
    <svg viewBox="0 0 420 140" width="100%">
      <line x1="30" y1="70" x2="390" y2="70" stroke={PALETTE.ink} strokeWidth="2" />
      {units.map((u, i) => (
        <g key={u}>
          <circle cx={40 + i * 57} cy="70" r="7" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="1.5" />
          <text x={40 + i * 57} y="100" style={labelStyle} textAnchor="middle">{u}</text>
        </g>
      ))}
      <text x="210" y="35" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>× 10  →</text>
      <text x="210" y="130" style={labelStyle} textAnchor="middle" fill={PALETTE.greenDark}>←  ÷ 10</text>
    </svg>
  );
}

/* ---------- NOMBRES ET CALCULS ---------- */

export function IllustrationPuissances() {
  return (
    <svg viewBox="0 0 400 180" width="100%">
      <rect x="30" y="120" width="30" height="30" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="45" y="165" style={labelStyle} textAnchor="middle">a¹</text>

      <rect x="140" y="90" width="60" height="60" fill={PALETTE.green} stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="170" y1="90" x2="170" y2="150" stroke={PALETTE.greenDark} strokeWidth="1.5" />
      <line x1="140" y1="120" x2="200" y2="120" stroke={PALETTE.greenDark} strokeWidth="1.5" />
      <text x="170" y="165" style={labelStyle} textAnchor="middle">a²</text>

      <g transform="translate(280,40)">
        <polygon points="0,110 90,110 90,20 0,20" fill={PALETTE.purple} stroke={PALETTE.ink} strokeWidth="2" />
        <polygon points="0,20 25,0 115,0 90,20" fill={PALETTE.purpleDark} stroke={PALETTE.ink} strokeWidth="2" />
        <polygon points="90,20 115,0 115,90 90,110" fill={PALETTE.purpleDark} stroke={PALETTE.ink} strokeWidth="2" opacity="0.8" />
        <text x="45" y="135" style={labelStyle} textAnchor="middle">a³</text>
      </g>
    </svg>
  );
}

export function IllustrationIdentitesRemarquables() {
  return (
    <svg viewBox="0 0 400 260" width="100%">
      <rect x="60" y="20" width="140" height="140" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
      <rect x="200" y="20" width="80" height="140" fill={PALETTE.green} stroke={PALETTE.ink} strokeWidth="2" />
      <rect x="60" y="160" width="140" height="80" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2" />
      <rect x="200" y="160" width="80" height="80" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="130" y="95" style={labelStyle} textAnchor="middle">a²</text>
      <text x="240" y="95" style={labelStyle} textAnchor="middle">ab</text>
      <text x="130" y="205" style={labelStyle} textAnchor="middle">ab</text>
      <text x="240" y="205" style={labelStyle} textAnchor="middle">b²</text>
      <text x="170" y="253" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>(a+b)² = a² + 2ab + b²</text>
    </svg>
  );
}

/* ---------- FONCTIONS ---------- */

export function IllustrationFonctionAffine() {
  return (
    <svg viewBox="0 0 400 240" width="100%">
      <line x1="40" y1="200" x2="380" y2="200" stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="60" y1="20" x2="60" y2="220" stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="60" y1="160" x2="320" y2="50" stroke={PALETTE.pinkDark} strokeWidth="3" strokeLinecap="round" />
      <circle cx="60" cy="160" r="5" fill={PALETTE.blueDark} />
      <text x="30" y="164" style={labelStyle} textAnchor="middle">b</text>
      <path d="M 150 108 L 200 108 L 200 78" fill="none" stroke={PALETTE.greenDark} strokeWidth="2" strokeDasharray="4 3" />
      <text x="215" y="95" style={labelStyle}>a</text>
      <text x="200" y="230" style={labelStyle} textAnchor="middle">y = ax + b</text>
    </svg>
  );
}

export function IllustrationPourcentages() {
  return (
    <svg viewBox="0 0 240 240" width="100%">
      <circle cx="120" cy="120" r="90" fill="none" stroke={PALETTE.blue} strokeWidth="22" />
      <circle
        cx="120" cy="120" r="90" fill="none" stroke={PALETTE.pinkDark} strokeWidth="22"
        strokeDasharray={`${2 * Math.PI * 90 * 0.75} ${2 * Math.PI * 90}`}
        transform="rotate(-90 120 120)" strokeLinecap="round"
      />
      <text x="120" y="128" style={{ ...labelStyle, fontSize: 26 }} textAnchor="middle">75%</text>
    </svg>
  );
}

/* ---------- STATISTIQUES ---------- */

export function IllustrationMoyenneMediane() {
  const points = [40, 90, 130, 180, 240, 300, 340];
  const median = 180;
  return (
    <svg viewBox="0 0 380 100" width="100%">
      <line x1="20" y1="60" x2="360" y2="60" stroke={PALETTE.ink} strokeWidth="2" />
      {points.map((x, i) => (
        <circle key={i} cx={x} cy="60" r="8" fill={x === median ? PALETTE.pinkDark : PALETTE.blue} stroke={PALETTE.ink} strokeWidth="1.5" />
      ))}
      <text x={median} y="88" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>médiane</text>
    </svg>
  );
}

export function IllustrationProbabilites() {
  return (
    <svg viewBox="0 0 400 180" width="100%">
      <g transform="translate(40,30)">
        <rect width="100" height="100" rx="14" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2.5" />
        <circle cx="30" cy="30" r="7" fill={PALETTE.ink} />
        <circle cx="70" cy="30" r="7" fill={PALETTE.ink} />
        <circle cx="30" cy="70" r="7" fill={PALETTE.ink} />
        <circle cx="70" cy="70" r="7" fill={PALETTE.ink} />
        <circle cx="50" cy="50" r="7" fill={PALETTE.ink} />
      </g>
      <g transform="translate(220,20)">
        <path d="M 10 30 Q 10 10 40 10 L 80 10 Q 110 10 110 30 L 110 100 Q 110 120 60 120 Q 10 120 10 100 Z" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2.5" />
        <circle cx="45" cy="80" r="10" fill={PALETTE.pinkDark} />
        <circle cx="70" cy="95" r="10" fill={PALETTE.greenDark} />
        <circle cx="55" cy="60" r="10" fill={PALETTE.purpleDark} />
        <circle cx="80" cy="70" r="10" fill={PALETTE.pinkDark} />
      </g>
    </svg>
  );
}

/* ---------- ALGO ---------- */

export function IllustrationBoucleCondition() {
  return (
    <svg viewBox="0 0 320 260" width="100%">
      <ellipse cx="160" cy="30" rx="55" ry="24" fill={PALETTE.green} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="160" y="35" style={labelStyle} textAnchor="middle">Début</text>

      <polygon points="160,70 220,110 160,150 100,110" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="160" y="115" style={labelStyle} textAnchor="middle">i ≤ n ?</text>

      <rect x="230" y="90" width="70" height="40" rx="8" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="265" y="114" style={labelStyle} textAnchor="middle">action</text>

      <ellipse cx="160" cy="220" rx="55" ry="24" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="160" y="225" style={labelStyle} textAnchor="middle">Fin</text>

      <line x1="160" y1="54" x2="160" y2="70" stroke={PALETTE.ink} strokeWidth="2" markerEnd="url(#arrow)" />
      <line x1="220" y1="110" x2="230" y2="110" stroke={PALETTE.ink} strokeWidth="2" />
      <path d="M 265 130 L 265 160 L 160 160 L 160 150" fill="none" stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="160" y1="150" x2="160" y2="196" stroke={PALETTE.ink} strokeWidth="2" />
      <text x="240" y="150" style={labelStyle} fill={PALETTE.greenDark}>oui</text>
      <text x="170" y="185" style={labelStyle} fill={PALETTE.pinkDark}>non</text>
    </svg>
  );
}

/* ---------- SCIENCES : reste ---------- */

export function IllustrationReactionChimique() {
  return (
    <svg viewBox="0 0 400 180" width="100%">
      <g transform="translate(20,20)">
        <path d="M 30 0 L 50 0 L 50 40 L 75 110 Q 80 130 60 130 L 20 130 Q 0 130 5 110 L 30 40 Z" fill={PALETTE.blue} opacity="0.5" stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="35" cy="100" r="8" fill={PALETTE.blueDark} />
        <circle cx="55" cy="110" r="8" fill={PALETTE.purpleDark} />
        <text x="40" y="155" style={labelStyle} textAnchor="middle">réactifs</text>
      </g>
      <text x="200" y="90" style={{ ...labelStyle, fontSize: 24 }} textAnchor="middle" fill={PALETTE.pinkDark}>→</text>
      <g transform="translate(280,20)">
        <path d="M 30 0 L 50 0 L 50 40 L 75 110 Q 80 130 60 130 L 20 130 Q 0 130 5 110 L 30 40 Z" fill={PALETTE.green} opacity="0.5" stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="45" cy="105" r="10" fill={PALETTE.greenDark} />
        <text x="40" y="155" style={labelStyle} textAnchor="middle">produits</text>
      </g>
    </svg>
  );
}

export function IllustrationCircuits() {
  return (
    <svg viewBox="0 0 400 180" width="100%">
      <g transform="translate(20,30)">
        <rect x="0" y="40" width="150" height="80" fill="none" stroke={PALETTE.ink} strokeWidth="2.5" />
        <rect x="60" y="15" width="30" height="16" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="75" cy="120" r="14" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="2" />
        <text x="75" y="150" style={labelStyle} textAnchor="middle">série</text>
      </g>
      <g transform="translate(210,30)">
        <rect x="0" y="0" width="160" height="110" fill="none" stroke={PALETTE.ink} strokeWidth="2.5" />
        <line x1="80" y1="0" x2="80" y2="110" stroke={PALETTE.ink} strokeWidth="2.5" />
        <rect x="30" y="-15" width="30" height="16" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="45" cy="55" r="12" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
        <circle cx="115" cy="55" r="12" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
        <text x="80" y="140" style={labelStyle} textAnchor="middle">dérivation</text>
      </g>
    </svg>
  );
}

export function IllustrationForces() {
  return (
    <svg viewBox="0 0 400 160" width="100%">
      <rect x="60" y="60" width="70" height="50" rx="8" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2.5" />
      <line x1="130" y1="85" x2="280" y2="85" stroke={PALETTE.pinkDark} strokeWidth="4" markerEnd="url(#arrowPink)" />
      <polygon points="280,75 300,85 280,95" fill={PALETTE.pinkDark} />
      <text x="200" y="65" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>force (N)</text>
    </svg>
  );
}

export function IllustrationHeredite() {
  return (
    <svg viewBox="0 0 400 200" width="100%">
      <circle cx="120" cy="30" r="16" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
      <rect x="264" y="14" width="32" height="32" fill={PALETTE.pink} stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="136" y1="30" x2="264" y2="30" stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="200" y1="30" x2="200" y2="90" stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="120" y1="90" x2="280" y2="90" stroke={PALETTE.ink} strokeWidth="2" />
      <circle cx="120" cy="120" r="14" fill={PALETTE.purple} stroke={PALETTE.ink} strokeWidth="2" />
      <circle cx="200" cy="120" r="14" fill={PALETTE.green} stroke={PALETTE.ink} strokeWidth="2" />
      <rect x="266" y="106" width="28" height="28" fill={PALETTE.yellow} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="200" y="175" style={labelStyle} textAnchor="middle">allèles transmis à chaque génération</text>
    </svg>
  );
}

export function IllustrationArcReflexe() {
  return (
    <svg viewBox="0 0 300 220" width="100%">
      <circle cx="150" cy="40" r="20" fill={PALETTE.orange} stroke={PALETTE.ink} strokeWidth="2" />
      <line x1="150" y1="60" x2="150" y2="150" stroke={PALETTE.ink} strokeWidth="6" strokeLinecap="round" />
      <line x1="150" y1="80" x2="90" y2="130" stroke={PALETTE.ink} strokeWidth="5" strokeLinecap="round" />
      <path d="M 90 130 Q 60 150 70 180" fill="none" stroke={PALETTE.pinkDark} strokeWidth="3" strokeDasharray="5 4" markerEnd="url(#arrowPink)" />
      <circle cx="70" cy="182" r="7" fill={PALETTE.pinkDark} />
      <text x="70" y="205" style={labelStyle} textAnchor="middle">récepteur</text>
      <text x="200" y="105" style={labelStyle} fill={PALETTE.blueDark}>moelle épinière</text>
    </svg>
  );
}

export function IllustrationSelectionNaturelle() {
  const colors = [PALETTE.blue, PALETTE.blue, PALETTE.purple, PALETTE.purple, PALETTE.pink, PALETTE.pinkDark];
  return (
    <svg viewBox="0 0 400 120" width="100%">
      {colors.map((c, i) => (
        <ellipse key={i} cx={40 + i * 65} cy="60" rx="24" ry="16" fill={c} stroke={PALETTE.ink} strokeWidth="2" />
      ))}
      <line x1="20" y1="100" x2="380" y2="100" stroke={PALETTE.ink} strokeWidth="1.5" strokeDasharray="4 3" />
      <text x="40" y="115" style={labelStyle} textAnchor="middle">génération 1</text>
      <text x="360" y="115" style={labelStyle} textAnchor="middle">génération n</text>
    </svg>
  );
}

export function IllustrationPlaquesTectoniques() {
  return (
    <svg viewBox="0 0 400 200" width="100%">
      <path d="M 20 100 Q 120 40 200 100 T 380 100" fill="none" stroke={PALETTE.ink} strokeWidth="2" strokeDasharray="6 5" />
      <path d="M 0 60 Q 100 100 190 60 L 190 0 L 0 0 Z" fill={PALETTE.green} opacity="0.5" />
      <path d="M 0 140 Q 100 100 190 140 L 190 200 L 0 200 Z" fill={PALETTE.blue} opacity="0.5" />
      <path d="M 210 60 Q 300 100 400 60 L 400 0 L 210 0 Z" fill={PALETTE.yellow} opacity="0.5" />
      <path d="M 210 140 Q 300 100 400 140 L 400 200 L 210 200 Z" fill={PALETTE.pink} opacity="0.5" />
      <polygon points="300,60 315,90 285,90" fill={PALETTE.orangeDark} stroke={PALETTE.ink} strokeWidth="1.5" />
      <text x="300" y="45" style={labelStyle} textAnchor="middle">volcan</text>
      <text x="200" y="115" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>frontière de plaques</text>
    </svg>
  );
}

export function IllustrationObjetTechnique() {
  return (
    <svg viewBox="0 0 400 180" width="100%">
      <circle cx="90" cy="120" r="45" fill="none" stroke={PALETTE.ink} strokeWidth="5" />
      <circle cx="270" cy="120" r="45" fill="none" stroke={PALETTE.ink} strokeWidth="5" />
      <line x1="90" y1="120" x2="270" y2="120" stroke={PALETTE.ink} strokeWidth="4" />
      <line x1="180" y1="120" x2="180" y2="50" stroke={PALETTE.ink} strokeWidth="4" />
      <circle cx="180" cy="120" r="10" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
      <text x="90" y="60" style={labelStyle} textAnchor="middle" fill={PALETTE.blueDark}>roue</text>
      <text x="180" y="35" style={labelStyle} textAnchor="middle" fill={PALETTE.pinkDark}>pédalier</text>
    </svg>
  );
}

export function IllustrationClientServeur() {
  return (
    <svg viewBox="0 0 400 160" width="100%">
      <g transform="translate(30,40)">
        <rect width="100" height="65" rx="6" fill={PALETTE.blue} stroke={PALETTE.ink} strokeWidth="2" />
        <rect x="10" y="10" width="80" height="45" fill="#fff" stroke={PALETTE.ink} strokeWidth="1.5" />
        <text x="50" y="90" style={labelStyle} textAnchor="middle">client</text>
      </g>
      <g transform="translate(280,25)">
        <rect width="90" height="30" rx="4" fill={PALETTE.purple} stroke={PALETTE.ink} strokeWidth="2" />
        <rect width="90" height="30" y="38" rx="4" fill={PALETTE.purple} stroke={PALETTE.ink} strokeWidth="2" />
        <rect width="90" height="30" y="76" rx="4" fill={PALETTE.purple} stroke={PALETTE.ink} strokeWidth="2" />
        <text x="45" y="130" style={labelStyle} textAnchor="middle">serveur</text>
      </g>
      <line x1="140" y1="60" x2="270" y2="45" stroke={PALETTE.pinkDark} strokeWidth="2.5" markerEnd="url(#arrowPink)" />
      <line x1="270" y1="75" x2="140" y2="85" stroke={PALETTE.greenDark} strokeWidth="2.5" markerEnd="url(#arrowGreen)" />
      <text x="200" y="35" style={labelStyle} fill={PALETTE.pinkDark}>requête</text>
      <text x="190" y="105" style={labelStyle} fill={PALETTE.greenDark}>réponse</text>
    </svg>
  );
}

export function IllustrationCycleVie() {
  const steps = ["matière première", "fabrication", "usage", "recyclage"];
  const colors = [PALETTE.green, PALETTE.blue, PALETTE.yellow, PALETTE.pink];
  const positions = [
    { x: 200, y: 20 },
    { x: 340, y: 110 },
    { x: 200, y: 200 },
    { x: 60, y: 110 },
  ];
  return (
    <svg viewBox="0 0 400 220" width="100%">
      <circle cx="200" cy="110" r="80" fill="none" stroke={PALETTE.ink} strokeWidth="2" strokeDasharray="6 5" />
      {positions.map((p, i) => (
        <g key={i}>
          <circle cx={p.x} cy={p.y} r="34" fill={colors[i]} stroke={PALETTE.ink} strokeWidth="2" />
          <text x={p.x} y={p.y + 4} style={{ ...labelStyle, fontSize: 11 }} textAnchor="middle">{steps[i]}</text>
        </g>
      ))}
    </svg>
  );
}

/* Marqueurs de flèche partagés (à inclure une fois dans le document) */
export function ArrowMarkers() {
  return (
    <svg width="0" height="0">
      <defs>
        <marker id="arrow" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <path d="M0,0 L8,4 L0,8 Z" fill={PALETTE.ink} />
        </marker>
        <marker id="arrowPink" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <path d="M0,0 L8,4 L0,8 Z" fill={PALETTE.pinkDark} />
        </marker>
        <marker id="arrowGreen" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
          <path d="M0,0 L8,4 L0,8 Z" fill={PALETTE.greenDark} />
        </marker>
      </defs>
    </svg>
  );
}
