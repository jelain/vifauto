const dbModel = require("../models/model");

module.exports = {
  getCategorieByFournisseurId: async (req, res) => {
    const { fournisseurId } = req.params;
    try {
      const categories = await dbModel.getCategorieByFournisseurId(
        fournisseurId
      );
      res.json(categories);
    } catch (error) {
      res.status(500).json({
        error:
          "Une erreur s'est produite lors de la récupération des catégories.",
      });
    }
  },
  getPiecesMarqueByCategorieIdAndFournisseurId: async (req, res) => {
    const { categorieId, fournisseurId } = req.params;
    try {
      const pieces_marques =
        await dbModel.getPiecesMarqueByCategorieIdAndFournisseurId(
          categorieId,
          fournisseurId
        );
      res.json(pieces_marques);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  },
  getFournisseurById: async (req, res) => {
    const { fournisseurId } = req.params;

    try {
      const fournisseur = await dbModel.getFournisseurById(fournisseurId);
      if (!fournisseur) {
        return res.status(404).json({ error: "Fournisseur not found" });
      }
      res.json(fournisseur);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Internal server error" });
    }
  },
  getHorairesByFournisseurId: async (req, res) => {
    const { fournisseurId } = req.params;
    try {
      const horaires = await dbModel.getHorairesByFournisseurId(fournisseurId);
      res.json(horaires);
    } catch (error) {
      res.status(500).json({
        error:
          "Une erreur s'est produite lors de la récupération des horaires.",
      });
    }
  },

  updateHoraire: async (req, res) => {
    const { jourId } = req.params;
    const { heureOuverture, heureFermeture, fournisseurId } = req.body;

    try {
      await dbModel.updateHoraire(
        jourId,
        heureOuverture,
        heureFermeture,
        fournisseurId
      );

      return res.status(200).json({ message: "Horaire updated successfully" });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error: "Internal server error" });
    }
  },
};
