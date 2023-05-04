<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <h1 class="text-center ma-4">Cuentas</h1>
        </v-col>
      </v-row>
    </div>
    <cards :Items="Items.body"/>
  </div>
</template>

<script>

  import AuthService from '@/services/AuthService.js';
  import {mapGetters,mapActions} from 'vuex'
  import cards from '@/components/cuentas/cards.vue'
  import goBack from "@/components/goBack"

  export default{
    name: 'CUENTAS',
    components:{
      cards,
      goBack
    },

    data(){
      return{
        username: ''
      }
  },

  async created() {
    this.cargarCuentas();
    if (this.$store.getters.getUser.username != 'administrador') {
      this.$router.push('/');
    }
    this.username = this.$store.getters.getUser.username;
    this.secretMessage = await AuthService.getSecretContent();
  },

  methods: {
  },

    methods:{
      ...mapActions('cuentas', ['cargarCuentas'])
    },

    computed:{
      ...mapGetters('cuentas', ['Items'])
    }
  }
</script>