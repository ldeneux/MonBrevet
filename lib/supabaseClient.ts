"use client";

import { createClient } from "@supabase/supabase-js";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Connexion anonyme automatique : pas d'écran de login, pas de mot de passe.
// La session est simplement rattachée à l'appareil/navigateur, ce qui permet
// de retrouver la progression d'une visite à l'autre sans que personne
// d'autre (y compris le parent) n'ait accès à un tableau de bord.
export async function ensureAnonymousSession() {
  const { data } = await supabase.auth.getSession();
  if (!data.session) {
    const { error } = await supabase.auth.signInAnonymously();
    if (error) console.error("Erreur de connexion anonyme :", error.message);
  }
  const { data: after } = await supabase.auth.getSession();
  return after.session;
}
