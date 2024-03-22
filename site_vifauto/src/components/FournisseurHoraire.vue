<template>
  <div class="fournisseurhoraire">
    <div class="horaire">
      <table>
        <tr v-for="jour in horaires" :key="jour">
          <td class="jour">{{ jour.jour_semaine }}</td>
          <td class="heures">
            <template v-if="editMode[jour.id]">
              <input type="time" v-model="newOuvertue[jour.id]" />
              -
              <input type="time" v-model="newFermeture[jour.id]" />
              <i class="fa-solid fa-pen" @click="saveAndToggle(jour.id)"></i>
            </template>
            <template v-else>
              {{
                jour.heure_ouverture == "00:00:00" &&
                jour.heure_fermeture == "00:00:00"
                  ? "Fermé"
                  : (jour.heure_ouverture
                      ? jour.heure_ouverture.slice(0, 5)
                      : "Non renseigné") +
                    " - " +
                    (jour.heure_fermeture
                      ? jour.heure_fermeture.slice(0, 5)
                      : "Non renseigné")
              }}
              <i class="fa-solid fa-pen" @click="toggleEditMode(jour.id)"></i>
            </template>
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      editMode: {}, // Nouvelle propriété pour gérer l'édition des horaires
      newOuvertue: {}, // Nouvelle propriété
      newFermeture: {},
      localHoraires: [],
    };
  },
  props: {
    horaires: Array,
  },
  mounted() {
    this.fournisseurId = parseInt(this.$route.params.id);
  },
  methods: {
    saveAndToggle(jourId) {
      this.localHoraires = this.horaires;
      this.saveEdit(jourId);
      this.toggleEditMode(jourId);
    },

    toggleEditMode(jourId) {
      this.editMode[jourId] = !this.editMode[jourId];
    },

    async saveEdit(jourId) {
      try {
        await axios.put(`http://localhost:3000/api/horaires/set/id=${jourId}`, {
          heureOuverture: this.newOuvertue[jourId],
          heureFermeture: this.newFermeture[jourId],
          jourId: jourId,
          fournisseurId: this.fournisseurId,
        });
      } catch (error) {
        console.error("Error updating horaire:", error);
      }
      this.$emit("save_horaire_done");
    },
  },

  watch: {
    $route() {
      this.fournisseurId = parseInt(this.$route.params.id);
    },
  },
};
</script>

<style lang="scss">
.fournisseurhoraire {
  .horaire {
    display: flex;
    justify-content: right;
    .jour {
      text-align: right;
      padding-right: 10px;
    }
  }
}
</style>
