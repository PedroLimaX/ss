<template>
  <div>
    <!-- <span class="d-none"> {{ verSede(CarreraFK.body[0].idsede) }}</span> -->
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <div>
            <v-row>
              <v-col class="text-center">
                <carreraFK :CarreraFK="CarreraFK.body"/>
                <span class="text-caption">Sede {{ Sede.body[0].nombre }}</span>
              </v-col>
            </v-row>
          </div>
        </v-col>
      </v-row>
    </div>
    
    <h2 class="text-center ma-6">Semestres</h2>
    <cards :Items="Items.body" :ConteoMaterias="ConteoMaterias.body"/>
    <div v-if="Items.body==0">
        <Vacio/>
      </div>
  </div>
</template>

<script>
  import AuthService from '@/services/AuthService.js';
  import {mapGetters,mapActions} from 'vuex'
  import cards from '@/components/semestres/cards.vue'
  import carreraFK from '@/components/semestres/CarreraFK.vue'
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"


  export default{
    name: 'SEMESTRES',

    components:{
      cards,
      carreraFK,
      Vacio,
      goBack
    },

    data(){
      return{
        carreraId:this.$route.params.id,
        imagen:[],
        username: ''
      }
    },

  async created() {
      this.cargarSemestres(this.carreraId);
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },


    methods:{
      ...mapActions('semestres', ['cargarSemestres', 'getSede']),

      verSede(idsede){
        this.getSede(idsede)
      }
    },

    computed:{
      ...mapGetters('semestres', ['Items', 'CarreraFK', 'ConteoMaterias', 'Sede'])
    }
  }
</script>