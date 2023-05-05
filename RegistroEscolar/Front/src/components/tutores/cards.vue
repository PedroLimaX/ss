<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :Item="itemSelected"/>
    <div class="ma-4">
        <v-btn
              color="secondary rounded-lg"
              dark
              class="mb-2"
              @click="newItem()"
            >
              Nueva Tutor
            </v-btn>
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
        >
          <v-card-title>
            {{ Item.nombre }}
          </v-card-title>
        
          <v-card-subtitle>
            {{Item.apaterno}} {{Item.amaterno}}
            
            <v-spacer></v-spacer>

            ID: {{Item.iddocente}}
          </v-card-subtitle>
      
          <v-card-actions class="d-flex justify-center">
              <!-- -----------------------VER ALUMNOS-------------------------- -->

              <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="primary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="verAlumnos(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-eye-outline</v-icon>
                </v-btn>
              </template>
              <span>Ver Alumnos Tutorados</span>
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
    props:['Items'],

  components:{
    Nuevo
  },

  data(){
      return {
        search: '',
        dialog: false,
        itemSelected:{}
      }
    },

  

  methods:{
    ...mapActions('tutores', ['eliminarTutor', 'leerTutor']),

    newItem(){
      this.itemSelected={
          id:0,
          nombre:'',
          direccion:'',
          municipio: '',
      }
      this.dialog = true;
    },

    verAlumnos(item){
      this.itemSelected= item;
      this.leerTutor(item)
    },
    
    editItem(item){
      this.itemSelected= item;
      this.dialog = true;
    },

    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Tutor "'+item.nombre+'"?',
        () => {
                this.eliminarTutor(item);
                this.$alertify.success(item.nombre + ' Ha Sido Eliminado')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
    },
    
  }
}
</script>
