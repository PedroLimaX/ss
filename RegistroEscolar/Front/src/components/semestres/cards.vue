<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :readDialog="readDialog" @readDialog="readDialog = $event" :Item="itemSelected"/>
    <div class="ma-4">
      <v-btn
        color="secondary"
        dark
        class="mb-2 rounded-lg"
        @click="newItem()"
      >
        Nuevo Semestre
      </v-btn>

      <div class="text-center">
      <v-dialog
        v-model="tabla"
        width="1000"
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="secondary rounded-lg"
            dark
            v-bind="attrs"
            v-on="on"
          >
            Resumen
          </v-btn>
        </template>

        <v-card class="mx-auto rounded-lg" justify="center">
          <v-card-title class="primary" >
            <p class="text-center white--text">Materias No aprobadas y No cursadas</p>
          </v-card-title>
          <v-spacer></v-spacer>

          <v-card-text class="mt-4">
            <v-data-table
              dense
              :headers="headers"
              :items="ConteoMaterias"
              item-key="materiaNombre"
              class="elevation-0"
            ></v-data-table>
          </v-card-text>

          <v-divider></v-divider>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="neutral"
              
              @click="tabla = false"
            >
              Cerrar
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </div>
    </div>
    
    <v-row>
      <v-col 
      v-for="(Item,index) in Items"
        :key="index"
        class="ma-4"
      >
        <v-card
          class="mx-auto rounded-xl pa-2"
          min-width="350"
          min-height="200"
          max-height="420"
        >
          <v-card-title>
              <div>{{Item.semestre}} </div>
          </v-card-title>

          <v-spacer></v-spacer>

          <v-card-subtitle >
            <div class="text--primary">Nivel: {{Item.nivel}}</div>
          </v-card-subtitle>

          <v-spacer></v-spacer>

          <v-card-actions class="d-flex justify-center">

          <!-- -----------------------VER MODULOS-------------------------- -->

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
              <span>Ver Módulos</span>
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
    props:['Items', 'ConteoMaterias'],

  components:{
    Nuevo
  },

  data(){
      return {
        search: '',
        dialog: false,
        tabla: false,
        readDialog: false,
        itemSelected:{},
        carreraId:this.$route.params.id,

        headers: [
        {
          text: 'Materia',
          align: 'start',
          sortable: false,
          value: 'materiaNombre',
        },
        { text: 'Semestre', value: 'semestreMateria' },
        { text: 'Total No Aprobados', value: 'NoAprobadasTotal' },
        { text: 'Total No Cursados', value: 'NoCursadasTotal' },
      ],

      }
    },

  methods:{
    ...mapActions('semestres', ['eliminarSemestre', 'verModulos', 'verResumen']),

    newItem(){
      this.itemSelected={
        id:0,
        semestre:null,
        numero:null,
        nivel:'',
        idcarrera:this.carreraId,
      }
      this.dialog = true;
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    readItem(item){
      this.itemSelected= item;
      this.verModulos(item);
    },

    verResumen(){
      console.log(this.ConteoMaterias);
      this.tabla = true;
    },


    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Semestre "'+item.semestre+'"?',
        () => {
                this.eliminarSemestre(item);
                this.$alertify.success(item.semestre + ' Ha Sido Eliminado')
              },
              () => this.$alertify.error('Acción Cancelada')
      ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
  }
}
</script>
