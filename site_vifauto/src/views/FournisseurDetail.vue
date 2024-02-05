<template>
  <div class="info">
    <div class="info-container">
      <div class="logo">
        <img src="/fournisseur/acr.png" alt="" />
      </div>
      <div class="text">
        <div class="horaire">
          <p>Horaire d'ouverture et de fermeture</p>
        </div>
        <div class="note">
          <p>Temps de reponse :</p>
        </div>
      </div>
    </div>
  </div>
  <div class="fournisseur-detail">
    <div class="container">{{ $route.params.id }}</div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss">
.fournisseur-detail {
  width: 60em;
  margin: 20px 0;
  .content {
  }
}
.info {
  background-color: white;
  display: flex;
  justify-content: center;
  width: 100%;
  height: 100px;
  .info-container {
    width: 57em;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .text {
      p {
        font-weight: 500;
        text-align: end;
      }
    }
  }
}
</style>
