<template>
  <div>
    <!-- <span class="d-none"> {{ verSemestre(ModuloFK.body[0].idsemestre) }}</span>
    <span class="d-none"> {{ verCarrera(Semestre.body[0].idcarrera) }}</span>
    <span class="d-none"> {{ verSede(Carrera.body[0].idsede) }}</span> -->
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <div>
            <v-row>
              <v-col cols="12" class="text-center">
                <moduloFK :ModuloFK="ModuloFK.body"/>
                <span class="text-caption">{{ Semestre.body[0].numero }}º Semestre</span>
                <v-spacer></v-spacer>
                <span class="text-caption">{{ Carrera.body[0].nombre }}</span>
                <v-spacer></v-spacer>
                <span class="text-caption">Sede {{ Sede.body[0].nombre }} </span>
              </v-col>
            </v-row>
          </div>
        </v-col>
      </v-row>
    </div>
    

    <h2 class="text-center ma-6">Materias</h2>
    <div v-if="Items.body==0">
      <Vacio/>
    </div>
    <div v-else>
      <span class="d-none"> {{cargarRequisitoFK(Items.body[0].carreraId)}}</span>
      <cards :Items="Items.body" :RequisitoFK="RequisitoFK.body" :CorrequisitoFK="CorrequisitoFK.body"/>
    </div>


    
  </div>
</template>

<script>
  import AuthService from '@/services/AuthService.js';
  import {mapGetters,mapActions} from 'vuex'
  import cards from '@/components/materias/cards.vue'
  import moduloFK from '@/components/materias/moduloFK.vue'
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"



  export default{
    name: 'MATERIAS',
    components:{
      cards,
      moduloFK,
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
      ...mapActions('materias', ['cargarMaterias', 'cargarRequisitoFK', 'getCarrera', 'getSede', 'getSemestre']),

      getCarreraId(carreraId){
        this.carreraId= carreraId
        },

      verSemestre(idsemestre){
        this.getSemestre(idsemestre)
      },
      verCarrera(idcarrera){
        this.getCarrera(idcarrera)
      },

      verSede(idsede){
        this.getSede(idsede)
      }
    },

    computed:{
      ...mapGetters('materias', ['Items', 'ModuloFK', 'RequisitoFK', 'CorrequisitoFK', 'Semestre', 'Carrera', 'Sede'])
    }

  }
</script>