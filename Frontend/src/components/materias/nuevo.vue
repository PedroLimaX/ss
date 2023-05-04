<template>
  <div>
    <v-row justify="center">
    <v-dialog
      v-model="dialog"
      persistent
      max-width="800px"
    >
      <v-card>
        <v-card-title>
          <span v-if="Item.id==0" class="text-h5">Nueva Materia</span>
          <span v-else class="text-h5">Editar Materia</span>
          <v-spacer></v-spacer>
          <span v-if="Item.id>0">{{ Item.clave }}</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col
                cols="12"
                sm="6"
                md="6"
              >
                <v-text-field
                  label="Clave*"
                  v-model="Item.clave"
                  required
                  hint="Clave de la Materia"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="6"
              >
                <v-text-field
                  label="Créditos*"
                  v-model="Item.creditos"
                  required
                  hint="Créditos de la Materia"
                  type="number"
                ></v-text-field>
              </v-col>

              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-text-field
                  label="Horas Práctica"
                  v-model="Item.hp"
                  hint="Horas de Práctica de la Materia"
                  type="number"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-text-field
                  label="Horas Teoría"
                  v-model="Item.ht"
                  hint="Horas de Teoria de la Materia"
                  type="number"
                ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="4"
              >
                <v-text-field
                  label="Horas Totales*"
                  v-model="Item.totalh"
                  hint="Horas Totales de la Materia"
                  required
                  type="number"
                ></v-text-field>
              </v-col>

              <v-col cols="12">
                <v-text-field
                  label="Nombre*"
                  v-model="Item.nombre"
                  required
                  hint="Nombre de la Materia"
                ></v-text-field>
              </v-col>
              
              <v-col
                cols="12"
                sm="6"
              >
                <v-select
                  :items="RequisitoFK"
                  :item-text="RequisitoFK => `${RequisitoFK.clave} - ${RequisitoFK.nombre}`"
                  item-value="id"
                  v-model="Item.requisito"
                  label="Requisito 1"
                  type="number"
                  return-object
                  @input="setRequisito1($event)"
                  ></v-select>
              </v-col>

              <v-col
                cols="12"
                sm="6"
              >
                <v-select
                  :items="RequisitoFK"
                  :item-text="RequisitoFK => `${RequisitoFK.clave} - ${RequisitoFK.nombre}`"
                  item-value="id"
                  v-model="Item.requisito2"
                  label="Requisito 2"
                  type="number"
                  return-object
                  @input="setRequisito2($event)"
                ></v-select>
              </v-col>

              <v-col
                cols="12"
                sm="6"
              >
                <v-select
                  :items="RequisitoFK"
                  :item-text="RequisitoFK => `${RequisitoFK.clave} - ${RequisitoFK.nombre}`"
                  item-value="id"
                  v-model="Item.requisito3"
                  label="Requisito 3"
                  type="number"
                  return-object
                  @input="setRequisito3($event)"
                ></v-select>
              </v-col>

              <v-col
                cols="12"
                sm="6"
              >
                <v-select
                  :items="CorrequisitoFK"
                  :item-text="CorrequisitoFK => `${CorrequisitoFK.clave} - ${CorrequisitoFK.nombre}`"
                  item-value="id"
                  v-model="Item.correquisito"
                  label="Correquisito"
                  type="number"
                  return-object
                  @input="setCorrequisito($event)"
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
  props:['dialog', 'Item', 'RequisitoFK','CorrequisitoFK'],
  data() {
      return{
        requisitoFK:this.RequisitoFK,
        moduloId:this.$route.params.id,
      }
    },
    methods:{
      ...mapActions('materias', ['agregarMateria']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Materia?' : ' ¿Desea Editar Materia?',
        () => {
                this.Item={
                  id:this.Item.id,
                  clave:this.Item.clave,
                  nombre:this.Item.nombre,
                  creditos:this.Item.creditos,
                  ht:this.Item.ht,
                  hp:this.Item.hp,
                  totalh:this.Item.totalh,
                  requisito:this.Item.requisito,
                  requisito2:this.Item.requisito2,
                  requisito3:this.Item.requisito3,
                  correquisito:this.Item.correquisito,
                  idmodulo:this.moduloId,
                }
                this.agregarMateria(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Materia Agregada' : 'Materia Actualizada')
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
        
      },
      cerrarDialogo(){
        this.$emit('dialog',false)
      },

      setRequisito1(requisitoId){
        this.Item.requisito = requisitoId.id
      },

      setRequisito2(requisito2Id){
        this.Item.requisito2 = requisito2Id.id
      },

      setRequisito3(requisito3Id){
        this.Item.requisito3 = requisito3Id.id
      },

      setCorrequisito(correquisitoId){
        this.Item.correquisito = correquisitoId.id
      }
    }
}
</script>
