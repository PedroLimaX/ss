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
          <span v-if="Item.id==0" class="text-h5">Nuevo Alumno</span>
          <span v-else class="text-h5">Editar Alumno</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.matricula }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>

              <v-col cols="12" sm="6">
                <v-text-field
                  label="Matrícula*"
                  v-model="Item.matricula"
                  required
                  hint="Matrícula del Alumno"
                ></v-text-field>
              </v-col>
              
              <v-col cols="12" sm="6">
                <v-text-field
                  label="Nombre*"
                  v-model="Item.nombre"
                  required
                  hint="Nombre del Alumno"
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field
                  label="Apellido Paterno*"
                  v-model="Item.apaterno"
                  required
                  hint="Apellido Paterno del Alumno"
                ></v-text-field>
              </v-col>

              <v-col cols="12" sm="6">
                <v-text-field
                  label="Apellido Materno*"
                  v-model="Item.amaterno"
                  required
                  hint="Apellido Materno del Alumno"
                ></v-text-field>
              </v-col>

              <v-col
                cols="12"
                sm="6"
              >
              <v-select
                :items="['Activo','Baja','Permiso Temporal', 'Egresado']"
                v-model="Item.estatus"
                label="Estatus"
              ></v-select>
              </v-col>
              <v-col sm="6">
                <v-checkbox
                  label="Marque si el alumno se ha titulado"
                  v-model="Item.titulado"
                ></v-checkbox>
              </v-col>
              <v-col cols="12">
                <v-select
                    :items="GrupoFK"
                    :item-text="GrupoFK => ` Generacion ${GrupoFK.generacion} Seccion ${GrupoFK.seccion}`"
                    item-value="id"
                    v-model="Item.idgrupo"
                    label="Grupo"
                    type="number"
                    return-object
                    @input="setGrupoId($event)"
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
  props:['dialog', 'Item', 'TutorFK', 'GrupoFK'],
  data() {
      return{
        grupoFK: this.GrupoFK,
        tutorId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('alumnos', ['agregarAlumno']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Alumno?' : ' ¿Desea Editar Alumno?',
        () => {
                this.Item={
                  id:this.Item.id,
                  nombre:this.Item.nombre,
                  apaterno:this.Item.apaterno,
                  amaterno:this.Item.amaterno,
                  estatus:this.Item.estatus,
                  titulado:this.Item.titulado,
                  matricula:this.Item.matricula,
                  idgrupo:this.Item.idgrupo,
                  idtutor:this.tutorId,
                }
                console.log(this.Item);
                this.agregarAlumno(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Alumno Agregado' : 'Alumno Actualizado')
              },
        () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
        
      },
      cerrarDialogo(){
        this.$emit('dialog',false)
      },

      setGrupoId(grupoId){
        this.Item.idgrupo = grupoId.id
      },
    }
}
</script>
