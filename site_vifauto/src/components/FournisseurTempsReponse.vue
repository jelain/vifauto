<template>
  <div class="fournisseurtempsreponse">
    <div class="notes">
      <table>
        <tr v-for="(value, key) in critereNote" :key="key">
          <td class="critere">{{ formatKey(key) }}</td>
          <td class="note">
            <template v-if="editMode[key]">
              <input type="number" v-model="newNote[key]" /> /20
              <i class="fa-solid fa-pen" @click="saveAndToggle(key)"></i>
            </template>
            <template v-else>
              <div :class="getNoteColor(value)">
                {{ value !== null ? value + "/20" : "Non renseigné" }}
              </div>
              <i class="fa-solid fa-pen" @click="toggleEditMode(key)"></i>
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
      editMode: {},
      localNotes: [],
      newNote: [],
    };
  },
  props: {
    fournisseurId: Number,
    notes: Array,
    getNoteColor: {
      type: Function, // Assurez-vous de définir le type de prop correctement
      required: true,
    },
  },
  computed: {
    critereNote() {
      // Filtrer le tableau 'notes' pour exclure le premier et le dernier élément
      const critereNote = {};
      const keys = Object.keys(this.notes);
      for (let i = 1; i < keys.length - 1; i++) {
        critereNote[keys[i]] = this.notes[keys[i]];
      }
      return critereNote;
    },
  },
  methods: {
    formatKey(key) {
      // Transformer la clé en remplaçant les underscores par des espaces et capitalisant chaque mot
      return key.replace(/_/g, " ").replace(/^\w/, (c) => c.toUpperCase());
    },
    toggleEditMode(value) {
      this.editMode[value] = !this.editMode[value];
    },
    saveAndToggle(value) {
      this.saveEdit(value);
      this.toggleEditMode(value);
    },

    async saveEdit(value) {
      try {
        await axios.put(
          `http://localhost:3000/api/notes/set/id=${this.fournisseurId}`,
          {
            newNote: this.newNote[value],
            critereNom: value,
          }
        );
      } catch (error) {
        console.error("Error updating note:", error);
      }
      this.$emit("save_note_done");
    },
  },
};
</script>

<style lang="scss">
.notes {
  display: flex;
  justify-content: right;
  .critere {
    padding-right: 10px;
  }
  .note {
    max-width: 10em;
    display: flex;
    align-items: center;
    input {
      width: 2.5em;
    }
  }
}
</style>
