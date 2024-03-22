<template>
  <div
    class="pieces"
    v-for="(piece, i) in pieces"
    :key="i"
    :class="{ piecesactive: showMarque[i] }"
  >
    <p @click="toggleMarque(i)">{{ piece["nom"] }}</p>
    <div class="marques" v-if="showMarque[i]">
      <img
        v-for="marque in piece['marques_info']"
        :src="`/fournisseur&marque/${marque[image_url]}`"
        :alt="marque[nom]"
        :key="marque[id]"
        @click="navigateToDetails(marque[id])"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: {
    categorie_id: Number,
  },
  data() {
    return {
      pieces: {},
      id: 0,
      nom: 1,
      image_url: 2,
      showMarque: {},
    };
  },
  mounted() {
    this.fournisseurId = parseInt(this.$route.params.id);
    this.fetchPiecesAndMarques();
  },
  methods: {
    async fetchPiecesAndMarques() {
      try {
        const response = await axios.get(
          `http://localhost:3000/api/fournisseurs/id=${this.fournisseurId}/categorie=${this.categorie_id}`
        );
        this.pieces = response.data;
      } catch (error) {
        console.error("Error fetching pieces and marques:", error);
      }
    },
    toggleMarque(i) {
      this.showMarque[i] = !this.showMarque[i];
    },
    navigateToDetails(marqueId) {
      const link = `/marque/id=${marqueId}`;
      this.$router.push(link);
    },
  },
};
</script>

<style lang="scss">
.pieces {
  margin: 10px 0;
  p {
    margin: 0;
    padding: 5px;
  }
  p:hover {
    cursor: pointer;
  }
  .marques {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 10px;
    width: 90%;
    margin: 0 auto;
    padding: 10px;
    img {
      width: 4rem;
      justify-self: center;
      align-self: center;
    }
    img:hover {
      cursor: pointer;
    }
  }
}
.piecesactive {
  background-color: #e2e8f0;
  border-radius: 10px;
}
</style>
