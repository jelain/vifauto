<template>
  <FournisseurInfoBar />
  <!--<h1>ID: {{ $route.params.id }}</h1> -->

  <div class="fournisseur-detail">
    <h1>Categorie</h1>
    <div class="container">
      <CardCategorie
        v-for="categorie in categories"
        :key="categorie.id"
        :id="categorie.id"
        :nom="categorie.nom"
        :image_url="categorie.image_url"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import FournisseurInfoBar from "@/components/FournisseurInfoBar.vue";
import CardCategorie from "@/components/CardCategorie.vue";
export default {
  components: {
    FournisseurInfoBar,
    CardCategorie,
  },
  data() {
    return {
      categories: [],
      fournisseurId: null,
    };
  },
  mounted() {
    this.fournisseurId = parseInt(this.$route.params.id);
    this.fetchCategories();
  },
  methods: {
    fetchCategories() {
      if (!isNaN(this.fournisseurId)) {
        axios
          .get(`http://localhost:3000/api/categories/id=${this.fournisseurId}`)
          .then((response) => {
            this.categories = response.data;
          })
          .catch((error) => {
            console.error("Error fetching categories:", error);
          });
      } else {
        console.error("Invalid fournisseur ID:", this.$route.params.id);
      }
    },
  },
  watch: {
    $route() {
      this.fournisseurId = parseInt(this.$route.params.id);
      this.fetchCategories();
    },
  },
};
</script>

<style lang="scss">
.fournisseur-detail {
  width: 60em;
  margin: 20px 0;
  h1 {
    font-weight: 600;
    margin: 30px 0;
  }
  .container {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 20px;
  }
}
</style>
