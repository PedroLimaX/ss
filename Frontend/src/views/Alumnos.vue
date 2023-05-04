<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <h1 class="text-center ma-6" v-for="(Tutor,index) in TutorFK.body" :key="index">
            Tutor: {{Tutor.nombre}} {{Tutor.apaterno}} {{Tutor.amaterno}}
            <v-spacer></v-spacer>
            <span class="text-subtitle-2">ID: {{ Tutor.iddocente }}</span>
          </h1>
        </v-col>
      </v-row>
    </div>
    
    <h2 class="text-center ma-6">Alumnos Tutorados</h2>
    <cards :Items="Items.body" :GrupoFK="GrupoFK.body"/>
    <div v-if="Items.body==0">
      <Vacio/>
    </div>
  </div>
</template>

<script>

import AuthService from '@/services/AuthService.js';
import {mapGetters,mapActions} from 'vuex'
import cards from '@/components/alumnos/cards.vue'
import Vacio from '@/components/vacio.vue'
import goBack from "@/components/goBack"


  export default{
    name: 'ALUMNOS',
    components:{
      cards,
      Vacio,
      goBack
    },


    data(){
      return{
        tutorId:this.$route.params.id,
        username:''
      }
    },

    async created() {
      this.cargarUsuario(this.$store.getters.getUser.username);
      this.cargarAlumnos(this.tutorId);
      if (this.$store.getters.isLoggedIn) {
        if(!this.UserData.body[0].tutorId){
          if(this.$store.getters.getUser.username != 'administrador'){
              this.$router.push('/');
          }
        }
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('alumnos', ['cargarAlumnos', 'cargarUsuario'])
    },

    computed:{
      ...mapGetters('alumnos', ['Items', 'TutorFK', 'GrupoFK', 'UserData'])
    }
  }

</script>