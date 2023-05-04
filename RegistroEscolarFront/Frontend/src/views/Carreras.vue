<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <sedeFK :SedeFK="SedeFK.body"/>
        </v-col>
      </v-row>
    </div>
    <h2 class="text-center ma-6">Carreras</h2>
    <cards :Items="Items.body"/>
    <div v-if="Items.body==0">
      <Vacio/>
    </div>
  </div>
</template>

<script>

import AuthService from '@/services/AuthService.js';
import {mapGetters,mapActions} from 'vuex'
import cards from '@/components/carreras/cards.vue'
import sedeFK from '@/components/carreras/SedeFK.vue'
import Vacio from '@/components/vacio.vue'
import goBack from "@/components/goBack"


  export default{
    name: 'CARRERAS',
    components:{
      cards,
      sedeFK,
      Vacio,
      goBack
    },

    data(){
      return{
        sedeId:this.$route.params.id,
        imagen:[],
        username: ''
      }
    },

    async created() {
      this.cargarCarreras(this.sedeId);
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('carreras', ['cargarCarreras'])
    },

    computed:{
      ...mapGetters('carreras', ['Items', 'SedeFK'])
    }
  }

</script>