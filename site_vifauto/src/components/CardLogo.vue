<template>
  <div class="card-container">
    <img :src="getImageUrl(image_url)" :alt="nom" />
  </div>
</template>

<script>
export default {
  props: {
    nom: String,
    image_url: String,
  },
  methods: {
    getImageUrl(url) {
      const basePath = "/fournisseur&marque/";
      return `${basePath}${url}`;
    },
  },
};
</script>

<style lang="scss">
.card-container {
  background-color: #e2e8f0;
  width: 14rem;
  height: 150px;
  border-radius: 10px;
  display: flex;
  justify-content: center;
  align-items: center;
  img {
    max-width: 60%;
    max-height: 50%;
  }
}
.card-container:hover {
  background-color: #cbd5e1;
  cursor: pointer;
}
</style>
