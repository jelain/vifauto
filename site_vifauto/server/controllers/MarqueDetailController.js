const dbModel = require("../models/model");

module.exports = {
  getFournisseurByMarque: async (req, res) => {
    try {
      // Extraire l'ID de la marque de la requête
      const { marqueId } = req.params; // Assurez-vous que le paramètre de route est bien nommé "marqueId"

      // Appeler la fonction pour récupérer les fournisseurs associés à cette marque
      const fournisseurs = await dbModel.getFournisseurByMarqueId(marqueId);

      res.json(fournisseurs);
    } catch (error) {
      console.error("Erreur lors de la récupération des fournisseurs", error);
      res.status(500).send("Erreur serveur");
    }
  },

  getMarqueById: async (req, res) => {
    const { marqueId } = req.params;

    try {
      const marque = await dbModel.getMarqueById(marqueId);
      if (!marque) {
        return res.status(404).json({ error: "Fournisseur not found" });
      }
      res.json(marque);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Internal server error" });
    }
  },
};
