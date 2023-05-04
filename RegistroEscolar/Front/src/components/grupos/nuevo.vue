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
          <span v-if="Item.id==0" class="text-h5">Nuevo Grupo</span>
          <span v-else class="text-h5">Editar Grupo</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.matricula }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              
              <v-col cols="12">
                <v-text-field
                  label="Generación*"
                  v-model="Item.generacion"
                  required
                  hint="Generación del Grupo"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Sección*"
                  v-model="Item.seccion"
                  required
                  hint="Sección del Grupo"
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
  props:['dialog', 'Item', 'ItemFK'],
  data() {
      return{
        sedeId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('grupos', ['agregarGrupo']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Grupo?' : ' ¿Desea Editar Grupo?',
        () => {
                this.agregarGrupo(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Grupo Agregado' : 'Grupo Actualizado')
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
