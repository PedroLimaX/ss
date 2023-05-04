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
          <span v-if="Item.id==0" class="text-h5">Nueva Calificación</span>
          <span v-else class="text-h5">Editar Calificacion</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.siglas }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-select
                  :items="MateriasFK"
                  :item-text="MateriasFK => `${MateriasFK.clave} - ${MateriasFK.nombre} (Semestre: ${MateriasFK.semestre} )`"
                  item-value="id"
                  v-model="Item.idmateria"
                  label="Materia*"
                  type="number"
                  return-object
                  @input="setMateria($event)"
                ></v-select>
              </v-col>

              <v-col cols="12" sm="6">
                <v-select
                  :items="['Aprobada', 'Cursando', 'No aprobada', 'No cursada']"
                  label="Estatus*"
                  v-model="Item.estatus"
                  required
                ></v-select>
              </v-col>

              <v-col sm="6">
                <v-text-field
                  label="Calificación"
                  v-model="Item.calificacion"
                  hint="Calificación Obtenida (5-10)"
                  type="number"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Periodo Aprobada/Inscrita"
                  v-model="Item.periodo"
                  hint="Periodo cuando fue inscrita"
                ></v-text-field>
              </v-col>
              
              <v-col cols="4">
                <v-checkbox
                  label="Marque si tomó extraordinario"
                  v-model="Item.extraordinario"
                ></v-checkbox>
              </v-col>

              <v-col cols="8">
                <v-text-field
                  label="Nº de Recursos"
                  v-model="Item.recurso"
                  hint="Si la materia fue recursada indique cuantas veces se ha recursado"
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
  props:['dialog', 'Item', 'MateriasFK'],
  data() {
      return{
        alumnoId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('calificaciones', ['agregarCalificacion']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Calificación?' : ' ¿Desea Editar Calificación?',
        () => {
          this.Item={
                  id:this.Item.id,
                  estatus: this.Item.estatus,
                  calificacion: this.Item.calificacion,
                  periodo: this.Item.periodo,
                  extraordinario: this.Item.extraordinario,
                  recurso: this.Item.recurso,
                  idalumno:this.alumnoId,
                  idmateria:this.Item.idmateria
                }
                this.agregarCalificacion(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Calificación Agregada' : 'Calificación Actualizada')
              },
        () => this.$alertify.error('Acción Cancelada')
      ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
        
      },
      cerrarDialogo(){
        this.$emit('dialog',false)
      },

      setMateria(materiaId){
        this.Item.idmateria = materiaId.id
      },
    }
}
</script>
