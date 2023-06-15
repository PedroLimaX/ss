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
              Nuevo Tutor
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
            {{ Item.nombre }} {{Item.apaterno}} {{Item.amaterno}}
          </v-card-title>
        
          <v-card-text>
            
            <span class="font-weight-medium">ID de Docente:</span> {{Item.iddocente}}
            <v-spacer></v-spacer>

            <span class="font-weight-medium">NSS:</span> {{ Item.nss }}
            
            <v-divider class="ml-6 mr-6 mt-4 mb-4"></v-divider>
          
            <span class="font-weight-medium">Datos de Contacto:</span>
          
            <v-spacer></v-spacer>

            <v-tooltip right>
              <template v-slot:activator="{ on, attrs }">
                <v-icon 
                    class="ml-2"
                    color="primary"
                    v-bind="attrs"
                    v-on="on"
                  >
                    mdi mdi-email
                </v-icon>
              </template>
              <span >Correo Institucional</span>
            </v-tooltip>

            <span class="font-weight-medium ml-2">{{ Item.correo_institucional }}</span>
            
            <v-spacer></v-spacer>
            
            <v-tooltip right>
              <template v-slot:activator="{ on, attrs }">
                <v-icon 
                    class="ml-2"
                    color="secondary"
                    v-bind="attrs"
                    v-on="on"
                  >
                    mdi mdi-email-outline
                </v-icon>
              </template>
              <span >Correo Personal</span>
            </v-tooltip>
            
            <span class="font-weight-medium ml-2">{{ Item.correo_personal }}</span> 
            
            <v-spacer></v-spacer>
            
            <v-tooltip right>
              <template v-slot:activator="{ on, attrs }">
                <v-icon 
                    class="ml-2"
                    v-bind="attrs"
                    v-on="on"
                  >
                    mdi mdi-phone
                </v-icon>
              </template>
              <span >Número de Teléfono</span>
            </v-tooltip>
            
            <span class="font-weight-medium ml-2">{{ Item.telefono }}</span> 
            
          </v-card-text>
      
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
          apaterno:'',
          amaterno: '',
          nss:'',
          correo_institucional:'',
          correo_personal:'',
          telefono:'',
          iddocente: '',
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
