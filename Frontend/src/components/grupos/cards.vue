<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :Item="itemSelected" :ItemFK="ItemFK"/>
    <div class="ma-4">
        <v-btn
              color="secondary"
              dark
              class="mb-2 rounded-lg"
              @click="newItem()"
            >
              Nuevo Grupo
            </v-btn>
          </div>
    <v-row>
      
      <v-col 
      v-for="(Item,index) in Items"
      :key="index"
      >
        <v-card
          class="mx-auto rounded-xl pa-4"
          width="450"
          height="180"
        >
          <v-card-title>
            <div class="text--primary">Generación: {{Item.generacion}}</div>
            <v-spacer></v-spacer>
            <div class="text--primary">Sección: {{Item.seccion}}</div>
          </v-card-title>

          <v-card-actions class="d-flex justify-center">

            <!-- -----------------------VER ALUMNOS-------------------------- -->

            <!-- <v-tooltip top>
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
              <span>Ver Alumnos</span>
            </v-tooltip> -->

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
    props:['Items', 'ItemFK'],

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
    ...mapActions('grupos', ['eliminarGrupo', 'verAlumnos']),

    newItem(){
      this.itemSelected={
          id:0,
          nombre:'',
          apaterno:'',
          amaterno: '',
          estatus: '',
          idgrupo:null,
          idtutor:this.tutorId,
      }
      this.dialog = true;
    },


    readItem(item){
      this.itemSelected= item;
      this.verAlumnos(item)
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Grupo "'+item.generacion +' Sección ' +item.seccion+'"?',
        () => {
                this.eliminarGrupo(item);
                
                this.$alertify.success(item.generacion + ' Ha Sido Eliminado')
              },
        () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
  }
}
</script>
