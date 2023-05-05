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
              Nuevo Módulo
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
            height="250"
            :class="cardBackground(Item)"
            >
          <div>
            <v-card-title>
              <!-- <p>{{Item.tipo}}</p> -->

              <v-tooltip top >
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  rounded
                  v-bind="attrs"
                  v-on="on"
                  text
                  elevation="1"
                >
                <!-- <v-icon small class="mr-2">mdi mdi-information-outline</v-icon> -->
                {{Item.tipo}}
                </v-btn>
              </template>
              <span v-if="Item.tipo == 'TCIS'">
                Tronco Común Ingeniería              
              </span>

              <span v-if="Item.tipo == 'ISTS' && !Item.optativo">
                Modulo de la Disciplina              
              </span>

              <span v-if="Item.tipo == 'FGUS'">
                Formación General Universitaria             
              </span>

              <span v-if="Item.tipo == 'OCIS'">
                Asignatura Optativa Complementaria             
              </span>

              <span v-if="Item.tipo == 'ISTS' && Item.optativo">
                Modulo Optativo de la Disciplina              
              </span>

              <span v-if="Item.tipo == 'SSST'">
                Servicio Social              
              </span>

              <span v-if="Item.tipo == 'PPST'">
                Prácticas Profesionales              
              </span>
            </v-tooltip>
            

              <v-spacer></v-spacer>
              <span v-if="Item.optativo" class="text--secondary">
                Modulo Optativo
              </span>
          </v-card-title>

          <v-spacer></v-spacer>
          
          <v-card-subtitle >
            <div class="text--primary">{{Item.nombre}}</div>
          </v-card-subtitle>

          <v-card-actions class="d-flex justify-center">
            <!-- -----------------------VER MATERIAS-------------------------- -->

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
              <span>Ver Materias</span>
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
        semestreId:this.$route.params.id
      }
    },

  

  methods:{
    ...mapActions('modulos', ['eliminarModulo', 'verMaterias']),

    newItem(){
      this.itemSelected={
          id:0,
          nombre:'',
          tipo:'',
          optativo: false,
          idsemestre:this.semestreId,
      }
      this.dialog = true;
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    readItem(item){
      this.itemSelected= item;
      this.verMaterias(item)
    },

    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Modulo "'+item.nombre+'"?',
        () => {
                this.eliminarModulo(item);
                this.$alertify.success(item.nombre + ' Ha Sido Eliminada')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
    cardBackground: function (Item) {
      if(Item.tipo == 'TCIS'){
        return 'modulo-tcis';
      }
      else if(Item.tipo == 'FGUS'){
        return 'modulo-fgus';
      }
      else if(Item.tipo == 'OCIS'){
        return 'modulo-ocis';
      }
      else if(Item.tipo == 'PPST' || Item.tipo == 'SSST'){
        return 'modulo-ppst-ssst'
      }
      else if(Item.tipo == 'ISTS' && Item.optativo){
        return 'modulo-ists-optativo';
      }
      else return 'modulo-ists';
  },

  }
}
</script>
