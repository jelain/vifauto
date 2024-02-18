import { createApp } from "vue";
import { createRouter, createWebHistory } from "vue-router";
import App from "./App.vue";
import FournisseurView from "./views/FournisseurView.vue";
import MarqueView from "./views/MarqueView.vue";
import FournisseurDetail from "./views/FournisseurDetailView.vue";

const routes = [
  { path: "/:pathMatch(.*)*", redirect: "/fournisseur" },
  { path: "/fournisseur", component: FournisseurView },
  { path: "/marque", component: MarqueView },
  { path: "/fournisseur/id=:id", component: FournisseurDetail },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

createApp(App).use(router).mount("#app");
