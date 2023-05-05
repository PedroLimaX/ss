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
          <span v-if="Item.id==0" class="text-h5">Nuevo Semestre</span>
          <span v-else class="text-h5">Editar Semestre</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.semestre }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="6">
                <v-select
                  :items="['Primero', 'Segundo', 'Tercero', 'Cuarto', 'Quinto', 'Sexto', 'Séptimo', 'Octavo', 'Noveno', 'Décimo', 'Décimo Primero', 'Décimo Segundo', 'Décimo Tercero', 'Décimo Cuarto', 'Décimo Quinto']"
                  label="Grado*"
                  v-model="Item.semestre"
                  required
                ></v-select>
              </v-col>

              <v-col cols="6">
                <v-select
                  :items="[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]"
                  label="Número*"
                  v-model="Item.numero"
                  required
                ></v-select>
              </v-col>

              <v-col
                cols="12"
                sm="12"
              >
                <v-select
                  :items="['Básico', 'Formativo']"
                  v-model="Item.nivel"
                  label="Nivel*"
                  required
                ></v-select>
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
        carreraId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('semestres', ['agregarSemestre']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea Agregar Semestre?' : ' ¿Desea Editar Semestre?',
        () => {
                this.agregarSemestre(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Semestre Agregado' : 'Semestre Actualizado')
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