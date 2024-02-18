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
        <div class="horaire" v-show="showHoraire">
          <table>
            <tr v-for="jour in horaires" :key="jour">
              <td class="jour">{{ jour.jour_semaine }}</td>
              <td class="heures">
                <template v-if="editMode[jour.id]">
                  <input type="time" v-model="newOuvertue[jour.id]" />
                  -
                  <input type="time" v-model="newFermeture[jour.id]" />
                  <i
                    class="fa-solid fa-pen"
                    @click="saveAndToggle(jour.id)"
                  ></i>
                </template>
                <template v-else>
                  {{
                    jour.heure_ouverture
                      ? jour.heure_ouverture.slice(0, 5)
                      : "Non renseigné"
                  }}
                  -
                  {{
                    jour.heure_fermeture
                      ? jour.heure_fermeture.slice(0, 5)
                      : "Non renseigné"
                  }}
                  <i
                    class="fa-solid fa-pen"
                    @click="toggleEditMode(jour.id)"
                  ></i>
                </template>
              </td>
            </tr>
          </table>
        </div>
        <p :class="{ active: showNote }" @click="toggleNote()">
          Temps de reponse : 20/20
        </p>
        <div class="note" v-show="showNote">
          <table>
            <tr>
              <td class="critere">Critère 1</td>
              <td class="note">20/20</td>
            </tr>
            <tr>
              <td class="critere">Critère 2</td>
              <td class="note">18/20</td>
            </tr>
            <tr>
              <td class="critere">Critère 3</td>
              <td class="note">15/20</td>
            </tr>
            <tr>
              <td class="critere">Critère 4</td>
              <td class="note">17/20</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      fournisseur: [],
      horaires: [],
      showHoraire: false,
      showNote: false,
      editMode: {}, // Nouvelle propriété pour gérer l'édition des horaires
      newOuvertue: {}, // Nouvelle propriété
      newFermeture: {},
    };
  },
  mounted() {
    this.fournisseurId = parseInt(this.$route.params.id);
    // Appel de la fonction pour récupérer les informations du fournisseur lors du montage du composant
    this.getFournisseur();
    this.getHoraires();
  },
  methods: {
    toggleHoraire() {
      this.showHoraire = !this.showHoraire;
      this.showNote = false;
    },
    toggleNote() {
      this.showNote = !this.showNote;
      this.showHoraire = false;
    },

    saveAndToggle(jourId) {
      this.saveEdit(jourId)
        .then(() => {
          // Mettre à jour localement les valeurs des horaires
          const index = this.horaires.findIndex((jour) => jour.id === jourId);
          if (index !== -1) {
            this.horaires[index].heure_ouverture = this.newOuvertue[jourId];
            this.horaires[index].heure_fermeture = this.newFermeture[jourId];
          }
        })
        .finally(() => {
          // Toggle edit mode après la sauvegarde
          this.toggleEditMode(jourId);
        });
    },

    toggleEditMode(jourId) {
      this.editMode[jourId] = !this.editMode[jourId];
      // Initialiser la valeur éditée avec la valeur actuelle de l'horaire
      console.log(this.newOuvertue[jourId]);
      console.log(this.newFermeture[jourId]);
    },

    async saveEdit(jourId) {
      try {
        const response = await axios.put(
          `http://localhost:3000/api/horaires/set/id=${jourId}`,
          {
            heureOuverture: this.newOuvertue[jourId],
            heureFermeture: this.newFermeture[jourId],
            jourId: jourId,
            fournisseurId: this.fournisseurId,
          }
        );

        console.log(response.data); // Si vous voulez afficher la réponse
        // Mettre à jour l'affichage si nécessaire
      } catch (error) {
        console.error("Error updating horaire:", error);
      }
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
  },
  watch: {
    $route() {
      this.fournisseurId = parseInt(this.$route.params.id);
      this.getFournisseur();
      this.getHoraires();
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
      .horaire {
        display: flex;
        justify-content: right;
        .jour {
          text-align: right;
          padding-right: 10px;
        }
        .heures {
          i {
            margin-left: 8px;
            font-size: 0.8rem;
          }
          i:hover {
            cursor: pointer;
          }
        }
      }
      .note {
        display: flex;
        justify-content: right;
        .critere {
          padding-right: 10px;
        }
      }
    }
    .info > *:nth-child(3) {
      margin-top: 10px;
    }
  }
}
</style>
