<template>
  <div id="app">
    <HeaderNav />
    <router-view></router-view>
  </div>
</template>

<script>
import HeaderNav from "./components/HeaderNav.vue";
export default {
  name: "App",
  components: {
    HeaderNav,
  },
};
</script>

<style>
@import url("./style/reset.css");
@import url("https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
#app {
  font-family: "Montserrat", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #052020;
  display: flex;
  flex-direction: column;
  align-items: center;
}
body {
  background-color: #f1f5f9;
}
</style>
