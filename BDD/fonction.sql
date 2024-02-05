CREATE OR REPLACE FUNCTION calculer_moyenne()
RETURNS TRIGGER AS $$
DECLARE
    param_count INTEGER;
BEGIN
    -- Compter le nombre de paramètres non nuls
    param_count := 0;
    IF NEW.parametre1 IS NOT NULL THEN
        param_count := param_count + 1;
    END IF;
    IF NEW.parametre2 IS NOT NULL THEN
        param_count := param_count + 1;
    END IF;
    IF NEW.parametre3 IS NOT NULL THEN
        param_count := param_count + 1;
    END IF;

    -- Éviter une division par zéro
    IF param_count > 0 THEN
        NEW.moyenne := (NEW.parametre1 + NEW.parametre2 + NEW.parametre3) / param_count;
    ELSE
        NEW.moyenne := NULL;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_update_tempsreponse
BEFORE INSERT OR UPDATE ON TempsReponse
FOR EACH ROW EXECUTE FUNCTION calculer_moyenne();

--------------------------------------------------------------------------------------------

-- Fonction pour gérer l'insertion d'un nouveau fournisseur avec temps_reponse_id NULL
CREATE OR REPLACE FUNCTION gestion_insertion_fournisseur()
RETURNS TRIGGER AS $$
DECLARE
    nouveau_temps_reponse_id INT;
BEGIN
    -- Vérifier si temps_reponse_id est NULL
    IF NEW.temps_reponse_id IS NULL THEN
        -- Insérer une nouvelle ligne dans la table TempsReponse avec des paramètres NULL
        INSERT INTO TempsReponse (parametre1, parametre2, parametre3, moyenne)
        VALUES (NULL, NULL, NULL, NULL)
        RETURNING id INTO nouveau_temps_reponse_id;

        -- Mettre l'ID du nouveau TempsReponse dans temps_reponse_id du fournisseur
        NEW.temps_reponse_id := nouveau_temps_reponse_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Déclencheur pour gérer l'insertion d'un nouveau fournisseur
CREATE TRIGGER before_insert_fournisseur
BEFORE INSERT ON Fournisseur
FOR EACH ROW EXECUTE FUNCTION gestion_insertion_fournisseur();

---------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION gestion_insertion_fournisseur_horaire()
RETURNS TRIGGER AS $$
DECLARE
    nouveau_horaire_id INT;
    jours_semaine VARCHAR[] := ARRAY['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'];
    jour_actuel VARCHAR;
    jours_semaine_count INT;
BEGIN
    -- Obtenir la longueur du tableau jours_semaine
    jours_semaine_count := array_length(jours_semaine, 1);

    -- Pour chaque jour de la semaine
    FOR i IN 1..jours_semaine_count
    LOOP
        -- Récupérer le jour actuel
        jour_actuel := jours_semaine[i];

        -- Insérer une nouvelle ligne dans la table Horaire avec des horaires NULL pour le jour actuel
        INSERT INTO Horaire (jour_semaine, heure_ouverture, heure_fermeture, fournisseur_id)
        VALUES (jour_actuel, NULL, NULL, NEW.id)
        RETURNING id INTO nouveau_horaire_id;
    END LOOP;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Déclencheur pour gérer l'insertion d'un nouveau fournisseur
CREATE TRIGGER before_insert_fournisseur_horaire
AFTER INSERT ON Fournisseur
FOR EACH ROW EXECUTE FUNCTION gestion_insertion_fournisseur_horaire();
