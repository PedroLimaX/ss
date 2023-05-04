<template>
  <span class="go-back">
    <v-btn
      class="ml-6 mt-3 grey lighten-5"
      icon
      @click="goBack"
      elevation="1"
      large
    >
      <v-icon color="grey darken-1">
        mdi-chevron-left
      </v-icon>
    </v-btn>
  </span>
</template>

<script>
export default {
  methods:{
    goBack(){
      return this.$router.go(-1);
    }
  }
}
</script>

<style>

</style>