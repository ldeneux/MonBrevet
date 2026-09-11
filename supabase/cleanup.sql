-- ============================================================
-- Prépa Brevet — nettoyage complet
-- Supprime TOUTES les tables créées par schema.sql / sciences.sql /
-- histoire-geo-emc.sql. À lancer uniquement dans la base où tu as
-- créé le projet par erreur.
-- ============================================================

drop table if exists module_progress cascade;
drop table if exists quiz_attempts cascade;
drop table if exists annales cascade;
drop table if exists quiz_questions cascade;
drop table if exists examples cascade;
drop table if exists cours_sections cascade;
drop table if exists lecons cascade;
drop table if exists modules cascade;
drop table if exists subjects cascade;
