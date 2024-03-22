CREATE TABLE Categorie (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Piece (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    categorie_id INT,
    FOREIGN KEY (categorie_id) REFERENCES Categorie(id)
);

CREATE TABLE TempsReponse (
    id SERIAL PRIMARY KEY,
    accueil_comptoir INT,
    temps_service INT,
    rapidite_piece_comptoir INT,
    accueil_telephonique INT,
    commercial INT,
    gestion_retour INT,
    gestion_garantie INT,
    politique_interne INT,
    moyenne DOUBLE PRECISION
);

CREATE TABLE Fournisseur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    image_url VARCHAR(255),
    temps_reponse_id INT, -- Clé étrangère vers la table TempsReponse
    FOREIGN KEY (temps_reponse_id) REFERENCES TempsReponse(id)
);

CREATE TABLE Horaire (
    id SERIAL PRIMARY KEY,
    jour_semaine VARCHAR(10) NOT NULL,
    heure_ouverture TIME,
    heure_fermeture TIME,
    fournisseur_id INT, -- Clé étrangère vers la table Fournisseur
    FOREIGN KEY (fournisseur_id) REFERENCES Fournisseur(id)
);

CREATE TABLE Marque (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    image_url VARCHAR(255)
);

CREATE TABLE FournisseurMarque (
    id SERIAL PRIMARY KEY,
    fournisseur_id INT,
    marque_id INT,
    FOREIGN KEY (fournisseur_id) REFERENCES Fournisseur(id),
    FOREIGN KEY (marque_id) REFERENCES Marque(id)
);

-- Table de liaison entre Piece et Marque
CREATE TABLE PieceMarque (
    id SERIAL PRIMARY KEY,
    piece_id INT,
    marque_id INT,
    FOREIGN KEY (piece_id) REFERENCES Piece(id),
    FOREIGN KEY (marque_id) REFERENCES Marque(id)
);