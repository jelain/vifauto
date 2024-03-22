const express = require("express");
const marque_detail = require("../controllers/MarqueDetailController");

const router = express.Router();

router.get(
  "/fournisseurs/marque/id=:marqueId",
  marque_detail.getFournisseurByMarque
);
router.get("/marque/id=:marqueId", marque_detail.getMarqueById);

module.exports = router;
