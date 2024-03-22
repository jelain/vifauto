<template>
  <div class="header">
    <div class="navbar">
      <div class="content">
        <router-link to="/fournisseur">
          <img src="/vifauto_logo.png" />
        </router-link>
        <ul>
          <router-link to="/fournisseur">
            <li
              :class="{ hovered: isFournisseurHovered }"
              @mouseover="eventFournisseurHover"
              @mouseleave="eventFournisseurLeave"
            >
              Fournisseurs
            </li>
          </router-link>
          <router-link to="/marque">
            <li>Marques</li>
          </router-link>
        </ul>
      </div>
    </div>
    <FournisseurBar
      v-show="isFournisseurHovered"
      @mouseover="eventFournisseurHover"
      @mouseleave="eventFournisseurLeave"
    />
  </div>
</template>

<script>
import FournisseurBar from "./FournisseurBar.vue";
export default {
  name: "HeaderNav",
  components: {
    FournisseurBar,
  },
  data() {
    return {
      isFournisseurHovered: false,
    };
  },
  methods: {
    eventFournisseurHover() {
      this.isFournisseurHovered = true;
    },
    eventFournisseurLeave() {
      this.isFournisseurHovered = false;
    },
  },
};
</script>

<style lang="scss">
.navbar {
  width: 100vw;
  height: 4rem;
  background-color: #e6fe53;
  box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);

  .content {
    img {
      height: 50px;
    }
    img:hover {
      cursor: pointer;
    }
    ul {
      display: flex;
      justify-content: space-between;
      list-style: none;
      height: 100%;

      a {
        text-decoration: none;
        color: #052020;
        li {
          display: flex;
          font-weight: 500;
          font-size: 1.1rem;
          height: 100%;
          align-items: center;
          padding: 0 18px;
        }
      }

      li:hover,
      li.hovered {
        background: #052020;
        color: #e6fe53;
        cursor: pointer;
      }
    }
    display: flex;
    width: 60em;
    justify-content: space-between;
    align-items: center;
  }
  display: flex;
  justify-content: center;
}
</style>
