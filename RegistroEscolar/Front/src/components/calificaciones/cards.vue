<template>
  <div>
    <Nuevo :dialog="dialog" @dialog="dialog = $event" :Item="itemSelected" :MateriasFK="MateriasFK"/>
    <Leer :readDialog="readDialog" @readDialog="readDialog = $event" :Item="itemSelected"/>

    <div v-if="Items==0">
      <Vacio/>
    </div>

    <div v-else>
      <!--  DASHBOARD CALIFICACIONES -->
      <div>
      <!-- METRIC CALCULATIONS -->
      <div>
        <div>
          <span class="d-none">
            {{recursadasAcum=0,
              creditosAcum=0,
              creditosMin= 0,
              creditosSemestral= {sem1: 0,sem2: 0,sem3: 0,sem4: 0,sem5: 0,sem6: 0,sem7: 0,sem8: 0},
              creditosSemestralAcum= {sem1: 0,sem2: 0,sem3: 0,sem4: 0,sem5: 0,sem6: 0,sem7: 0,sem8: 0},
              creditosSemestralAcumPercent= {sem1: 0,sem2: 0,sem3: 0,sem4: 0,sem5: 0,sem6: 0,sem7: 0,sem8: 0},
              creditosAcumPercent= 0,
              promedioGeneral=0,
              materiasPromedioTotal=0
            }}
          </span>
        </div>
        <v-row class="d-none">
        <v-col 
          v-for="(Item,index) in Items"
          :key="index"
        >
          <div>
            <span v-if="Item.semestre == 'Primero'">{{ creditosSemestral.sem1 = creditosSemestral.sem1 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Segundo'">{{ creditosSemestral.sem2 = creditosSemestral.sem2 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Tercero'">{{ creditosSemestral.sem3 = creditosSemestral.sem3 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Cuarto'">{{ creditosSemestral.sem4 = creditosSemestral.sem4 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Quinto'">{{ creditosSemestral.sem5 = creditosSemestral.sem5 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Sexto'">{{ creditosSemestral.sem6 = creditosSemestral.sem6 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Séptimo'">{{ creditosSemestral.sem7 = creditosSemestral.sem7 + Item.califMateriaCreditos }}</span>
            <span v-if="Item.semestre == 'Octavo'">{{ creditosSemestral.sem8 = creditosSemestral.sem8 + Item.califMateriaCreditos }}</span>

            <v-col v-if="Item.estatus == 'Aprobada'">
              <span>Créditos Acumulados: {{creditosAcum = creditosAcum + Item.califMateriaCreditos}}</span>
              <span>{{ creditosMin = Item.califCarreraCreditosMin }}</span>
              <span v-if="Item.semestre == 'Primero'">{{ creditosSemestralAcum.sem1 = creditosSemestralAcum.sem1 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Segundo'">{{ creditosSemestralAcum.sem2 = creditosSemestralAcum.sem2 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Tercero'">{{ creditosSemestralAcum.sem3 = creditosSemestralAcum.sem3 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Cuarto'">{{ creditosSemestralAcum.sem4 = creditosSemestralAcum.sem4 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Quinto'">{{ creditosSemestralAcum.sem5 = creditosSemestralAcum.sem5 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Sexto'">{{ creditosSemestralAcum.sem6 = creditosSemestralAcum.sem6 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Séptimo'">{{ creditosSemestralAcum.sem7 = creditosSemestralAcum.sem7 + Item.califMateriaCreditos }}</span>
              <span v-if="Item.semestre == 'Octavo'">{{ creditosSemestralAcum.sem8 = creditosSemestralAcum.sem8 + Item.califMateriaCreditos }}</span>
              <span v-if="(Item.califMateriaClave != 'SSST') && (Item.califMateriaClave != 'PPST')">{{ materiasPromedioTotal= materiasPromedioTotal+1 }}</span>
              <span v-if="(Item.califMateriaClave != 'SSST') && (Item.califMateriaClave != 'PPST')">{{ promedioGeneral = promedioGeneral+Item.calificacion }}</span>
            </v-col>
            <span v-if="Item.recurso">{{recursadasAcum++}}</span>
          </div>
        </v-col>
      </v-row>

      </div>
      
      <!-- METRIC VISUALIZATION -->
      <div class="mx-auto text-center ma-4" width=100% v-if="Items">
        <v-container class="blue lighten-5">
        <h3 class="ma-2">Resumen</h3>

          <v-row no-gutters>
            <v-col
              cols="12"
              sm="5"
              class="mx-auto"
            >
              <v-card
                class="pa-2 rounded-lg"
                tile
              >
              <v-card-text>
                  <h3 class="ma-4 text-center" v-if="Items!=0">Créditos Acumulados: {{creditosAcum}} de {{ creditosMin }}</h3>
                  <span class="d-none"> ({{ creditosAcumPercent = (creditosAcum/creditosMin)*100 }}%)</span>
                  <v-progress-linear
                    class="neutral--text"
                    color="primary"
                    height="19"
                    v-model = "creditosAcumPercent"
                    striped
                    rounded
                  >
                  <span >{{ creditosAcumPercent }}% </span>
                  </v-progress-linear>
                  <p class="text-h9 ma-1">
                    Progreso de la Carrera
                  </p>
                  <v-tooltip bottom>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip
                        color="secondary"
                        v-bind="attrs"
                        v-on="on"
                        small
                        outlined
                      >
                      <span class="font-weight-medium">Promedio General: {{ parseFloat(promedioGeneral/materiasPromedioTotal).toFixed(2) }}</span>
                      <v-icon v-if="((parseFloat(promedioGeneral/materiasPromedioTotal).toFixed(2) >= 8.5) && (recursadasAcum==0))"
                          class="ml-2"
                          small
                          color="success"
                        >
                          mdi mdi-check
                      </v-icon>
                      <v-icon v-if="((parseFloat(promedioGeneral/materiasPromedioTotal).toFixed(2) < 8.5) && (recursadasAcum==0))"
                          class="ml-2"
                          small
                          color="orange"
                        >
                          mdi mdi-alert-octagon
                      </v-icon>
                      <v-icon v-if="((parseFloat(promedioGeneral/materiasPromedioTotal).toFixed(2) < 8.5) && (recursadasAcum>0))"
                          class="ml-2"
                          small
                          color="warning"
                        >
                          mdi mdi-close-thick
                      </v-icon>
                    </v-chip>
                    </template>
                    <span v-if="((parseFloat(promedioGeneral/materiasPromedioTotal).toFixed(2) >= 8.5) && (recursadasAcum==0))">El alumno es candidato a titulación por promedio</span>
                    <span v-else>El alumno no es candidato a titulación por promedio</span>
                    <v-spacer></v-spacer>
                    <span v-if="(parseFloat(promedioGeneral/materiasPromedioTotal).toFixed(2) < 8.5)"> - Promedio menor a 8.5</span>
                    <v-spacer></v-spacer>
                    <span v-if="(recursadasAcum>0)"> - Ha recursado materias</span>
                  </v-tooltip>
                </v-card-text>
              </v-card>
            </v-col>

            <v-col
              cols="12"
              sm="6"
              class="mx-auto"
            >
              <v-card
                class="pa-2 rounded-lg"
                tile
              >
              <v-row>
                <v-col>
                  <v-chip label small  color="primary" class="ma-2">
                    <span class="d-none">{{ creditosSemestralAcum.sem1 }}/{{ creditosSemestral.sem1 }} </span>
                      <span class="font-weight-light ">1er Semestre: {{ creditosSemestralAcumPercent.sem1 = parseInt((creditosSemestralAcum.sem1 / creditosSemestral.sem1) * 100) }}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem1 }}/{{ creditosSemestral.sem1 }}</span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem1"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>

                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none"> {{ creditosSemestralAcum.sem2 }}/{{ creditosSemestral.sem2 }} </span>
                      <span class="font-weight-light">2do Semestre: {{ creditosSemestralAcumPercent.sem2 = parseInt((creditosSemestralAcum.sem2 / creditosSemestral.sem2) * 100) }}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem2 }}/{{ creditosSemestral.sem2 }} </span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem2"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>

                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none "> {{ creditosSemestralAcum.sem3 }}/{{ creditosSemestral.sem3 }} </span>
                      <span class="font-weight-light">3er Semestre: {{ creditosSemestralAcumPercent.sem3 = parseInt((creditosSemestralAcum.sem3 / creditosSemestral.sem3) * 100) }}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem3 }}/{{ creditosSemestral.sem3 }}</span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem3"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>

                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none">{{ creditosSemestralAcum.sem4 }}/{{ creditosSemestral.sem4 }} </span>
                      <span class="font-weight-light">4to Semestre: {{ creditosSemestralAcumPercent.sem4 = parseInt((creditosSemestralAcum.sem4 / creditosSemestral.sem4) * 100) }}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem4 }}/{{ creditosSemestral.sem4 }}</span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem4"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>

                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none ">{{ creditosSemestralAcum.sem5 }}/{{ creditosSemestral.sem5 }} </span>
                      <span class="font-weight-light">5to Semestre: {{ creditosSemestralAcumPercent.sem5 = parseInt((creditosSemestralAcum.sem5 / creditosSemestral.sem5) * 100)}}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem5 }}/{{ creditosSemestral.sem5 }}</span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem5"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>

                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none ">{{ creditosSemestralAcum.sem6 }}/{{ creditosSemestral.sem6 }} </span>
                      <span class="font-weight-light">6to Semestre: {{ creditosSemestralAcumPercent.sem6 = parseInt((creditosSemestralAcum.sem6 / creditosSemestral.sem6) * 100) }}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem6 }}/{{ creditosSemestral.sem6 }}</span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem6"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>
                  
                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none">{{ creditosSemestralAcum.sem7 }}/{{ creditosSemestral.sem7 }} </span>
                      <span class=" font-weight-light">7mo Semestre: {{ creditosSemestralAcumPercent.sem7 = parseInt((creditosSemestralAcum.sem7 / creditosSemestral.sem7) * 100)}}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem7 }}/{{ creditosSemestral.sem7 }}</span>
                        </v-tooltip>
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem7"
                          absolute
                          bottom
                        >
                        
                      </v-progress-linear>
                    </v-chip>

                    <v-chip label small  color="primary" class="ma-2">
                      <span class="d-none">{{ creditosSemestralAcum.sem8 }}/{{ creditosSemestral.sem8 }} </span>
                      <span class="font-weight-light">8vo Semestre: {{ creditosSemestralAcumPercent.sem8 = parseInt((creditosSemestralAcum.sem8 / creditosSemestral.sem8) * 100) }}% </span>
                      <v-tooltip top>
                          <template v-slot:activator="{ on, attrs }">
                            <v-icon
                              class="ml-2 mr-2"
                              small
                              v-bind="attrs"
                              v-on="on"
                            >
                              mdi mdi-information-outline
                            </v-icon>
                          </template>
                          <span>{{ creditosSemestralAcum.sem8 }}/{{ creditosSemestral.sem8 }} </span>
                        </v-tooltip>  
                      <v-progress-linear
                          class="neutral--text"
                          color="secondary"
                          height="5"
                          v-model = "creditosSemestralAcumPercent.sem8"
                          absolute
                          bottom
                        ></v-progress-linear>
                    </v-chip>
                    <p class="text-h9 ma-2">
                      Créditos por semestre
                    </p>
                </v-col>
              </v-row>
              </v-card>
            </v-col>
            
            <v-col
              cols="8"
              sm="7"
              class="mx-auto ma-4"
            >
              <v-card
                class="pa-2 rounded-lg"
                tile
              >
              <v-card-text>
                <v-sheet color="neutral">
                  <v-sparkline
                    :labels="labels"
                    :value="[parseInt(creditosSemestralAcumPercent.sem1),
                              parseInt(creditosSemestralAcumPercent.sem2),
                              parseInt(creditosSemestralAcumPercent.sem3),
                              parseInt(creditosSemestralAcumPercent.sem4),
                              parseInt(creditosSemestralAcumPercent.sem5),
                              parseInt(creditosSemestralAcumPercent.sem6),
                              parseInt(creditosSemestralAcumPercent.sem7),
                              parseInt(creditosSemestralAcumPercent.sem8)]"
                    color="primary"
                    height="100"
                    padding="24"
                    stroke-linecap="round"
                    smooth
                    fill
                  >
                    <template v-slot:label="item">
                      {{ item.value }}º
                    </template>
                  </v-sparkline>
                </v-sheet>
              </v-card-text>

              <v-card-text>
                <div class="text-h9">
                  Progreso por semestre
                </div>
              </v-card-text>
              </v-card>
            </v-col>
          </v-row>
        </v-container>
      </div>
      
      </div>
    </div>

    <!-- CALIFICATIONS DETAILS -->
    <div >
    <h2 class="text-center ma-4">Detalles</h2>

    <v-row class="mb-8">

      <!-- BTN NUEVA CALIFICACION -->
      <v-col cols="12" v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)">
        <div class="ma-4">
          <v-btn
            color="secondary"
            dark
            class="mb-2 rounded-lg"
            @click="newItem()"
          >
            Nueva Calificación
          </v-btn>
        </div>
      </v-col>

      <!-- APROBADAS SWITCH -->
      <v-col v-if="Items!=0"
        class="mx-auto"
        cols="10"
        sm="2"
      >
        
        <v-tooltip top>
          <template v-slot:activator="{ on, attrs }">
            <div
              class=" d-flex ma-2"
              v-bind="attrs"
              v-on="on"
            >
              <v-switch
                v-model="aprobadasSwitch"
                label="Aprobadas"
                color="success"
              > 
              </v-switch>
            </div>
          </template>
          <span>Materias inscritas y aprobadas satisfactoriamente</span>
        </v-tooltip>
      </v-col>

      <!-- NO APROBADAS SWITCH -->
      <v-col v-if="Items!=0"
        class="mx-auto"
        sm="2"
      >
        
        <v-tooltip top>
          <template v-slot:activator="{ on, attrs }">
            <div
              class=" d-flex ma-2"
              v-bind="attrs"
              v-on="on"
            >
            <v-switch
              v-model="noAprobadasSwitch"
              label="No Aprobadas"
              color="warning"
            ></v-switch>
            </div>
          </template>
          <span>Materias previamente inscritas que se han reprobado</span>
        </v-tooltip>
      </v-col>

      <!-- CURSANDO SWITCH -->
      <v-col v-if="Items!=0"
        class="mx-auto"
        sm="2"
      >
        
        <v-tooltip top>
          <template v-slot:activator="{ on, attrs }">
            <div
              class=" d-flex ma-2"
              v-bind="attrs"
              v-on="on"
            >
            <v-switch
              v-model="cursandoSwitch"
              label="Cursando"
              color="info"
            ></v-switch>
            </div>
          </template>
          <span>Materias inscritas en el periodo actual</span>
        </v-tooltip>
      </v-col>

      <!-- NO CURSADAS SWITCH -->
      <v-col v-if="Items!=0"
        class="mx-auto"
        sm="2"
      >

        <v-tooltip top>
          <template v-slot:activator="{ on, attrs }">
            <div
              class=" d-flex ma-2"
              v-bind="attrs"
              v-on="on"
            >
            <v-switch
              v-model="noCursadasSwitch"
              label="No Cursadas"
              color="disabled"
            ></v-switch>
            </div>
          </template>
          <span>Materias que no han sido inscritas</span>
        </v-tooltip>
      </v-col>


      <!-- CONTEO DE MATERIAS -->
      <v-col v-if="Items!=0" cols="12">
        <span class="d-none">{{AprobadasAcum=0, noAprobadasAcum=0, cursandoAcum=0, noCursadasAcum=0, recursadasAcum=0}}</span>

        <v-container class="pa-0 d-none"
          v-for="(Item,key) in Items"
          :key="key"
        >
          <span class="d-none" v-if="Item.estatus == 'Aprobada' && aprobadasSwitch">{{AprobadasAcum++}}</span>
          <span class="d-none" v-if="Item.estatus == 'No aprobada' && noAprobadasSwitch">{{noAprobadasAcum++}}</span>
          <span class="d-none" v-if="Item.estatus == 'Cursando' && cursandoSwitch">{{cursandoAcum++}}</span>
          <span class="d-none" v-if="Item.estatus == 'No cursada' && noCursadasSwitch">{{noCursadasAcum++}}</span>
          <span class="d-none" v-if="Item.recurso">{{recursadasAcum++}}</span>
        </v-container>

        <v-col cols="12" class="text-center">
          <span class="text-center success--text ml-4 mr-4" v-if="aprobadasSwitch">Total Materias Aprobadas: <strong>{{AprobadasAcum}}</strong></span>
          <span class="text-center warning--text ml-4 mr-4" v-if="noAprobadasSwitch">Total Materias No Aprobadas: <strong>{{noAprobadasAcum}}</strong></span>
          <span class="text-center info--text ml-4 mr-4" v-if="cursandoSwitch">Total Materias Cursando: <strong>{{cursandoAcum}}</strong></span>
          <span class="text-center disabled--text ml-4 mr-4" v-if="noCursadasSwitch">Total Materias No Cursadas: <strong>{{noCursadasAcum}}</strong></span>
          <v-spacer></v-spacer>
          <span class="text-center orange--text ml-4 mr-4" v-if="aprobadasSwitch || noAprobadasSwitch || cursandoSwitch">Total Materias Recursadas: <strong>{{recursadasAcum}}</strong></span>
        </v-col>  
      </v-col>
      
      <!-- DETALLES CALIFICACIONES -->
      <v-container class="pa-0"
        v-for="(Item,index) in Items"
        :key="index"
      >

        <!-- APROBADAS CARDS -->
        <v-card
          
          class="ml-10 mr-10 mt-1 mb-1 rounded-lg"
          :class="cardBackground(Item)"
          v-if="Item.estatus == 'Aprobada' && aprobadasSwitch"
        >
          <v-card-text >
            <v-row
              justify="space-around"
              no-gutters
            >
              <v-col cols="12" sm="10">
                <div class="ma-2">
                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.recurso"
                        class="mr-1"
                        color="cyan lighten-2"
                        v-bind="attrs"
                        v-on="on"
                        small
                      >
                      <span>Rec. {{ Item.recurso }}</span>
                      </v-chip>
                    </template>
                    <span>El alumno recursó la materia {{ Item.recurso }} veces</span>
                  </v-tooltip>

                  <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-chip v-if="Item.extraordinario"
                        class="ml-1"
                        color="cyan lighten-3"
                        v-bind="attrs"
                        v-on="on"
                        small
                      >
                      <span>Extra.</span>
                      </v-chip>
                    </template>
                    <span>El alumno tomó extraordinario de la materia</span>
                  </v-tooltip>
                  <span><strong> {{Item.califMateriaClave}} - {{ Item.califMateriaNombre }}</strong></span>
                </div>
              </v-col>

              <v-col cols="2" class="pa-2">
                <span class="text-center font-weight-bold">Calif.: {{ Item.calificacion }}</span>
              </v-col>

              <v-col cols="2">
                <span>Semestre: {{ Item.semestre }}</span>
              </v-col>
              <v-col cols="8">
                <span>Módulo: {{ Item.califModuloNombre }}</span>
              </v-col>

              

              <v-col cols="3">
                <span>Créditos Obtenidos {{ Item.califMateriaCreditos }}</span>
              </v-col>

              <v-col cols="4">
                <span>Acreditada en {{ Item.periodo }}</span>
              </v-col>

              <v-col cols="3">
                <v-card-actions class="d-flex justify-center">
                    <!-- -----------------------VER DETALLES-------------------------- -->

                    <v-tooltip top>
                    <template v-slot:activator="{ on, attrs }">
                      <v-btn
                        color="primary"
                        class="d-flex justify-center mr-1 ml-1 rounded-lg"
                        @click="verDetalles(Item)"
                        v-bind="attrs"
                        v-on="on"
                        small
                      >
                        <v-icon >mdi mdi-eye-outline</v-icon>
                      </v-btn>
                    </template>
                    <span>Ver Detalles</span>
                  </v-tooltip>

                  <div>
                    <!-- -----------------------EDITAR-------------------------- -->
                    <v-tooltip top >
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          :disabled="alumnoEstatus(Item)"
                          color="neutral"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="editItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-pencil</v-icon>
                        </v-btn>
                      </template>
                      <span>Editar Estatus</span>
                    </v-tooltip>
                    </div>

                      <!-- -----------------------ELIMINAR-------------------------- -->
                    <div >
                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          :disabled="alumnoEstatus(Item)"
                          color="error"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="deleteItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-delete</v-icon>
                        </v-btn>
                      </template>
                      <span>Eliminar</span>
                    </v-tooltip>
                  </div>
                  
                </v-card-actions>
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>

        <!-- NO APROBADAS CARDS -->
        <v-card
            class="ml-10 mr-10 mt-1 mb-1 rounded-lg"
            :class="cardBackground(Item)"
            v-if="Item.estatus == 'No aprobada' && noAprobadasSwitch"
        >
            <v-card-text >
              
              <v-row
                justify="space-around"
                no-gutters
              >
                <v-col cols="12" sm="10">
                  <v-card-text>
                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-chip v-if="Item.recurso"
                          class="mr-1"
                          color="cyan lighten-2"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                        <span>Rec. {{ Item.recurso }}</span>
                        </v-chip>
                      </template>
                      <span>El alumno recursó la materia {{ Item.recurso }} veces</span>
                    </v-tooltip>

                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-chip v-if="Item.extraordinario"
                          class="ml-1"
                          color="cyan lighten-3"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                        <span>Extra.</span>
                        </v-chip>
                      </template>
                      <span>El alumno tomó extraordinario de la materia</span>
                    </v-tooltip>
                    <span><strong> {{Item.califMateriaClave}} - {{ Item.califMateriaNombre }}</strong></span>
                  </v-card-text>
                </v-col>

                <v-col cols="2" class="pa-2">
                <span class="text-center font-weight-bold">Calif.: {{ Item.calificacion }}</span>
              </v-col>

                <v-col cols="2">
                  <span>Semestre: {{ Item.semestre }}</span>
                </v-col>
                <v-col cols="8">
                  <span>Módulo: {{ Item.califModuloNombre }}</span>
                </v-col>

                <v-col cols="3">
                  <span>Créditos Obtenibles {{ Item.califMateriaCreditos }}</span>
                </v-col>

                <v-col cols="4">
                  <span>Inscrita en {{ Item.periodo }}</span>
                </v-col>

                <v-col cols="3">
                  <v-card-actions class="d-flex justify-center">
                      <!-- -----------------------VER DETALLES-------------------------- -->

                      <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn
                          color="primary"
                          class="d-flex justify-center ml-1 mr-1"
                          @click="verDetalles(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-eye-outline</v-icon>
                        </v-btn>
                      </template>
                      <span>Ver Detalles</span>
                    </v-tooltip>


                    <!-- -----------------------EDITAR-------------------------- -->
                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          color="neutral"
                          class="d-flex justify-center ml-1 mr-1"
                          @click="editItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-pencil</v-icon>
                        </v-btn>
                      </template>
                      <span>Editar Estatus</span>
                    </v-tooltip>

                      <!-- -----------------------ELIMINAR-------------------------- -->

                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          color="error"
                          class="d-flex justify-center ml-1 mr-1"
                          @click="deleteItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-delete</v-icon>
                        </v-btn>
                      </template>
                      <span>Eliminar</span>
                    </v-tooltip>
                  </v-card-actions>
                </v-col>
              </v-row>
            </v-card-text>
        </v-card>

        <!-- CURSANDO CARDS -->
        <v-card
          class="ml-10 mr-10 mt-1 mb-1 rounded-lg"
          :class="cardBackground(Item)"
          v-if="Item.estatus == 'Cursando' && cursandoSwitch"
        >
        
            <v-card-text>
              <v-row
                justify="space-around"
                no-gutters
              >
                <v-col cols="12" sm="10">
                  <v-card-text>
                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-chip v-if="Item.recurso"
                          class="mr-1"
                          color="cyan lighten-2"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                        <span>Rec. {{ Item.recurso }}</span>
                        </v-chip>
                      </template>
                      <span>El alumno recursó la materia {{ Item.recurso }} veces</span>
                    </v-tooltip>

                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-chip v-if="Item.extraordinario"
                          class="ml-1"
                          color="cyan lighten-3"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                        <span>Extra.</span>
                        </v-chip>
                      </template>
                      <span>El alumno tomó extraordinario de la materia</span>
                    </v-tooltip>
                    <span class="text--primary font-weight-medium"> {{Item.califMateriaClave}} - {{ Item.califMateriaNombre }}</span>
                  </v-card-text>
                </v-col>

                <v-col cols="2" class="pa-2">
                <span v-if="Item.calificacion" class="text-center font-weight-bold">Calif.: {{ Item.calificacion }}</span>
              </v-col>

                <v-col cols="2">
                  <span>Semestre: {{ Item.semestre }}</span>
                </v-col>
                <v-col cols="8">
                  <span>Módulo: {{ Item.califModuloNombre }}</span>
                </v-col>

                

                <v-col cols="3">
                  <span>Créditos Obtenibles {{ Item.califMateriaCreditos }}</span>
                </v-col>

                <v-col cols="4">
                  <span>Inscrita en {{ Item.periodo }}</span>
                </v-col>

                <v-col cols="3">
                  <v-card-actions class="d-flex justify-center">
                      <!-- -----------------------VER DETALLES-------------------------- -->

                      <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn
                          color="primary"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="verDetalles(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-eye-outline</v-icon>
                        </v-btn>
                      </template>
                      <span>Ver Detalles</span>
                    </v-tooltip>


                    <!-- -----------------------EDITAR-------------------------- -->
                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          color="neutral"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="editItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-pencil</v-icon>
                        </v-btn>
                      </template>
                      <span>Editar Estatus</span>
                    </v-tooltip>

                      <!-- -----------------------ELIMINAR-------------------------- -->

                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          color="error"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="deleteItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-delete</v-icon>
                        </v-btn>
                      </template>
                      <span>Eliminar</span>
                    </v-tooltip>
                  </v-card-actions>
                </v-col>
              </v-row>
            </v-card-text>
        </v-card>

        <!-- NO CURSADAS CARDS -->
        <v-card
          class="ml-10 mr-10 mt-1 mb-1 rounded-lg"
          :class="cardBackground(Item)"
          v-if="Item.estatus == 'No cursada' && noCursadasSwitch"
        >
            <v-card-text >
              <v-row
                justify="space-around"
                no-gutters
              >
                <v-col cols="12">
                  <v-card-text>
                    <span><strong> {{Item.califMateriaClave}} - {{ Item.califMateriaNombre }}</strong></span>
                  </v-card-text>
                </v-col>

                <v-col cols="2">
                  <span>Semestre: {{ Item.semestre }}</span>
                </v-col>
                <v-col cols="8">
                  <span>Módulo: {{ Item.califModuloNombre }}</span>
                </v-col>

                <v-col cols="7">
                  <span>Créditos Obtenibles {{ Item.califMateriaCreditos }}</span>
                </v-col>
                <v-col cols="3">
                  <v-card-actions class="d-flex justify-center">
                      <!-- -----------------------VER DETALLES-------------------------- -->

                      <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn
                          color="primary"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="verDetalles(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-eye-outline</v-icon>
                        </v-btn>
                      </template>
                      <span>Ver Detalles</span>
                    </v-tooltip>


                    <!-- -----------------------EDITAR-------------------------- -->
                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          color="neutral"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="editItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-pencil</v-icon>
                        </v-btn>
                      </template>
                      <span>Editar Estatus</span>
                    </v-tooltip>

                      <!-- -----------------------ELIMINAR-------------------------- -->

                    <v-tooltip top>
                      <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="(username!=AlumnoFK[0].matricula) && (username.length!=9)"
                          color="error"
                          class="d-flex justify-center mr-1 ml-1 rounded-lg"
                          @click="deleteItem(Item)"
                          v-bind="attrs"
                          v-on="on"
                          small
                        >
                          <v-icon>mdi mdi-delete</v-icon>
                        </v-btn>
                      </template>
                      <span>Eliminar</span>
                    </v-tooltip>
                  </v-card-actions>
                </v-col>
              </v-row>
            </v-card-text>
        </v-card>
      </v-container>
    </v-row>

    </div>
  </div>
</template>

<script>

  import AuthService from '@/services/AuthService.js';
  import {mapActions} from 'vuex'
  import Nuevo from './nuevo.vue'
  import Leer from './leer.vue'
  import Vacio from '@/components/vacio.vue'

  const gradients = [
    ['#222'],
    ['#42b3f4'],
    ['red', 'orange', 'yellow'],
    ['purple', 'violet'],
    ['#00c6ff', '#F0F', '#FF0'],
    ['blue-darken-4', 'blue-lighten-5'],
  ]

  export default {
    props:['Items', 'MateriasFK', 'AlumnoFK'],

    components:{
      Nuevo,
      Leer,
      Vacio
    },

    data(){
      return {
        aprobadasSwitch: false,
        noAprobadasSwitch: false,
        noCursadasSwitch: false,
        cursandoSwitch: true,
        search: '',
        dialog: false,
        readDialog: false,
        itemSelected:{}, 
        alumnoId:this.$route.params.id,
        username:'',
        fill: true,
        selectedGradient: gradients[6],
        gradients,
        padding: 10,
        radius: 10,
        labels: [
          '1',
          '2',
          '3',
          '4',
          '5',
          '6',
          '7',
          '8',
        ],
        width: 2,
      }
    },

    async created() {
      if (!this.$store.getters.isLoggedIn) {
        this.$router.push('/');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

    methods:{
      ...mapActions('calificaciones', ['eliminarCalificacion', 'leerCalificacion']),

      newItem(){
        this.itemSelected={
          id:0,
          estatus: null,
          periodo: null,
          extraordinario: false,
          recurso: null,
          calificacion: null,
          idalumno:this.alumnoId,
          idmateria:null
        }
        this.dialog = true;
      },


      verDetalles(item){
        this.itemSelected= item;
        this.readDialog = true;
      },
      
      editItem(item){
        this.itemSelected= item;
        this.dialog = true;
      },

      deleteItem(item){
        console.log(item);
        this.$alertify.confirm(
          '¿Eliminar Calificación de "'+item.califMateriaNombre+'"?',
          () => {
                  this.eliminarCalificacion(item);
                  
                  this.$alertify.success(item.califMateriaNombre + ' Ha Sido Eliminada')
                },
          () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
      },

      cardBackground (Item) {
        if(Item.estatus == 'Aprobada'){
          return 'aprobada';
        }
        else if(Item.estatus == 'No aprobada'){
          return 'no-aprobada';
        }
        else if(Item.estatus == 'Cursando'){
          return 'cursando';
        }
        else{
          return 'no-cursada';
        }
      },

      alumnoEstatus(Item){
        if(Item.estatusAlumno == 'Egresado'){
          return true
        }
        else{ return false}
      },
    },

  }
</script>
