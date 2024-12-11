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



--



--Validation des Capacités d'Endroit

CREATE OR REPLACE FUNCTION check_endroit_capacity_before_insert()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifier si la capacité maximum de l'endroit est atteinte
    IF (SELECT eve.presentiel.capacite  FROM endroit WHERE id_endroit = (
        SELECT id_endroit FROM evenement WHERE id_inscription = NEW.id_inscription
    )) <= 0 THEN
        RAISE EXCEPTION 'La capacité de cet endroit est déjà maximale.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_check_capacity_before_insert
BEFORE INSERT ON inscription
FOR EACH ROW
EXECUTE FUNCTION check_endroit_capacity_before_insert();

-- Mise à jour des Capacités d'Endroit

ALTER TABLE inscription
ADD COLUMN IF NOT EXISTS statut VARCHAR(20) DEFAULT 'Actif';

CREATE OR REPLACE FUNCTION update_endroit_capacity_after_update()
RETURNS TRIGGER AS $$
BEGIN
    -- Augmenter la capacité disponible si une inscription est annulée
    IF OLD.statut IS DISTINCT FROM NEW.statut AND NEW.statut = 'Annulé' THEN
        UPDATE endroit SET eve.presentiel.capacite = eve.presentiel.capacite + 1
        WHERE id_endroit = (
            SELECT id_endroit FROM evenement WHERE id_inscription = NEW.id_inscription
        );
    END IF;

    -- Diminuer la capacité disponible si une inscription est réactivée
    IF OLD.statut = 'Annulé' AND NEW.statut IS DISTINCT FROM 'Annulé' THEN
        UPDATE endroit SET eve.presentiel.capacite = eve.presentiel.capacite - 1
        WHERE id_endroit = (
            SELECT id_endroit FROM evenement WHERE id_inscription = NEW.id_inscription
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_capacity_after_update
AFTER UPDATE OF statut ON inscription
FOR EACH ROW
EXECUTE FUNCTION update_endroit_capacity_after_update();





--Procédure pour annuler une inscription

CREATE OR REPLACE FUNCTION cancel_inscription(
    inscription_id INT
)
RETURNS VOID AS $$
DECLARE
    event_id INT;
BEGIN
    -- Obtenir l'ID de l'événement associé à l'inscription
    SELECT eve.evenement.id_evenement  INTO event_id FROM inscription WHERE id_Inscription = inscription_id;

    -- Annuler l'inscription
    DELETE FROM inscription WHERE id_Inscription = inscription_id;

    -- Mettre à jour la capacité disponible de l'endroit
    UPDATE endroit SET eve.presentiel.capacite = eve.presentiel.capacite + 1
    WHERE id_endroit = (SELECT id_Endroit FROM evenement WHERE id_evenement = event_id);
END;
$$ LANGUAGE plpgsql;

--mettre à jour la date_inscription dans la table inscription pour tous les participants inscrits à cet événement

CREATE OR REPLACE FUNCTION update_inscription_dates()
RETURNS TRIGGER AS $$
BEGIN
    -- Mise à jour de la date d'inscription pour toutes les inscriptions liées à l'événement modifié
    UPDATE inscription
    SET date_inscription = NEW.date_Debut
    WHERE id_inscription IN (
        SELECT id_inscription
        FROM evenement
        WHERE id_evenement = NEW.id_evenement
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_inscription_dates
BEFORE UPDATE ON evenement
FOR EACH ROW
WHEN (OLD.date_Debut IS DISTINCT FROM NEW.date_Debut)
EXECUTE FUNCTION update_inscription_dates();




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
