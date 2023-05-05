<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <h1 class="text-center ma-4">Tutores</h1>
        </v-col>
      </v-row>
    </div>
    <cards :Items="Items.body"/>
  </div>
</template>

<script>
  import {mapGetters,mapActions} from 'vuex'

  import cards from '@/components/tutores/cards.vue'
  import goBack from "@/components/goBack"
  

  export default{
    name: 'TUTORES',
    components:{
      cards,
      goBack
    },

    data(){
      return{
        
      }
    },

    async created() {
      this.cargarTutores();
      if ((!this.$store.getters.isLoggedIn) || this.$store.getters.getUser.username != 'administrador') {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('tutores', ['cargarTutores'])
    },

    computed:{
      ...mapGetters('tutores', ['Items'])
    }
  }
</script>