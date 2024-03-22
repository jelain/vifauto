<template>
  <div class="info-bar">
    <div class="container">
      <div class="logo">
        <img
          v-if="fournisseur.image_url"
          :src="`/fournisseur/${fournisseur.image_url}`"
          :alt="fournisseur.nom"
        />
      </div>
      <div class="info">
        <p :class="{ active: showHoraire }" @click="toggleHoraire()">
          Horaires d'ouverture et de fermeture
        </p>
        <FournisseurHoraire
          v-show="showHoraire"
          :horaires="horaires"
          @save_horaire_done="getHoraires"
        />
        <p :class="{ active: showNote }" @click="toggleNote()">
          Temps de reponse :
          <span :class="getNoteColor(notes.moyenne)">
            {{ notes.moyenne ? notes.moyenne + "/20" : "Non renseigné" }}
          </span>
        </p>
        <FournisseurTempsReponse
          v-show="showNote"
          :fournisseurId="fournisseurId"
          :notes="notes"
          :getNoteColor="getNoteColor"
          @save_note_done="getNotes"
        />
      </div>
    </div>
  </div>
</template>

<script>
import FournisseurHoraire from "./FournisseurHoraire.vue";
import FournisseurTempsReponse from "./FournisseurTempsReponse.vue";
import axios from "axios";
export default {
  components: {
    FournisseurHoraire,
    FournisseurTempsReponse,
  },
  data() {
    return {
      horaires: [],
      fournisseur: [],
      notes: [],
      showHoraire: false,
      showNote: false,
    };
  },
  mounted() {
    this.fournisseurId = parseInt(this.$route.params.id);
    // Appel de la fonction pour récupérer les informations du fournisseur lors du montage du composant
    this.getFournisseur();
    this.getHoraires();
    this.getNotes();
  },
  methods: {
    getNoteColor(note) {
      // Déterminer la couleur en fonction de la note
      if (note !== null) {
        if (note >= 15) {
          return "green"; // Vert pour une note de 15 ou plus
        } else if (note >= 10) {
          return "orange"; // Orange pour une note entre 10 et 14
        } else {
          return "red"; // Rouge pour une note de moins de 10
        }
      }
    },
    toggleHoraire() {
      this.showHoraire = !this.showHoraire;
      this.showNote = false;
    },
    toggleNote() {
      this.showNote = !this.showNote;
      this.showHoraire = false;
    },

    async getFournisseur() {
      try {
        const response = await axios.get(
          `http://localhost:3000/api/fournisseurs/id=${this.fournisseurId}`
        ); // Remplacez l'URL par celle de votre API
        this.fournisseur = response.data;
      } catch (error) {
        console.error("Error fetching fournisseur:", error);
      }
    },
    async getHoraires() {
      try {
        const response = await axios.get(
          `http://localhost:3000/api/horaires/id=${this.fournisseurId}`
        ); // Remplacez l'URL par celle de votre API
        this.horaires = response.data;
      } catch (error) {
        console.error("Error fetching horaires:", error);
      }
    },
    async getNotes() {
      try {
        const response = await axios.get(
          `http://localhost:3000/api/notes/id=${this.fournisseurId}`
        );
        this.notes = response.data[0];
        console.log(this.notes);
      } catch (error) {
        console.error("Error fetching notes:", error);
      }
    },
  },
  watch: {
    $route() {
      this.fournisseurId = parseInt(this.$route.params.id);
      this.getFournisseur();
      this.getHoraires();
      this.getNotes();
    },
  },
};
</script>

<style lang="scss">
.info-bar {
  display: flex;
  justify-content: center;
  background-color: white;
  width: 100%;
  .container {
    display: flex;
    justify-content: space-between;
    margin: 15px 0;
    width: 57em;
    .logo {
      height: 60px;
      display: flex;
      align-items: center;
      img {
        max-width: 150px;
        max-height: 50px;
      }
    }
    .info {
      display: flex;
      flex-direction: column;
      justify-content: center;
      p {
        text-align: right;
        font-weight: 400;
        margin: 3px;
      }
      p:hover {
        cursor: pointer;
      }
      .active {
        font-weight: 500;
      }
      .heures,
      .notes {
        i {
          margin-left: 8px;
          font-size: 0.8rem;
        }
        i:hover {
          cursor: pointer;
        }
      }
      .info > *:nth-child(3) {
        margin-top: 10px;
      }
      .green {
        color: #37be6b;
      }
      .orange {
        color: #e68009;
      }
      .red {
        color: #dd2d26;
      }
    }
  }
}
</style>
