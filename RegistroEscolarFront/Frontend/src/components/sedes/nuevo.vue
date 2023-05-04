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
          <span v-if="Item.id==0" class="text-h5">Nueva Sede</span>
          <span v-else class="text-h5" >Editar Sede</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0" class="secondary--text">{{ Item.nombre }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              
              <v-col cols="12">
                <v-text-field
                  label="Nombre*"
                  v-model="Item.nombre"
                  required
                  hint="Nombre de la Sede"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Direccion*"
                  v-model="Item.direccion"
                  required
                  hint="Direccion de la Sede"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  label="Municipio*"
                  v-model="Item.municipio"
                  required
                  hint="Municipio de la Sede"
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
      ...mapActions('sedes', ['agregarSede']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Sede' : ' ¿Desea Editar Sede?',
        () => {
                this.agregarSede(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Sede Agregada' : 'Sede Actualizada')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
        
      },
      cerrarDialogo(){
        this.$emit('dialog',false)
      }
    }
}
</script>
