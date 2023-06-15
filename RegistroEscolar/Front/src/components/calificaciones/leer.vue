<template>
  <div>
    <v-row justify="center">
    <!-- //READ ONLY -->
    <v-dialog
      v-model="readDialog"
      persistent
      max-width="800px"
    >
      <v-card class="rounded-xl pa-2">
        <div>
          <v-row
          justify="space-around"
          no-gutters>

          <v-col cols="7">
            <v-card-text class="font-weight-medium">
              <span>{{ Item.califMateriaClave }} - {{ Item.califMateriaNombre }}</span>
            </v-card-text>
          </v-col>

          <v-col v-if="Item.calificacion" cols="2">
            <v-card-text>
              Calif. {{ Item.calificacion }}
            </v-card-text>
          </v-col>

          <v-col cols="2">
            <v-chip v-if="Item.estatus == 'Aprobada'"
                class="ma-3"
                color="success"
                small
              >
                <span>{{Item.estatus}}</span>
              </v-chip>

              <v-chip v-if="Item.estatus == 'Cursando'"
                class="ma-3"
                color="info"
                small
              >
                <span>{{Item.estatus}}</span>
              </v-chip>

              <v-chip v-if="Item.estatus == 'No aprobada'"
                class="ma-3"
                color="warning"
                small
              >
                <span>{{Item.estatus}}</span>
              </v-chip>


              <v-chip v-if="Item.estatus == 'No cursada'"
                class="ma-3"
                color="disabled"
                small
              >
                <span>{{Item.estatus}}</span>
              </v-chip>
          </v-col>

          

          <v-col cols="10">
                <v-chip v-if="Item.recurso"
                  class="ma-1"
                  color="blue lighten-3"
                  small
                >
                <span>Recursada {{ Item.recurso }} veces</span>
                </v-chip>

                <v-chip v-if="Item.extraordinario"
                  class="ma-1"
                  color="blue lighten-4"
                  small
                >
                <span>Extraordinario</span>
                </v-chip>
          </v-col>

            <v-col cols="10">
              <v-card-text v-if="Item.requisito1Nombre">
                Requisito 1: <span >{{Item.requisito1Clave}} - {{ Item.requisito1Nombre }}</span>
                
                <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito1Estatus == 'Aprobada'"
                        class="ma-2"
                        color="success"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-check
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito1Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito1Estatus == 'Cursando'"
                        class="ma-2"
                        color="blue darken-1"
                        text-color="white"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-clock-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito1Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito1Estatus == 'No aprobada'"
                        class="ma-2"
                        color="warning"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-alert-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito1Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito1Estatus == 'No cursada'"
                        class="ma-2"
                        color="disabled"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-minus-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito1Estatus}}</span>
                  </v-tooltip>
              </v-card-text>
            </v-col>

            <v-col cols="10">
              <v-card-text v-if="Item.requisito2Nombre">
                Requisito 2: <span >{{Item.requisito2Clave}} - {{ Item.requisito2Nombre }}</span>
                <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito2Estatus == 'Aprobada'"
                        class="ma-2"
                        color="success"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-check
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito2Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito2Estatus == 'Cursando'"
                        class="ma-2"
                        color="blue darken-1"
                        text-color="white"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-clock-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito2Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito2Estatus == 'No aprobada'"
                        class="ma-2"
                        color="warning"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-alert-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito2Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito2Estatus == 'No cursada'"
                        class="ma-2"
                        color="disabled"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-minus-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito2Estatus}}</span>
                  </v-tooltip>
              </v-card-text>
            </v-col>

            <v-col cols="10">
              <v-card-text v-if="Item.requisito3Nombre">
                Requisito 3: <span >{{Item.requisito3Clave}} - {{ Item.requisito3Nombre }}</span>
                <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito3Estatus == 'Aprobada'"
                        class="ma-2"
                        color="success"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-check
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito3Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito3Estatus == 'Cursando'"
                        class="ma-2"
                        color="blue darken-1"
                        text-color="white"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-clock-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito3Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito3Estatus == 'No aprobada'"
                        class="ma-2"
                        color="warning"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-alert-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito3Estatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.requisito3Estatus == 'No cursada'"
                        class="ma-2"
                        color="disabled"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-minus-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.requisito3Estatus}}</span>
                  </v-tooltip>
              </v-card-text>
            </v-col>

            <v-col cols="10">
              <v-card-text v-if="Item.correquisitoNombre">
                Correquisito: <span > {{Item.correquisitoClave}} - {{ Item.correquisitoNombre }}</span>
                <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.correquisitoEstatus == 'Aprobada'"
                        class="ma-2"
                        color="success"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-check
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.correquisitoEstatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.correquisitoEstatus == 'Cursando'"
                        class="ma-2"
                        color="blue darken-1"
                        text-color="white"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-clock-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.correquisitoEstatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.correquisitoEstatus == 'No aprobada'"
                        class="ma-2"
                        color="warning"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-alert-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.correquisitoEstatus}}</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.correquisitoEstatus == 'No cursada'"
                        class="ma-2"
                        color="disabled"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                        <v-icon small>
                          mdi-minus-circle-outline
                        </v-icon>
                      </v-chip>
                    </template>
                    <span>{{Item.correquisitoEstatus}}</span>
                  </v-tooltip>
              </v-card-text>
            </v-col>

            

            <v-col cols="10">
              <v-card-text class="font-weight-medium" v-if="!Item.requisito1Nombre && !Item.requisito2Nombre && !Item.requisito3Nombre">
                Sin Requisitos
              </v-card-text>
            </v-col>

            <v-col cols="10">
              <v-card-text class="font-weight-medium" v-if="!Item.correquisitoNombre">
                Sin Correquisitos
              </v-card-text>
            </v-col>

            

            <v-col cols="12" sm="4">
              <v-card-text>
                Créditos de la materia: {{ Item.califMateriaCreditos }}
              </v-card-text>
            </v-col>

            <v-col sm="4">
              <v-card-text>
                Semestre: {{ Item.semestre }}
              </v-card-text>
            </v-col>

            <v-col cols="10">
              <v-card-text>
                Modulo: {{ Item.califModuloNombre }}
              </v-card-text>
            </v-col>

            <v-col cols="10">
              <v-card-text v-if="Item.estatus == 'Aprobada'">
                Aprobada en: {{ Item.periodo }}
              </v-card-text>
            </v-col>


            <v-col cols="10">
              <v-card-text v-if="Item.califMateriaClave == 'SSST'">
                <v-alert
                  dense
                  text
                  type="info"
                >
                <span class="text-h9">
                  Para inscribir la materia de servicio social se requiere al menos el <strong>70% de créditos </strong> acumulados
                </span>
                </v-alert>
              </v-card-text>

              <v-card-text v-if="Item.califMateriaClave == 'PPST'">
                <v-alert
                  dense
                  text
                  type="info"
                >
                  Para inscribir la materia de prácticas profesionales se requiere al menos el <strong>60% de créditos </strong> acumulados
                </v-alert>
              </v-card-text>
            </v-col>

          </v-row>
          <v-spacer></v-spacer>
          
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
  props:['readDialog', 'Item'],
  data() {
      return{
        alumnoId:this.$route.params.id
      }
    },
    methods:{
      ...mapActions('calificaciones', ['agregarCalificacion']),

      agregar(){
        this.$alertify.confirm(
        this.Item.id==0 ? '¿Desea  Agregar Calificacion?' : ' ¿Desea Editar Calificacion?',
        () => {
                this.agregarCalificacion(this.Item);
                this.cerrarDialogo( )
                this.$alertify.success(this.Item.id==0 ? 'Calificacion Agregada' : 'Calificacion Actualizada')
              },
        () => this.$alertify.error('Accion Cancelada')
      ).setHeader('<em> Confirmar Acción </em>');
        
      },
      cerrarDialogo(){
        this.$emit('readDialog',false)

      }
    }
}
</script>
