const express = require("express");
const cors = require("cors");
const fournisseur_routes = require("./routes/FournisseurRoute");
const marque_routes = require("./routes/MarqueRoute");
const fournisseur_detail_routes = require("./routes/FournisseurDetailRoute");
const marque_detail_routes = require("./routes/MarqueDetailRoute");

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use("/api", fournisseur_routes);
app.use("/api", marque_routes);
app.use("/api", fournisseur_detail_routes);
app.use("/api", marque_detail_routes);

app.listen(port, () => {
  console.log(`Serveur démarré sur le port ${port}`);
});
