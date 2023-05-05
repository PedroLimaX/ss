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
              <v-col cols="12" sm="12" class="text-center">
                <h1>Semestre: {{ Items.body[0].gradoSemestre }}</h1>
                <span class="text-caption">{{ Items.body[0].nombreCarrera }}</span>
                <v-spacer></v-spacer>
                <span class="text-caption">Sede {{ Items.body[0].nombreSede }} </span>
              </v-col>
            </v-row>
          </div>
        </v-col>
      </v-row>
    </div>
    

    <h2 class="text-center ma-6">Módulos</h2>
    <div class="ma-4">
      <cards :Items="Items.body"/>
    <div v-if="Items.body==0">
      <Vacio/>
    </div>
    </div>
  </div>
</template>

<script>
  import AuthService from '@/services/AuthService.js';
  import {mapGetters,mapActions} from 'vuex'
  import cards from '@/components/modulos/cards.vue'
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"

  export default{
    name: 'MODULOS',
    components:{
      cards,
      Vacio,
      goBack
    },


    data(){
      return{
        semestreId:this.$route.params.id,
        username: ''
      }
    },

    async created() {
      this.cargarModulos(this.semestreId);
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('modulos', ['cargarModulos']),

      verCarrera(idcarrera){
        this.getCarrera(idcarrera)
      },

      verSede(idsede){
        this.getSede(idsede)
      }
    },

    computed:{
      ...mapGetters('modulos', ['Items'])
    }
  }
</script>