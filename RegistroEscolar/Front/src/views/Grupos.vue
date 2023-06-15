<template>
  <div>
    <goBack/>
    <span class="d-none"> {{ verSede(ItemFK.body[0].idsede) }}</span>
    <div>
      <v-row>
        <v-col class="text-center">
          <carreraFK :ItemCarreraFK="ItemFK.body"/>
          <span class="text-caption">Sede {{ Sede.body[0].nombre }}</span>
        </v-col>
      </v-row>
    </div>
    <h2 class="text-center ma-6">Grupos</h2>
    <cards :Items="Items.body"/>
    <div v-if="Items.body==0">
      <Vacio/>
    </div>
  </div>
</template>

<script>
  import AuthService from '@/services/AuthService.js';
  import {mapGetters,mapActions} from 'vuex'
  import cards from '@/components/grupos/cards.vue'
  import carreraFK from '@/components/grupos/carreraFK.vue'
  import Vacio from '@/components/vacio.vue'
  import goBack from "@/components/goBack"


  export default{
    name: 'GRUPOS',
    components:{
      cards,
      carreraFK,
      Vacio,
      goBack
    },
    data(){
      return{
        carreraId:this.$route.params.id,
        username: ''
      }
    },

    async created() {
      this.cargarGrupos(this.carreraId);
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('grupos', ['cargarGrupos', 'getSede']),

      verSede(idsede){
        this.getSede(idsede)
      }
    },

    computed:{
      ...mapGetters('grupos', ['Items', 'ItemFK', 'Sede'])
    }
  }

</script>