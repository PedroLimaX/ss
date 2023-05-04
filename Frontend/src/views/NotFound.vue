<template>
  <div class="mx-auto text-center">
    <v-img
      class="mx-auto"
      width="25%"
      height="25%"
      src="../assets/img/no-content.png"
    >
    </v-img>
    <h1 class="light-text-color">Error 404</h1>
    <p class="light-text-color">
      ¡La página no ha sido encontrada!
    </p>
    <v-btn
      color="secondary"
      dark
      @click="home()"
    >
      <span>Inicio</span>
    </v-btn>
  </div>
</template>

<script>

  export default {
    name: 'NotFound',

    methods:{
      home(){
        this.$router.push('/');
      }
    }
  }

</script>

