const express = require("express");
const fournisseur_controller = require("../controllers/FournisseurController");

const router = express.Router();

router.get("/fournisseurs", fournisseur_controller.getFournisseurs);

module.exports = router;
