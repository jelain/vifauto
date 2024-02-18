<template>
  <div class="card-categorie-container">
    <div class="card">
      <img :src="`/categorie/${image_url}`" alt="" />
    </div>
    <div class="title">
      <h2>{{ nom }}</h2>
    </div>
    <PieceCategorie :categorie_id="id" />
  </div>
</template>

<script>
import PieceCategorie from "./PieceCategorie.vue";
export default {
  components: {
    PieceCategorie,
  },
  props: {
    id: Number,
    nom: String,
    image_url: String,
  },
};
</script>

<style lang="scss">
.card-categorie-container {
  .card {
    background-color: #e2e8f0;
    width: 11rem;
    height: 11rem;
    border-radius: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    img {
      width: 60%;
    }
  }
  .title {
    h2 {
      text-align: center;
      margin: 5px 0 10px;
      font-weight: 500;
    }
  }
}
</style>
