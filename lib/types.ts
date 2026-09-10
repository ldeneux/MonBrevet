export type Subject = {
  id: string;
  name: string;
  icon: string | null;
  position: number;
};

export type Module = {
  id: string;
  subject_id: string;
  title: string;
  tag: string | null;
  timed: boolean;
  position: number;
};

export type CoursSection = {
  id: string;
  module_id: string;
  type: "def" | "method" | "piege" | "retenir";
  content: string;
  position: number;
};

export type Example = {
  id: string;
  module_id: string;
  title: string;
  body: string;
  position: number;
};

export type QuizQuestion = {
  id: string;
  module_id: string;
  question: string;
  options: string[];
  correct_index: number;
  explanation: string | null;
  position: number;
};
