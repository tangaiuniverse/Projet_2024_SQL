/*
-- =========================================================================== A
-- Retrait des données des tables du schéma Evenement
-- -----------------------------------------------------------------------------
Produit  : POPO
Version  : 0.0.0
Statut   : FINI
-- =========================================================================== A
*/
--
set schema 'eve';
--
delete from personne;
delete from participant;
delete from gerant;
delete from inscription;
delete from evenement;
delete from activite;
delete from sponsors;
delete from endroit;
delete from presentiel;
delete from virtuel;
--
/*
-- =========================================================================== Z
Contributeurs :

  (GK) Kosg1101@usherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2024-04-16 (GK) : Création
-- -----------------------------------------------------------------------------
-- Fin de table_ret.sql
-- =========================================================================== Z
*/

