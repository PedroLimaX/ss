<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <div v-if="Items.body!=0">
            <v-row>
              <v-col cols="12" class="text-center">
                <h1>{{ Items.body[0].moduloNombre }}</h1>
                <span class="text-caption">{{ Items.body[0].numeroSemestre }}º Semestre</span>
                <v-spacer></v-spacer>
                <span class="text-caption">{{ Items.body[0].nombreCarrera }}</span>
                <v-spacer></v-spacer>
                <span class="text-caption">Sede {{ Items.body[0].nombreSede }} </span>
              </v-col>
            </v-row>
          </div>
        </v-col>
      </v-row>
    </div>
    <h2 class="text-center ma-6">Materias</h2>
    <div v-if="Items.body!=0">
      <span class="d-none" v-if="Items.body!=0"> {{cargarRequisitoFK(Items.body[0].carreraId)}}</span>
    </div>
    
    <cards :Items="Items.body" :RequisitoFK="RequisitoFK.body" :CorrequisitoFK="CorrequisitoFK.body"/>
    <div v-if="Items.body==0">
      <Vacio/>
    </div>
    
  </div>
</template>

<script>
  import AuthService from '@/services/AuthService.js';
  import {mapGetters,mapActions} from 'vuex'
  import cards from '@/components/materias/cards.vue'
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"



  export default{
    name: 'MATERIAS',
    components:{
      cards,
      Vacio,
      goBack
    },


    data(){
      return{
        moduloId:this.$route.params.id,
        username: ''
      }
    },

    async created() {
      this.cargarMaterias(this.moduloId);
      this.cargarRequisitoFK(this.carreraId);
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('materias', ['cargarMaterias', 'cargarRequisitoFK']),

      getCarreraId(carreraId){
        this.carreraId= carreraId
        },

    },

    computed:{
      ...mapGetters('materias', ['Items', 'ModuloFK', 'RequisitoFK', 'CorrequisitoFK'])
    }

  }
</script>