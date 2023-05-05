<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
      min-height="50"
    >
    <v-btn 
      text
      @click="home()"
    >
      <div class="d-flex align-center">
        <v-img
          alt="BUAP Logo"
          class="shrink mr-2"
          contain
          src="./assets/img/logo64.png"
          transition="scale-transition"
          width="48"
        />

        <v-img
          alt="BUAP Name"
          class="shrink mt-1 hidden-sm-and-down"
          contain
          min-width="100"
          src="./assets/img/buap_logo_blanco.png"
          width="100"
        />
      </div>
    </v-btn>
      
      <v-spacer></v-spacer>
        <v-btn
          v-for="(item,index) in rutas" :key="index"
          text
          @click="insertarRuta(item.ruta)"
        >
          <v-icon class="mr-2">mdi-home</v-icon>
        <span class="mr-2">{{item.nombre}}</span>
        </v-btn>

        <v-btn  v-if="!this.$store.getters.isLoggedIn" text  @click="login()">
          <v-icon class="mr-2">mdi-account-circle</v-icon>
          <span>Ingresar</span>
        </v-btn>

        <v-menu v-if="this.$store.getters.isLoggedIn"
          bottom
          min-width="100px"
          rounded
          offset-y
          color="primary"
        >
          <template v-slot:activator="{ on }">
            <v-btn
              icon
              x-large
              v-on="on"
              class="ml-2 mr-2"
            >
              <v-avatar
                color="secondary"
                size="45"
              >
                <v-icon medium>
                  mdi-account
                </v-icon>
              </v-avatar>
            </v-btn>
          </template>
          <v-card 
              color="primary">
            <v-list-item-content class="justify-center">
              <div class="mx-auto text-center">
                <span class="white--text font-weight-bold text-caption" color="secondary">{{ this.$store.getters.getUser.username }}</span>

                <v-divider class="my-3" color="white"></v-divider>

                <v-btn v-if="this.$store.getters.isLoggedIn"
                  depressed
                  rounded
                  text
                  dark
                  small
                  @click="profile()"
                >
                  Perfil
                </v-btn>

                <v-divider class="my-3"></v-divider>
                
                <v-btn v-if="this.$store.getters.isLoggedIn"
                  depressed
                  rounded
                  text
                  dark
                  small
                  @click="logout()"
                >Cerrar Sesión</v-btn>
              </div>
            </v-list-item-content>
          </v-card>
        </v-menu>
        
    </v-app-bar>
    <v-main :class="background()">
      <router-view/>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: 'App',
  components:{
  },
  data: () => ({
    //
    rutas:[
      {nombre:'Inicio',ruta: '/'}
    ]
  }),

  methods: {
    insertarRuta(ruta){
      this.$router.push(ruta);
    },
    logout() {
      this.$store.dispatch('logout');
      this.$router.push('/');
    },
    login(){
      this.$router.push('/login');
    },
    profile(){
      this.$router.push('/usuario/' + this.$store.getters.getUser.username);
    },
    home(){
      this.$router.push('/');
    },
    background(){
      if(this.$route.name == "login" || this.$route.name == "Not Found"){
        return "primary-background"
      }
    }
  }
};
</script>

<style>
  @import './assets/styles/main.css';
  
</style>