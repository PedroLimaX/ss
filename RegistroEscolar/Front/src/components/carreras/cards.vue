<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :Item="itemSelected"/>
    <div class="ma-4">
        <v-btn
              color="secondary"
              dark
              class="mb-2 rounded-lg"
              @click="newItem()"
            >
              Nueva Carrera
            </v-btn>
          </div>
    <v-row>
      
      <v-col 
      v-for="(Item,index) in Items"
      :key="index"
      class="ma-2"
      >
        <v-card
          class="mx-auto rounded-xl pa-2"
          width="450"
          height="300"
        >
          <v-card-title>
            <div class="text--primary">{{Item.siglas}}</div>
          </v-card-title>
        
          <v-card-subtitle >
            <div class="text--primary">{{Item.nombre}}</div>
          </v-card-subtitle>
            
          <v-spacer></v-spacer>

          <v-row
          justify="space-around"
          no-gutters>
            <v-col cols="6">
              <v-card-text>
                Créditos mínimos: {{Item.creditosmin}}

              </v-card-text>
            </v-col>
            <v-col cols="6">
              <v-card-text>
                Créditos máximos: {{Item.creditosmax}}
              </v-card-text>
            </v-col>

            <v-col cols="6">
              <v-card-text>
                Horas mínimas: {{Item.horasmin}}

              </v-card-text>
            </v-col>
            <v-col cols="6">
              <v-card-text>
                Horas máximas: {{Item.horasmax}}
              </v-card-text>
            </v-col>
          </v-row>

          <v-card-actions class="d-flex justify-center">

            <!-- -----------------------VER SEMESTRES-------------------------- -->

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="readItem(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-eye-outline</v-icon>
                </v-btn>
              </template>
              <span>Ver Semestres</span>
            </v-tooltip>

            <!-- -----------------------EDITAR-------------------------- -->

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="neutral"
                  class="d-flex justify-center ma-4 rounded-lg"
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

            <!-- -----------------------VER GRUPOS-------------------------- -->
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="secondary"
                  dark
                  class="d-flex justify-center ma-4 rounded-lg"
                  v-bind="attrs"
                  v-on="on"
                  @click="readGroupsItem(Item)"
                >
                  <v-icon>mdi mdi-account-group</v-icon>
                </v-btn>
              </template>
              <span>Ver Grupos</span>
            </v-tooltip>

          </v-card-actions>
          <v-expand-transition>
          </v-expand-transition>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  
  import {mapActions} from 'vuex'
  import Nuevo from './nuevo.vue'

  export default {
    props:['Items'],

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
    ...mapActions('carreras', ['eliminarCarrera', 'verSemestres', 'verGrupos']),

    newItem(){
      this.itemSelected={
        id:0,
          nombre:'',
          siglas:'',
          creditosmin: null,
          creditosmax: null,
          horasmin:null,
          horasmax:null,
          idsede:this.sedeId,
      }
      this.dialog = true;
    },


    readItem(item){
      this.itemSelected= item;
      this.verSemestres(item)
    },

    readGroupsItem(item){
      this.itemSelected= item;
      this.verGrupos(item)
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Carrera "'+item.nombre+'"?',
        () => {
                this.eliminarCarrera(item);
                
                this.$alertify.success(item.nombre + ' Ha Sido Eliminada')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
  }
}
</script>
