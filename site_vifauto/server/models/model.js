const { Pool } = require("pg");

const pool = new Pool({
  user: "jelain",
  database: "vifauto",
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
};

module.exports = dbModel;
