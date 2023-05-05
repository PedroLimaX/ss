<template>
  <div>
    <v-row>
      <v-col 
      v-for="(Item,index) in SemestreFK"
      :key="index"
      class="ma-6"
      >
          <h1 class="text-center">
            Semestre: {{Item.semestre}}
          </h1>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  export default {
    props:['SemestreFK'],
}
</script>
