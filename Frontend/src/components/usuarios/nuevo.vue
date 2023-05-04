<template>
  <div>
    <v-row justify="center">
    <v-dialog
      v-model="dialog"
      persistent
      max-width="600px"
    >
      <v-card>
        <v-card-title>
          <span v-if="Item.id==0" class="text-h5">Nuevo Usuario</span>
          <span v-else class="text-h5" >Editar Usuario</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0" class="secondary--text">{{ Item.username }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              
              <v-col cols="12">
                <v-text-field
                  label="Nombre*"
                  v-model="Item.username"
                  required
                  hint="Nombre de la Usuario"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Direccion*"
                  v-model="Item.direccion"
                  required
                  hint="Direccion de la Usuario"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  label="Municipio*"
                  v-model="Item.municipio"
                  required
                  hint="Municipio de la Usuario"
                ></v-text-field>
              </v-col>
              
            </v-row>
          </v-container>
          <small>*Campos Obligatorios</small>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="neutral"
            @click="cerrarDialogo()"
            small
          >
            Cerrar
          </v-btn>
          <v-btn
            color="primary"
            @click="agregar()"
            small
          >
            Guardar
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
  </div>
</template>

<script>
import {mapActions} from 'vuex'
export default {
  props:['dialog', 'Item'],
  data() {
      return{
        
      }
    },
    methods:{
      ...mapActions('usuarios', ['agregarUsuario']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Usuario' : ' ¿Desea Editar Usuario?',
        () => {
                this.agregarUsuario(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Usuario Agregada' : 'Usuario Actualizada')
              },
        () => this.$alertify.error('Accion Cancelada')
      );
        
      },
      cerrarDialogo(){
        this.$emit('dialog',false)
      }
    }
}
</script>
