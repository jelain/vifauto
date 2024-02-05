const dbModel = require('../models/model');

module.exports = {
  getMarques: async (req, res) => {
    try {
      const marques = await dbModel.getAllMarques();
      res.json(marques);
    } catch (error) {
      console.error('Erreur lors de la récupération des marques', error);
      res.status(500).send('Erreur serveur');
    }
  },
  // Ajoutez d'autres méthodes pour d'autres routes si nécessaire
};
