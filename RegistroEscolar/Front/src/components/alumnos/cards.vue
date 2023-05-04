<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :Item="itemSelected" :TutorFK="TutorFK" :GrupoFK="GrupoFK"/>
    <div class="ma-4">
        <v-btn
              color="secondary"
              dark
              class="mb-2 rounded-lg"
              @click="newItem()"
            >
              Nuevo Alumno
            </v-btn>
          </div>
    <v-row class="ma-2">
      
      <v-col 
      v-for="(Item,index) in Items"
      :key="index"
      >
        <v-card
          class="mx-auto rounded-xl pa-2"
          width="450"
          height="250"
        >
          <v-card-title>
            <div class="text--primary">{{Item.matricula}}</div>
            <v-spacer></v-spacer>
            
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="Item.estatus == 'Activo'"
                  color="success"
                  class="d-flex justify-center ma-2"
                  v-bind="attrs"
                  v-on="on"
                  small
                >
              {{ Item.estatus }}
            </v-chip>
              </template>
              <span>El alumno está activo continuando sus estudios</span>
            </v-tooltip>

            
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="Item.estatus == 'Baja'"
                  color="error"
                  class="d-flex justify-center ma-2"
                  v-bind="attrs"
                  v-on="on"
                  small
                >
                  {{ Item.estatus }}
                </v-chip>
              </template>
              <span>El alumno está inactivo y no puede continuar sus estudios</span>
            </v-tooltip>

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="Item.estatus == 'Permiso Temporal'"
                  color="disabled"
                  class="d-flex justify-center ma-2"
                  v-bind="attrs"
                  v-on="on"
                  small
                >
                {{ Item.estatus }}
            </v-chip>
              </template>
              <span>El alumno está inactivo, pero puede continuar sus estudios</span>
            </v-tooltip>

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="Item.estatus == 'Egresado'"
                  color="info"
                  class="d-flex justify-center ma-2"
                  v-bind="attrs"
                  v-on="on"
                  small
                >
                  {{ Item.estatus }}
                </v-chip>
              </template>
              <span>El alumno obtuvo el 100% de créditos</span>
            </v-tooltip>
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-chip v-if="Item.estatus == 'Egresado' && Item.titulado"
                  color="teal"
                  dark
                  class="d-flex justify-center ma-2"
                  v-bind="attrs"
                  v-on="on"
                  small
                >
                  Titulado
                </v-chip>
              </template>
              <span>El alumno se ha titulado</span>
            </v-tooltip>
          </v-card-title>
        
          <v-card-subtitle >
            <div class="text--primary">{{Item.nombre}} {{Item.apaterno}} {{Item.amaterno}}</div>
          </v-card-subtitle>
            
          <v-card-text>
            Carrera: {{Item.siglasCarrera}}
          <v-spacer></v-spacer>
            Generación {{Item.generacionGrupo}}  Sección {{Item.seccionGrupo}}
          </v-card-text>


          <v-card-actions class="d-flex justify-center">
              <!-- -----------------------VER CALIFICACIONES-------------------------- -->

              <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="verCalificaciones(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-eye-outline</v-icon>
                </v-btn>
              </template>
              <span>Ver Calificaciones</span>
            </v-tooltip>

              <!-- -----------------------EDITAR-------------------------- -->

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="neutral"
                  class="d-flex justify-center ma-4  rounded-lg"
                  @click="editItem(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-pencil</v-icon>
                </v-btn>
              </template>
              <span>Editar</span>
            </v-tooltip>

              <!-- -----------------------ELIMINAR-------------------------- -->

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="error"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="deleteItem(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-delete</v-icon>
                </v-btn>
              </template>
              <span>Eliminar</span>
            </v-tooltip>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  
  import {mapActions} from 'vuex'
  import Nuevo from './nuevo.vue'

  export default {
    props:['Items', 'TutorFK', 'GrupoFK'],

  components:{
    Nuevo
  },

  data(){
      return {
        search: '',
        dialog: false,
        itemSelected:{},
        sedeId:this.$route.params.id
      }
    },

  

  methods:{
    ...mapActions('alumnos', ['eliminarAlumno', 'leerAlumno']),

    newItem(){
      this.itemSelected={
          id:0,
          matricula:null,
          nombre:'',
          apaterno:'',
          amaterno: '',
          estatus: '',
          idgrupo:null,
          idtutor:this.tutorId,
      }
      this.dialog = true;
    },


    verCalificaciones(item){
      this.itemSelected= item;
      this.leerAlumno(item)
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Alumno "'+item.nombre+'"?',
        () => {
                this.eliminarAlumno(item);
                
                this.$alertify.success(item.nombre + ' Ha Sido Eliminado')
              },
        () => this.$alertify.error('Acción Cancelada')
      ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
  }
}
</script>
