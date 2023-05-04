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
          <span v-if="Item.id==0" class="text-h5">Nuevo Módulo</span>
          <span v-else class="text-h5" >Editar Módulo</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.tipo }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>

              <v-col cols="12">
                <v-text-field
                  label="Nombre*"
                  v-model="Item.nombre"
                  required
                  hint="Nombre del modulo"
                ></v-text-field>
              </v-col>
              
              <v-col
                cols="12"
                sm="12"
              >
                <v-text-field
                  label="Tipo de Módulo"
                  v-model="Item.tipo"
                  required
                  hint="Tipo de modulo"
                ></v-text-field>
              </v-col>

              <v-col
                cols="12"
                sm="12"
              >
              <v-checkbox
                  v-model="Item.optativo"
                  label="Módulo Optativo"
                ></v-checkbox>
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
        semestreId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('modulos', ['agregarModulo']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Módulo?' : ' ¿Desea Editar Módulo?',
        () => {
                this.agregarModulo(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Módulo Agregado' : 'Módulo Actualizado')
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
