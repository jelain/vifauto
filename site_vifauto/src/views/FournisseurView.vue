<template>
  <div class="fournisseur">
    <h1>Fournisseurs</h1>
    <div class="container">
      <CardLogo
        v-for="fournisseur in fournisseurs"
        :key="fournisseur.id"
        :nom="fournisseur.nom"
        :image_url="fournisseur.image_url"
        @click="navigateToDetails(fournisseur.id)"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import CardLogo from "../components/CardLogo.vue";
export default {
  components: {
    CardLogo,
  },
  data() {
    return {
      fournisseurs: [],
    };
  },

  methods: {
    navigateToDetails(fournisseurId) {
      const link = `/fournisseur/id=${fournisseurId}`;
      this.$router.push(link);
    },
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
};
</script>

<style lang="scss">
.fournisseur {
  width: 60em;
  margin: 20px 0;
  h1 {
    font-weight: 600;
    margin: 30px 0;
  }
  .container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
  }
}
</style>
