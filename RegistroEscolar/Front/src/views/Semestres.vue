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
              <v-col class="text-center mt-2">
                <h1>{{ Items.body[0].nombreCarrera }}</h1>
                <span class="text-caption">Sede {{ Items.body[0].nombreSede }}</span>
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
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"


  export default{
    name: 'SEMESTRES',

    components:{
      cards,
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
      this.cargarSemestres(this.carreraId)
      
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    

    methods:{
      ...mapActions('semestres', ['cargarSemestres']),
    },

    computed:{
      ...mapGetters('semestres', ['Items', 'ConteoMaterias'])
    }
  }
</script>