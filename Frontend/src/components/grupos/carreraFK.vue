<template>
  <div>
    <v-row>
      <v-col 
      v-for="(Carrera,index) in ItemCarreraFK"
      :key="index"
      class="ma-6"
      >
          <h1 class="text-center">
            Carrera: {{Carrera.nombre}}
          </h1>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  export default {
    props:['ItemCarreraFK'],
}
</script>
