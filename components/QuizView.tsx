"use client";

import { useEffect, useRef, useState } from "react";
import { QuizQuestion } from "@/lib/types";
import { ensureAnonymousSession } from "@/lib/supabaseClient";
import { saveQuizAttempt } from "@/lib/queries";

function formatTime(s: number) {
  const m = Math.floor(s / 60);
  const sec = s % 60;
  return `${m}:${sec.toString().padStart(2, "0")}`;
}

export default function QuizView({
  moduleId,
  timed,
  questions,
}: {
  moduleId: string;
  timed: boolean;
  questions: QuizQuestion[];
}) {
  const [index, setIndex] = useState(0);
  const [score, setScore] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [timeLeft, setTimeLeft] = useState(timed ? questions.length * 40 : 0);
  const intervalRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const finished = index >= questions.length;

  useEffect(() => {
    if (timed && !finished && intervalRef.current === null) {
      intervalRef.current = setInterval(() => {
        setTimeLeft((t) => {
          if (t <= 1) {
            if (intervalRef.current) clearInterval(intervalRef.current);
            setIndex(questions.length); // temps écoulé -> fin du quiz
            return 0;
          }
          return t - 1;
        });
      }, 1000);
    }
    return () => {
      if (finished && intervalRef.current) {
        clearInterval(intervalRef.current);
        intervalRef.current = null;
      }
    };
  }, [timed, finished, questions.length]);

  useEffect(() => {
    if (finished) {
      (async () => {
        const session = await ensureAnonymousSession();
        if (session) {
          await saveQuizAttempt(session.user.id, moduleId, score, questions.length);
        }
      })();
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [finished]);

  function selectAnswer(i: number) {
    if (selected !== null) return;
    setSelected(i);
    if (i === questions[index].correct_index) setScore((s) => s + 1);
  }

  function next() {
    setSelected(null);
    setIndex((i) => i + 1);
  }

  function restart() {
    setIndex(0);
    setScore(0);
    setSelected(null);
    setTimeLeft(timed ? questions.length * 40 : 0);
  }

  if (questions.length === 0) {
    return <p className="loading">Pas encore de quiz pour ce module.</p>;
  }

  if (finished) {
    const pct = Math.round((score / questions.length) * 100);
    return (
      <div className="result-card">
        <p className="eyebrow">Résultat</p>
        <div className="score-big">
          {score} / {questions.length}
        </div>
        <p style={{ color: "var(--ink-soft)" }}>{pct}% de bonnes réponses</p>
        <button className="btn" style={{ marginTop: 16 }} onClick={restart}>
          Recommencer le quiz
        </button>
      </div>
    );
  }

  const q = questions[index];
  const progressPct = Math.round((index / questions.length) * 100);

  return (
    <div>
      <div className="quiz-top">
        <span className="q-count">
          Question {index + 1} / {questions.length}
        </span>
        {timed && <div className="timer">{formatTime(timeLeft)}</div>}
      </div>
      <div className="progress-track">
        <div className="progress-fill" style={{ width: `${progressPct}%` }}></div>
      </div>
      <div className="question-card">
        <div className="q-text">{q.question}</div>
        <div>
          {q.options.map((opt, i) => {
            let cls = "opt";
            if (selected !== null) {
              if (i === q.correct_index) cls += " correct";
              else if (i === selected) cls += " wrong";
            }
            return (
              <button key={i} className={cls} disabled={selected !== null} onClick={() => selectAnswer(i)}>
                {opt}
              </button>
            );
          })}
        </div>
        {selected !== null && q.explanation && <div className="explain">{q.explanation}</div>}
        <div className="quiz-nav">
          <button className="btn" disabled={selected === null} onClick={next}>
            Suivant
          </button>
        </div>
      </div>
    </div>
  );
}
