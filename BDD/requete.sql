/* Afficher les informations d'une marque grace a un fournisseur*/
SELECT Marque.*
FROM Marque
JOIN FournisseurMarque ON Marque.id = FournisseurMarque.marque_id
WHERE FournisseurMarque.fournisseur_id = (
    SELECT id
    FROM Fournisseur
    WHERE nom = 'NomFournisseur'
);

/* Afficher les informations d'une marque grace a un fournisseur*/


/* Recuperer un tableau qui contient comme cle les categories et les piece en valeurs*/
SELECT
    Categorie.nom AS categorie,
    ARRAY_AGG(Piece.nom) AS pieces
FROM
    Categorie
LEFT JOIN
    Piece ON Categorie.id = Piece.categorie_id
GROUP BY
    Categorie.nom, Categorie.id;


/* Recuperer les marques dun fournisseur et dans une categorie precise */
SELECT DISTINCT M.*
FROM Marque M
JOIN FournisseurMarque FM ON M.id = FM.marque_id
JOIN Fournisseur F ON FM.fournisseur_id = F.id
JOIN PieceMarque PM ON M.id = PM.marque_id
JOIN Piece P ON PM.piece_id = P.id
JOIN Categorie C ON P.categorie_id = C.id
WHERE F.nom = 'NomFournisseur' AND C.nom = 'NomCategorie';

/*Avoir l'ID d'une marque*/
SELECT id
FROM Marque
WHERE nom = 'NomMarque';



