const dbModel = require('../models/model');

module.exports = {
  getFournisseurs: async (req, res) => {
    try {
      const fournisseurs = await dbModel.getAllFournisseurs();
      res.json(fournisseurs);
    } catch (error) {
      console.error('Erreur lors de la récupération des fournisseurs', error);
      res.status(500).send('Erreur serveur');
    }
  },
  // Ajoutez d'autres méthodes pour d'autres routes si nécessaire
};
