<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :Item="itemSelected" :RequisitoFK="RequisitoFK" :CorrequisitoFK="CorrequisitoFK"/>
    <Leer :readDialog="readDialog" @readDialog="readDialog = $event" :Item="itemSelected"/>
    <div class="ma-4">
        <v-btn
              color="secondary rounded-lg"
              dark
              class="mb-2"
              @click="newItem()"
            >
              Nueva Materia
            </v-btn>
          </div>
    <v-row
    >
      <v-col 
      v-for="(Item,index) in Items"
        :key="index"
        class="ma-2"
      >
        <v-card
          class="mx-auto"
          min-width="450"
          min-height="340"
          max-width="450"
          max-height="340"
          :class="cardBackground(Item)"
          tile
        >
        <div>
        <v-card-title class="text--secondary">
            {{Item.clave}}
            <v-spacer></v-spacer>
            
          </v-card-title>
        <v-spacer></v-spacer>
        <v-card-subtitle>
          <h3>{{Item.nombre}}</h3>
        </v-card-subtitle>

          <v-card-text class="text--primary">
            Créditos: {{ Item.creditos }}
          </v-card-text>

          <v-row
            justify="space-around"
            no-gutters
            class="text--primary"
          >
            <v-col v-if="Item.requisito" cols="6">
              <v-card-text>
                <v-tooltip top>
                  <template v-slot:activator="{ on, attrs }">
                    <v-chip
                      text
                      elevation="1"
                      class="ma-2 text--primary"
                      color="light-blue lighten-4"
                      small
                      v-bind="attrs"
                      v-on="on"
                    >
                      <v-icon class="mr-2" small>mdi mdi-information-outline</v-icon>
                      Con Requisitos
                    </v-chip>
                  </template>
                  <span>Se requieren materias previas aprobadas</span>
                </v-tooltip>
              </v-card-text>
            </v-col>

            <v-col v-else cols="6">
              <v-card-text>
                <v-tooltip top>
                  <template v-slot:activator="{ on, attrs }">
                    <v-chip
                      text
                      elevation="1"
                      class="ma-2 text--disabled"
                      color="light-blue lighten-5"
                      small
                      v-bind="attrs"
                      v-on="on"
                    >
                      <v-icon class="mr-2" small>mdi mdi-information-outline</v-icon>
                      Sin Requisitos
                    </v-chip>
                  </template>
                  <span>No se requieren materias previas aprobadas</span>
                </v-tooltip>
              </v-card-text>
            </v-col>

            <v-col v-if="Item.correquisito" cols="6">
              <v-card-text class="">
                <v-tooltip top>
                  <template v-slot:activator="{ on, attrs }">
                    <v-chip
                      text
                      elevation="1"
                      class="ma-2 font-weight-medium"
                      color="light-blue lighten-3"
                      small
                      v-bind="attrs"
                      v-on="on"
                    >
                      <v-icon class="mr-2" small>mdi mdi-information-outline</v-icon>
                      Con Correquisito
                    </v-chip>
                  </template>
                  <span>Se require inscribir la materia integradora</span>
                </v-tooltip>
              </v-card-text>
            </v-col>

            <v-col v-else cols="6">
              <v-card-text class="text--primary font-weight-medium">
                <v-tooltip top>
                  <template v-slot:activator="{ on, attrs }">
                    <v-chip
                      text
                      elevation="1"
                      class="ma-2"
                      color="light-blue lighten-2"
                      small
                      v-bind="attrs"
                      v-on="on"
                    >
                      <v-icon class="mr-2" small>mdi mdi-information-outline</v-icon>
                      Materia Integradora
                    </v-chip>
                  
                  </template>
                  <span>Materia que engloba el resto de materias del módulo</span>
                </v-tooltip>
                  </v-card-text>
            </v-col>

          </v-row>

          <v-card-actions class="d-flex justify-center">
              <!-- -----------------------VER DETALLES-------------------------- -->

              <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="verDetalles(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-eye-outline</v-icon>
                </v-btn>
              </template>
              <span>Ver Detalles</span>
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
        </div>
          
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
  
  import {mapActions} from 'vuex'
  import Nuevo from './nuevo.vue'
  import Leer from './leer.vue'
  export default {
    props:['Items', 'RequisitoFK', 'CorrequisitoFK'],

    components:{
      Nuevo,
      Leer
    },

  data(){
      return {
        search: '',
        dialog: false,
        readDialog: false,
        itemSelected:{},
        moduloId:this.$route.params.id
      }
    },

  methods:{
    ...mapActions('materias', ['eliminarMateria']),

    newItem(){
      this.itemSelected={
        id:0,
        clave:'',
        nombre:'',
        creditos:null,
        ht:null,
        hp:null,
        totalh:null,
        requisito:null,
        requisito2:null,
        requisito3:null,
        correquisito:null,
        idmodulo:this.moduloId,
      }
      this.dialog = true;
    },

    verDetalles(item){
      this.itemSelected= item;
      this.readDialog = true;
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Materia "'+item.nombre+'"?',
        () => {
                this.eliminarMateria(item);
                this.$alertify.success(item.nombre + ' Ha Sido Eliminada')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
    cardBackground (Item) {
      if(Item.clave.substring(0,4) == 'TCIS'){
        return 'modulo-tcis';
      }
      else if(Item.clave.substring(0,4) == 'FGUS'){
        return 'modulo-fgus';
      }
      else if(Item.clave.substring(0,4) == 'OCIS'){
        return 'modulo-ocis';
      }
      else if(Item.clave.substring(0,4) == 'PPST' || Item.clave == 'SSST'){
        return 'modulo-ppst-ssst'
      }
      else if(Item.clave.substring(0,6) == 'ISTS 6'){
        return 'modulo-ists-optativo';
      }
      else if(Item.clave.substring(0,4) == 'ISTS'){
        return 'modulo-ists';
      }
        return 'modulo-default';
  },

  }
}

</script>
