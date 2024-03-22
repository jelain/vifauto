const { Pool } = require("pg");

const pool = new Pool({
  user: "jelain",
  database: "vifautov2",
  password: "28Juin1978",
});

const dbModel = {
  getAllFournisseurs: async () => {
    const query = "SELECT * FROM fournisseur ORDER BY nom";
    const { rows } = await pool.query(query);
    return rows;
  },
  getAllMarques: async () => {
    const query = "SELECT * FROM marque ORDER BY nom";
    const { rows } = await pool.query(query);
    return rows;
  },

  getCategorieByFournisseurId: async (fournisseurId) => {
    const query = {
      text: `
      SELECT DISTINCT
      c.id AS id,
      c.nom AS nom,
      c.image_url AS image_url
      FROM
      Categorie c
      JOIN Piece p ON c.id = p.categorie_id
      WHERE
      p.id IN (
          SELECT DISTINCT pm.piece_id
          FROM PieceMarque pm
          JOIN FournisseurMarque fm ON pm.marque_id = fm.marque_id
          WHERE fm.fournisseur_id = $1
      )
      ORDER BY
      c.nom;
      `,
      values: [fournisseurId],
    };

    const result = await pool.query(query);
    return result.rows;
  },

  getPiecesMarqueByCategorieIdAndFournisseurId: async (
    categoryId,
    fournisseurId
  ) => {
    const query = `
    SELECT DISTINCT
    P.*,
    ARRAY_AGG(DISTINCT ARRAY[CAST(M.id AS TEXT), M.nom, M.image_url]) AS marques_info
    FROM
    Piece P
    JOIN PieceMarque PM ON P.id = PM.piece_id
    JOIN Marque M ON PM.marque_id = M.id
    JOIN FournisseurMarque FM ON M.id = FM.marque_id
    WHERE
    P.categorie_id = $1
    AND FM.fournisseur_id = $2
    GROUP BY
    P.id;
    `;
    const { rows } = await pool.query(query, [categoryId, fournisseurId]);
    return rows;
  },
  getFournisseurById: async (fournisseurId) => {
    const query = "SELECT * FROM fournisseur WHERE id = $1";
    const { rows } = await pool.query(query, [fournisseurId]);
    return rows[0]; // Retourne le premier résultat trouvé
  },

  getMarqueById: async (marqueId) => {
    const query = "SELECT * FROM marque WHERE id = $1";
    const { rows } = await pool.query(query, [marqueId]);
    return rows[0]; // Retourne le premier résultat trouvé
  },

  getHorairesByFournisseurId: async (fournisseurId) => {
    const query = "SELECT * FROM horaire WHERE fournisseur_id = $1 ORDER BY id";
    const { rows } = await pool.query(query, [fournisseurId]);
    return rows;
  },

  updateHoraire: async (
    jourId,
    heureOuverture,
    heureFermeture,
    fournisseurId
  ) => {
    try {
      const query = `
        UPDATE horaire
        SET heure_ouverture = $2, heure_fermeture = $3
        WHERE id = $1 AND fournisseur_id = $4
      `;
      await pool.query(query, [
        jourId,
        heureOuverture,
        heureFermeture,
        fournisseurId,
      ]);
    } catch (error) {
      throw new Error(`Error updating horaire: ${error.message}`);
    }
  },

  getNotesByFournisseurId: async (fournisseurId) => {
    const query = "SELECT * FROM tempsreponse WHERE id = $1";
    const { rows } = await pool.query(query, [fournisseurId]);
    return rows;
  },

  updateNote: async (fournisseurId, critereNom, newNote) => {
    try {
      // Validez que critereNom est un nom de colonne autorisé pour éviter les attaques par injection SQL
      const colonnesAutorisees = [
        "accueil_comptoir",
        "temps_service",
        "rapidite_piece_comptoir",
        "accueil_telephonique",
        "commercial",
        "gestion_retour",
        "gestion_garantie",
        "politique_interne",
      ];
      if (!colonnesAutorisees.includes(critereNom)) {
        throw new Error(`Le critère spécifié n'est pas valide.`);
      }

      const query = `
        UPDATE TempsReponse
        SET ${critereNom} = $1
        WHERE id = $2
      `;
      await pool.query(query, [newNote, fournisseurId]);
    } catch (error) {
      throw new Error(`Error updating note: ${error.message}`);
    }
  },
  getFournisseurByMarqueId: async (marqueId) => {
    const query = {
      text: `
      SELECT f.id, f.nom, f.image_url, f.temps_reponse_id
      FROM Fournisseur f
      INNER JOIN FournisseurMarque fm ON f.id = fm.fournisseur_id
      INNER JOIN Marque m ON fm.marque_id = m.id
      WHERE m.id = $1
      `,
      values: [marqueId],
    };

    const result = await pool.query(query);
    return result.rows;
  },
};
module.exports = dbModel;
