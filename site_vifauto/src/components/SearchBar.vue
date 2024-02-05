<template>
  <div class="search-container">
    <i class="fa-solid fa-magnifying-glass"></i>
    <input
      type="text"
      placeholder="Rechercher une marque"
      v-model="search_data"
    />
  </div>
</template>

<script>
import { ref, watch } from "vue";

export default {
  props: ["modelValue"],
  emits: ["update:modelValue"],

  setup(props, { emit }) {
    const search_data = ref(props.modelValue);

    watch(search_data, (new_val) => {
      emit("update:modelValue", new_val);
    });

    return { search_data };
  },
};
</script>

<style lang="scss">
.search-container {
  background-color: white;
  height: 40px;
  width: 250px;
  padding: 2px 15px;
  border-radius: 15px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
    0 2px 4px -2px rgba(0, 0, 0, 0.1);
  display: flex;
  justify-content: space-between;
  align-items: center;
  input {
    border: none;
    height: 100%;
    width: 90%;
    box-sizing: border-box;
    outline: none;
    font-weight: 500;
  }
  input::placeholder {
    color: #b7c0ca;
  }
  i {
    color: #b7c0ca;
  }
}
</style>
