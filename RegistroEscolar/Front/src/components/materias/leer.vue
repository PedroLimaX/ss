<template>
  <div>
    <v-row justify="center">
    <v-dialog
      v-model="readDialog"
      persistent
      max-width="800px"
    >
      <v-card class="mx-auto rounded-lg pa-2">
        <div>
          <v-card-title>
              <span>  {{ Item.clave }}</span>
              <v-spacer></v-spacer>
                Créditos: <span>{{ Item.creditos }}</span>
              <v-spacer></v-spacer>
            </v-card-title>
            <v-card-title>
            <span>{{ Item.nombre }}</span>
          </v-card-title>
          <v-spacer></v-spacer>

          <v-row
          justify="space-around"
          no-gutters>
            <v-col cols="6">
              <v-card-text>
                Horas Teoria Semanal: <span >{{ Item.ht }}</span>
              </v-card-text>
            </v-col>
            <v-col cols="6">
              <v-card-text>
                Horas Practica Semanal: <span>{{ Item.hp }}</span>
              </v-card-text>
            </v-col>
          </v-row>


            <v-card-text>
            Horas Totales Semestral: <span>{{ Item.totalh }}</span>
          </v-card-text>
          <v-spacer></v-spacer>


          <v-row
          justify="space-around"
          no-gutters>
            <v-col v-if="Item.requisito" cols="12" sm="12">
              <v-card-text class="font-weight-medium">
                Requisito 1: <span> {{Item.requisito1Clave}} - {{ Item.requisito1Nombre }}</span>
              </v-card-text>
            </v-col>
            <v-col v-if="Item.requisito2" sm="12">
              <v-card-text class="font-weight-medium">
                Requisito 2: <span>{{Item.requisito2Clave}} - {{ Item.requisito2Nombre }}</span> 
              </v-card-text>
            </v-col>

            <v-col v-if="Item.requisito3" sm="12">
              <v-card-text class="font-weight-medium">
                Requisito 3: <span>{{Item.requisito3Clave}} - {{ Item.requisito3Nombre }}</span> 
              </v-card-text>
            </v-col>

            <v-col v-if="Item.correquisito" cols="12">
              <v-card-text class="font-weight-medium">
                Correquisito: <span>{{Item.correquisitoClave}} - {{ Item.correquisitoNombre }}</span> 
              </v-card-text>
            </v-col>
          </v-row>
          
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
              color="neutral"
              @click="cerrarDialogo()"
              small
            >
              Cerrar
            </v-btn>
          </v-card-actions>
        </div>
        
      </v-card>
    </v-dialog>
  </v-row>
  </div>
</template>

<script>
import {mapActions} from 'vuex'
export default {
  props:['readDialog', 'Item', 'RequisitoFK','CorrequisitoFK'],
  data() {
      return{
        requisitoFK:this.RequisitoFK,
        correquisitoFK:this.CorrequisitoFK,
        moduloId:this.$route.params.id,
      }
    },
    methods:{
      ...mapActions('materias', ['agregarMateria']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Materia' : ' ¿Desea Editar Materia?',
        () => {
                this.agregarMateria(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Materia Agregada' : 'Materia Actualizada')
              },
        () => this.$alertify.error('Accion Cancelada')
      ).setHeader('<em> Confirmar Acción </em>');
        
      },
      cerrarDialogo(){
        this.$emit('readDialog',false)
      },

    }
}
</script>
