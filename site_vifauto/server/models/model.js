const { Pool } = require("pg");

const pool = new Pool({
  user: "jelain",
  database: "test_vifauto",
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
};

module.exports = dbModel;
