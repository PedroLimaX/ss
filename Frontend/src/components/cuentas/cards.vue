<template>
  <div>
    <div class="ma-4">
        <v-btn
              color="secondary"
              dark
              class="mb-2 rounded-lg"
              @click="newItem()"
            >
              Nueva Cuenta
            </v-btn>
          </div>
    <v-row>
      <v-col
      v-for="(Item,index) in Items"
        :key="index"
        class="ma-4"
      >
        <v-card
          class="mx-auto rounded-xl pa-4"
          min-width="350"
        >
          <v-card-title>
            Usuario: {{ Item.username }}
          </v-card-title>

          <v-card-text>
            Fecha de registro {{ new Date(Item.registered).toLocaleString('es-MX') }}
            <v-spacer></v-spacer>
            Último inicio de sesión: {{ new Date(Item.last_login).toLocaleString('es-MX') }}
          </v-card-text>
          <v-card-actions class="d-flex justify-center">

            <!-- -----------------------ELIMINAR-------------------------- -->
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn v-if="Item.username!='administrador'"
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


            <!-- -----------------------REESTABLECER-------------------------- -->

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn v-if="Item.username!='administrador'"
                  color="secondary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="agregar(Item)"
                  v-bind="attrs"
                  v-on="on"
                >
                  <v-icon>mdi mdi-account-reactivate-outline</v-icon>
                </v-btn>
              </template>
              <span>Restablecer Cuenta</span>
            </v-tooltip>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>

  import {mapActions} from 'vuex'
  export default {
    props:['Items'],

  components:{
    
  },

  data(){
      return {
        search: '',
        itemSelected:{}
      }
    },

  methods:{
    ...mapActions('cuentas', ['eliminarCuenta', 'agregarCuenta', 'restablecerCuenta']),

    newItem(){
      this.$router.push('/sign-up');
    },
    deleteItem(item){
      this.$alertify.confirm(
        '¿Eliminar Cuenta "'+item.nombre+'"?',
        () => {
                this.eliminarCuenta(item);
                this.$alertify.success(item.nombre + ' Ha Sido Eliminada')
              },
        () => this.$alertify.error('Accion Cancelada')
      );
    },

    agregar(item){
        this.itemSelected= item;
        this.$alertify.confirm('¿Desea Restablecer Cuenta?',
        () => {
              try {
                const credentials = {
                  username: item.username,
                  password: item.username
                }
                this.restablecerCuenta(credentials);
              }catch (error) {
                this.msg = error.response.data.msg;
              }
                
                this.$alertify.success('Cuenta Restablecida')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
        
      }
    
  }
}
</script>
