const express = require('express');
const marque_controller = require('../controllers/MarqueController');

const router = express.Router();

router.get('/marques', marque_controller.getMarques);

module.exports = router;
