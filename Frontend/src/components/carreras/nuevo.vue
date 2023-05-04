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
          <span v-if="Item.id==0" class="text-h5">Nueva Carrera</span>
          <span v-else class="text-h5">Editar Carrera</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.siglas }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              
              <v-col cols="12">
                <v-text-field
                  label="Nombre*"
                  v-model="Item.nombre"
                  required
                  hint="Nombre de la Carrera"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Siglas*"
                  v-model="Item.siglas"
                  required
                  hint="Siglas de la Carrera"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
              >
                <v-text-field
                  label="Creditos Minimos*"
                  v-model="Item.creditosmin"
                  required
                  hint="Creditos Minimos de la Carrera"
                  type="number"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
              >
                <v-text-field
                label="Creditos Maximos*"
                  v-model="Item.creditosmax"
                  required
                  hint="Creditos Maximos de la Carrera"
                  type="number"
                ></v-text-field>
              </v-col>

              <v-col
                cols="12"
                sm="6"
              >
                <v-text-field
                  label="Horas Minimas*"
                  v-model="Item.horasmin"
                  required
                  hint="Horas Minimas de la Carrera"
                  type="number"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
              >
                <v-text-field
                  label="Horas Maximas*"
                  v-model="Item.horasmax"
                  required
                  hint="Horas Maximas de la Carrera"
                  type="number"
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
        sedeId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('carreras', ['agregarCarrera']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Carrera?' : ' ¿Desea Editar Carrera?',
        () => {
                this.agregarCarrera(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Carrera Agregada' : 'Carrera Actualizada')
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
