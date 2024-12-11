/*
-- =========================================================================== A
-- Retrait des données des tables du schéma Evenement
-- -----------------------------------------------------------------------------
Produit  : KAO
Version  : 0.0.0
Statut   : en développement
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
  (LR) Lea.Roy4@USherbrooke.ca
  (MBL)Matis.BerubeLauziere@USherbrooke.ca
  (GK) Kosg1101@usherbrooke.ca

Tâches projetées :

Tâches réalisées :
  2023-11-16 (LR) : Création
-- -----------------------------------------------------------------------------
-- Fin de table_ret.sql
-- =========================================================================== Z
*/

