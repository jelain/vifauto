<template>
  <div class="fournisseurbar">
    <div class="content">
      <div
        v-for="(fournisseur, index) in fournisseurs"
        :key="fournisseur.id"
        class="container"
      >
        <!-- Boucle v-for pour les images -->
        <div class="image">
          <img
            :src="getImageUrl(fournisseur.image_url)"
            :alt="fournisseur.nom"
          />
        </div>
        <!-- Ajout de la div sep après chaque image, sauf la dernière -->
        <div class="sep" v-if="index < fournisseurs.length - 1"></div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      fournisseurs: [],
    };
  },
  mounted() {
    axios
      .get("http://localhost:3000/api/fournisseurs")
      .then((response) => {
        this.fournisseurs = response.data;
      })
      .catch((error) => {
        console.error("Erreur lors de la récupération des fournisseurs", error);
      });
  },
  methods: {
    getImageUrl(url) {
      // Assumez que vos images sont dans le dossier public/fournisseur
      return `/fournisseur/${url}`;
    },
  },
};
</script>

<style lang="scss">
.fournisseurbar {
  width: 100%;
  height: 4rem;
  background-color: #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  .content {
    display: flex;
    width: 85em;
    justify-content: space-between;
    align-items: center;
    justify-content: center;
    .container {
      display: flex;
      justify-content: center;
      align-items: center;

      .image {
        height: 4rem;
        display: flex;
        align-items: center;
        padding: 0 20px;
        img {
          max-height: 40px;
          max-width: 120px;
        }
      }
      .image:hover {
        background-color: #cbd5e1;
        cursor: pointer;
      }
      .sep {
        height: 3rem;
        width: 2px;
        background-color: #cbd5e1;
        border-radius: 20px;
        margin: 0 -2px;
      }
    }
  }
}
</style>
