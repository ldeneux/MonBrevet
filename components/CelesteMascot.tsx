export default function CelesteMascot({ size = 40 }: { size?: number }) {
  return (
    <svg width={size} height={size} viewBox="0 0 200 200">
      <defs>
        <radialGradient id="celeste-head" cx="40%" cy="35%" r="70%">
          <stop offset="0%" stopColor="#FFFFFF" />
          <stop offset="45%" stopColor="#FCE8AE" />
          <stop offset="100%" stopColor="#F0C862" />
        </radialGradient>
        <linearGradient id="celeste-tail" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" stopColor="#AEDFF7" />
          <stop offset="55%" stopColor="#DBCCF2" />
          <stop offset="100%" stopColor="#F6CBDD" />
        </linearGradient>
      </defs>
      <path
        d="M 150 110 C 110 95 70 85 30 78 C 80 92 120 108 150 128 C 105 122 65 122 35 130 C 90 138 125 152 148 168 Z"
        fill="url(#celeste-tail)"
        opacity="0.8"
      />
      <circle cx="130" cy="100" r="62" fill="url(#celeste-head)" stroke="#3A4A5C" strokeWidth="3" />
      <circle cx="112" cy="92" r="7" fill="#3A4A5C" />
      <circle cx="114" cy="90" r="2.2" fill="#FFFFFF" />
      <circle cx="148" cy="92" r="7" fill="#3A4A5C" />
      <circle cx="150" cy="90" r="2.2" fill="#FFFFFF" />
      <path d="M 110 118 Q 130 132 150 118" fill="none" stroke="#3A4A5C" strokeWidth="4" strokeLinecap="round" />
      <circle cx="103" cy="107" r="6" fill="#F6CBDD" opacity="0.7" />
      <circle cx="157" cy="107" r="6" fill="#F6CBDD" opacity="0.7" />
    </svg>
  );
}
