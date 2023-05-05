<template>
  <div>
    <v-row>
      <v-col 
      v-for="(Modulo,index) in ModuloFK"
      :key="index"
      class="ma-6"
      >
          <h1 class="text-center">
            Módulo: {{Modulo.nombre}}
          </h1>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  export default {
    props:['ModuloFK'],
}
</script>
