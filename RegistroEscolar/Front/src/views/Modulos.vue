<template>
  <div>
    <!-- <span class="d-none"> {{ verCarrera(SemestreFK.body[0].idcarrera) }}</span> -->
    <!-- <span class="d-none"> {{ verSede(Carrera.body[0].idsede) }}</span> -->
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <div>
            <v-row>
              <v-col cols="12" sm="12" class="text-center">
                <semestreFK :SemestreFK="SemestreFK.body"/>
                <span class="text-caption">{{ Carrera.body[0].nombre }}</span>
                <v-spacer></v-spacer>
                <span class="text-caption">Sede {{ Sede.body[0].nombre }} </span>
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
  import semestreFK from '@/components/modulos/semestreFK.vue'
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"

  export default{
    name: 'MODULOS',
    components:{
      cards,
      semestreFK,
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
      ...mapActions('modulos', ['cargarModulos', 'getCarrera', 'getSede']),

      verCarrera(idcarrera){
        this.getCarrera(idcarrera)
      },

      verSede(idsede){
        this.getSede(idsede)
      }
    },

    computed:{
      ...mapGetters('modulos', ['Items', 'SemestreFK', 'Carrera', 'Sede'])
    }
  }
</script>