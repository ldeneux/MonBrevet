import { supabase } from "./supabaseClient";
import { CoursSection, Example, Module, QuizQuestion, Subject } from "./types";

export async function getSubjects(): Promise<Subject[]> {
  const { data, error } = await supabase
    .from("subjects")
    .select("*")
    .order("position");
  if (error) throw error;
  return data ?? [];
}

export async function getModules(subjectId: string): Promise<Module[]> {
  const { data, error } = await supabase
    .from("modules")
    .select("*")
    .eq("subject_id", subjectId)
    .order("position");
  if (error) throw error;
  return data ?? [];
}

export async function getModule(moduleId: string): Promise<Module | null> {
  const { data, error } = await supabase
    .from("modules")
    .select("*")
    .eq("id", moduleId)
    .single();
  if (error) return null;
  return data;
}

export async function getCoursSections(moduleId: string): Promise<CoursSection[]> {
  const { data, error } = await supabase
    .from("cours_sections")
    .select("*")
    .eq("module_id", moduleId)
    .order("position");
  if (error) throw error;
  return data ?? [];
}

export async function getExamples(moduleId: string): Promise<Example[]> {
  const { data, error } = await supabase
    .from("examples")
    .select("*")
    .eq("module_id", moduleId)
    .order("position");
  if (error) throw error;
  return data ?? [];
}

export async function getQuizQuestions(moduleId: string): Promise<QuizQuestion[]> {
  const { data, error } = await supabase
    .from("quiz_questions")
    .select("*")
    .eq("module_id", moduleId)
    .order("position");
  if (error) throw error;
  return data ?? [];
}

export async function saveQuizAttempt(
  userId: string,
  moduleId: string,
  score: number,
  total: number
) {
  await supabase.from("quiz_attempts").insert({
    user_id: userId,
    module_id: moduleId,
    score,
    total,
  });

  const { data: existing } = await supabase
    .from("module_progress")
    .select("*")
    .eq("user_id", userId)
    .eq("module_id", moduleId)
    .maybeSingle();

  const bestScore = existing?.best_score
    ? Math.max(existing.best_score, score)
    : score;

  await supabase.from("module_progress").upsert({
    user_id: userId,
    module_id: moduleId,
    best_score: bestScore,
    attempts: (existing?.attempts ?? 0) + 1,
    updated_at: new Date().toISOString(),
  });
}

export async function markCoursRead(userId: string, moduleId: string) {
  const { data: existing } = await supabase
    .from("module_progress")
    .select("*")
    .eq("user_id", userId)
    .eq("module_id", moduleId)
    .maybeSingle();

  await supabase.from("module_progress").upsert({
    user_id: userId,
    module_id: moduleId,
    cours_read: true,
    attempts: existing?.attempts ?? 0,
    best_score: existing?.best_score ?? null,
    updated_at: new Date().toISOString(),
  });
}
