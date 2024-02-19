const express = require("express");
const categorie_controller = require("../controllers/FournisseurDetailController");

const router = express.Router();

router.get(
  "/fournisseurs/id=:fournisseurId",
  categorie_controller.getFournisseurById
);

router.get(
  "/categories/id=:fournisseurId",
  categorie_controller.getCategorieByFournisseurId
);

router.get(
  "/horaires/id=:fournisseurId",
  categorie_controller.getHorairesByFournisseurId
);

router.get(
  "/fournisseurs/id=:fournisseurId/categorie=:categorieId",
  categorie_controller.getPiecesMarqueByCategorieIdAndFournisseurId
);

router.put("/horaires/set/id=:jourId", categorie_controller.updateHoraire);

router.get(
  "/notes/id=:fournisseurId",
  categorie_controller.getNotesByFournisseurId
);

module.exports = router;
