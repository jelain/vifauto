<template>
  <div class="marque-bar">
    <div class="logo">
      <img :src="'/fournisseur&marque/' + marque.image_url" alt="" />
    </div>
  </div>
  <div class="marque-detail">
    <h1>
      <span>{{ marque.nom }}</span> est vendu par
    </h1>

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
  data() {
    return {
      marqueId: null,
      fournisseurs: [],
      marque: [],
    };
  },
  components: {
    CardLogo,
  },
  mounted() {
    this.marqueId = parseInt(this.$route.params.id);
    this.fetchFournisseurs();
    axios
      .get(`http://localhost:3000/api/marque/id=${this.marqueId}`)
      .then((response) => {
        this.marque = response.data;
      })
      .catch((error) => {
        console.error(
          "Erreur lors de la récupération des informations de la marque",
          error
        );
      });
  },
  methods: {
    fetchFournisseurs() {
      axios
        .get(
          `http://localhost:3000/api/fournisseurs/marque/id=${this.marqueId}`
        )
        .then((response) => {
          this.fournisseurs = response.data;
        })
        .catch((error) => {
          console.error(
            "Erreur lors de la récupération des fournisseurs",
            error
          );
        });
    },
    navigateToDetails(fournisseurId) {
      const link = `/fournisseur/id=${fournisseurId}`;
      this.$router.push(link);
    },
  },
};
</script>

<style lang="scss">
.marque-bar {
  background-color: white;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  .logo {
    display: flex;
    align-items: center;
    margin: 15px 0;
    img {
      max-width: 150px;
      max-height: 50px;
    }
  }
}
.marque-detail {
  width: 60em;
  margin: 20px 0;
  h1 {
    font-weight: 600;
    margin: 30px 0;
    span {
      text-transform: uppercase;
    }
  }
  .container {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 20px;
  }
}
</style>
