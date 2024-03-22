const express = require("express");
const fournisseur_detail = require("../controllers/FournisseurDetailController");

const router = express.Router();

router.get(
  "/fournisseurs/id=:fournisseurId",
  fournisseur_detail.getFournisseurById
);

router.get(
  "/categories/id=:fournisseurId",
  fournisseur_detail.getCategorieByFournisseurId
);

router.get(
  "/horaires/id=:fournisseurId",
  fournisseur_detail.getHorairesByFournisseurId
);

router.get(
  "/fournisseurs/id=:fournisseurId/categorie=:categorieId",
  fournisseur_detail.getPiecesMarqueByCategorieIdAndFournisseurId
);

router.put("/horaires/set/id=:jourId", fournisseur_detail.updateHoraire);

router.get(
  "/notes/id=:fournisseurId",
  fournisseur_detail.getNotesByFournisseurId
);

router.put("/notes/set/id=:fournisseurId", fournisseur_detail.updateNote);

module.exports = router;
