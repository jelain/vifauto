<template>
  <div class="marque">
    <div class="title_container">
      <h1>Marques</h1>
      <SearchBar v-model="search_value" />
    </div>
    <div class="container">
      <CardLogo
        v-for="marque in filteredMarques"
        :key="marque.id"
        :nom="marque.nom"
        :image_url="marque.image_url"
        :marques="marques"
        @click="navigateToDetails(marque.id)"
      />
    </div>
    <div
      class="message"
      v-if="filteredMarques.length == 0 && search_value !== ''"
    >
      <p>{{ message }}</p>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import CardLogo from "../components/CardLogo.vue";
import SearchBar from "../components/SearchBar.vue";
export default {
  components: {
    CardLogo,
    SearchBar,
  },

  data() {
    return {
      marques: [],
      search_value: "",
      message: "Aucune marque ne correspond à votre recherche",
    };
  },

  computed: {
    filteredMarques() {
      if (this.search_value === "") {
        return this.marques;
      }

      let search_valuelower = this.search_value.toLowerCase();
      const filtered_marques = this.marques.filter((marque) =>
        marque.nom.toLowerCase().startsWith(search_valuelower)
      );

      return filtered_marques;
    },
  },

  mounted() {
    axios
      .get("http://localhost:3000/api/marques")
      .then((response) => {
        this.marques = response.data;
        this.showContainer = true;
      })
      .catch((error) => {
        console.error("Erreur lors de la récupération des marques", error);
      });
  },
  methods: {
    navigateToDetails(marqueId) {
      const link = `/marque/id=${marqueId}`;
      this.$router.push(link);
    },
  },
};
</script>

<style lang="scss">
.marque {
  width: 60em;
  margin: 20px 0;
  h1 {
    font-weight: 600;
    margin: 30px 0;
  }
  .title_container {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .container {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
  }
  .message {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50vh;
    p {
      font-weight: 500;
    }
  }
}
</style>
