<template>
  <div>
    <v-row>
      <v-col 
      v-for="(Item,index) in CarreraFK"
      :key="index"
      class="ma-6"
      >
          <h1 class="text-center">
            {{Item.nombre}}
          </h1>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  export default {
    props:['CarreraFK'],
}
</script>
