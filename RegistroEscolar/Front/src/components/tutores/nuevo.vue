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
          <span v-if="Item.id==0" class="text-h5">Nuevo Tutor</span>
          <span v-else class="text-h5" >Editar Tutor</span>
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
                  hint="Nombre del Docente"
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field
                  label="Apellido Paterno*"
                  v-model="Item.apaterno"
                  required
                  hint="Apellido Paterno del Docente"
                ></v-text-field>
              </v-col>
              <v-col sm="6">
                <v-text-field
                  label="Apellido Materno*"
                  v-model="Item.amaterno"
                  required
                  hint="Apellido Materno del Docente"
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field
                  label="ID*"
                  v-model="Item.iddocente"
                  required
                  hint="ID del Docente"
                ></v-text-field>
              </v-col>

              <v-col sm="6">
                <v-text-field
                  label="NSS*"
                  v-model="Item.nss"
                  required
                  hint="Número de Seguro Social del Docente"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Correo Institucional*"
                  v-model="Item.correo_institucional"
                  required
                  hint="Correo Institucional del Docente"
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field
                  label="Correo Personal*"
                  v-model="Item.correo_personal"
                  required
                  hint="Correo Personal del Docente"
                ></v-text-field>
              </v-col>
              <v-col sm="6">
                <v-text-field
                  label="Teléfono*"
                  v-model="Item.telefono"
                  required
                  hint="Número de Teléfono del Docente"
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
      ...mapActions('tutores', ['agregarTutor']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Tutor' : ' ¿Desea Editar Tutor?',
        () => {
                this.agregarTutor(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Tutor Agregado' : 'Tutor Actualizado')
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
