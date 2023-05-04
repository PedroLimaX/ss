<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <h1 class="text-center ma-4">Alumno: {{ AlumnoFK.body[0].nombre }} {{ AlumnoFK.body[0].apaterno }} {{ AlumnoFK.body[0].amaterno }}
            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-chip  v-if="AlumnoFK.body[0].estatus == 'Activo'"
                  color="success"
                  class="ma-2"
                  v-bind="attrs"
                  v-on="on"
                  small
                >
              <span class="font-weight-medium">{{ AlumnoFK.body[0].estatus }}</span>
            </v-chip>
              </template>
              <span>El alumno está activo continuando sus estudios</span>
            </v-tooltip>

            
            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="AlumnoFK.body[0].estatus == 'Baja'"
                  color="error"
                  class="ma-2"
                  v-bind="attrs"
                  v-on="on"
                >
                  <span class="font-weight-medium">{{ AlumnoFK.body[0].estatus }}</span>
                </v-chip>
              </template>
              <span>El alumno está inactivo y no puede continuar sus estudios</span>
            </v-tooltip>

            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="AlumnoFK.body[0].estatus == 'Permiso Temporal'"
                  color="disabled"
                  class="ma-2"
                  v-bind="attrs"
                  v-on="on"
                >
                <span class="font-weight-medium">{{ AlumnoFK.body[0].estatus }}</span>
            </v-chip>
              </template>
              <span>El alumno está inactivo, pero puede continuar sus estudios</span>
            </v-tooltip>

            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="AlumnoFK.body[0].estatus == 'Egresado'"
                  color="info"
                  class="ma-2"
                  v-bind="attrs"
                  v-on="on"
                >
                  <span class="font-weight-medium">{{ AlumnoFK.body[0].estatus }}</span>
                </v-chip>
              </template>
              <span>El alumno obtuvo el 100% de créditos</span>
            </v-tooltip>
            <v-tooltip bottom>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="(AlumnoFK.body[0].estatus == 'Egresado') && (AlumnoFK.body[0].titulado)"
                  color="teal"
                  dark
                  class="ma-2"
                  v-bind="attrs"
                  v-on="on"
                  
                >
                  <span class="font-weight-medium">Titulado</span>
                </v-chip>
              </template>
              <span>El alumno se ha titulado</span>
            </v-tooltip>      
          </h1>
        </v-col>
      </v-row>
    </div>
    

    <div>
      <v-row>
        <v-col cols="12" class="text-center mb-4">
          <span class="text-caption">{{ AlumnoFK.body[0].matricula }}</span>
          <v-spacer></v-spacer>
          <span class="text-caption">{{ AlumnoFK.body[0].carreraNombre }}</span>
        </v-col>
      </v-row>
    </div>
    <cards :Items="Items.body" :MateriasFK="MateriasFK.body" :AlumnoFK="AlumnoFK.body"/>
    <span class="d-none"> {{cargarMateriasFK(AlumnoFK.body[0].carreraId)}}</span>
  </div>
</template>

<script>
import AuthService from '@/services/AuthService.js';
import {mapGetters,mapActions} from 'vuex'
import cards from '@/components/calificaciones/cards.vue'
import goBack from "@/components/goBack"

  export default{
    name: 'CALIFICACIONES',
    components:{
      cards,
      goBack
    },

    data(){
      return{
        alumnoId:this.$route.params.id,
        username:''
      }
    },

    async created(){
      this.cargarCalificaciones(this.alumnoId);
      this.cargarMateriasFK(this.carreraId);
      if (!this.$store.getters.isLoggedIn) {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('calificaciones', ['cargarCalificaciones', 'cargarMateriasFK'])
    },

    computed:{
      ...mapGetters('calificaciones', ['Items', 'AlumnoFK', 'MateriasFK'])
    }
  }

</script>