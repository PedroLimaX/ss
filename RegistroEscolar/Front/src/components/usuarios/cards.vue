<template>
  <div>
    <v-col 
      v-for="(Item,index) in Items"
        :key="index"
        class="ma-4"
      >

      <!-- -----------------------------------Administrador------------------------------------ -->
      <div v-if="username === 'administrador'" class="mx-auto text-center">
        <!-- <v-avatar size="200">
          <v-img
            class="mx-auto"
            src="../../../src/assets/img/xd.gif"
          ></v-img>
        </v-avatar> -->
        <div class="mx-auto disabled text-center">
        <v-img 
          width="200"
          class="mx-auto"
          src="../../../src/assets/img/admin.png"
        ></v-img>
      </div>
        <h1>Administrador</h1>
        <v-row justify="center">
          <v-col cols="4" class="ma-4 text-center">
            <v-card elevation="0" class="text-center ml-4 mr-4">
            <v-card-actions class="d-flex justify-center ml-10 mr-10">
            <!-- -----------------------VER SEDES-------------------------- -->
            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="secondary"
                  class="d-flex justify-center ma-4 bordered rounded-lg"
                  @click="sedes()"
                  v-bind="attrs"
                  v-on="on"
                >
                  <span>Sedes</span>
                </v-btn>
              </template>
              <span>Ver Sedes</span>
            </v-tooltip>

            <!-- -----------------------VER TUTORES-------------------------- -->

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="secondary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="tutores()"
                  v-bind="attrs"
                  v-on="on"
                >
                  <span>Tutores</span>
                </v-btn>
              </template>
              <span>Ver Tutores</span>
            </v-tooltip>

            <v-tooltip top>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="secondary"
                  class="d-flex justify-center ma-4 rounded-lg"
                  @click="usuarios()"
                  v-bind="attrs"
                  v-on="on"
                >
                  <span>Usuarios</span>
                </v-btn>
              </template>
              <span>Ver Usuarios</span>
            </v-tooltip>
            <v-spacer></v-spacer>
          </v-card-actions>
          </v-card>
          </v-col>
          <v-col cols="12" class="text-center">
          <v-container>
            <v-row justify="center">
              <v-col cols="8">
                <v-expansion-panels accordion>
                <v-expansion-panel>
                  <v-expansion-panel-header><h3>¿Qué puede hacer el Administrador?</h3></v-expansion-panel-header>
                  <v-expansion-panel-content align="start">
                    El usuario administrador tiene acceso a las siguientes vistas del sistema:
                    <v-timeline
                      align-top
                      dense
                    >
                      <v-timeline-item
                        small
                        align="left"
                      >
                        <div>
                          <div class="font-weight-normal">
                            <strong>Vista Sedes:</strong> Ver, Crear, Editar y Eliminar Sedes
                          </div>
                        </div>
                      </v-timeline-item>
                      <v-timeline-item
                      color="secondary"
                      small
                        align="left"
                      >
                        <div>
                          <div class="font-weight-normal">
                            <strong>Vista Carreras:</strong> Ver, Crear, Editar y Eliminar Carreras por Sede
                          </div>
                        </div>
                      </v-timeline-item>
                      <v-timeline-item
                      color="neutral"
                      small
                        align="left"
                      >
                        <div>
                          <div class="font-weight-normal">
                            <strong>Vista Semestres:</strong> Ver, Crear, Editar y Eliminar Semestres por Carrera
                          </div>
                        </div>
                      </v-timeline-item>
                      <v-timeline-item
                      color="primary"
                      small
                      align="left"
                      >
                        <div>
                          <div class="font-weight-normal">
                            <strong>Vista Modulos:</strong> Ver, Crear, Editar y Eliminar Modulos por Semestre
                          </div>
                        </div>
                      </v-timeline-item>
                      <v-timeline-item
                        color="secondary"
                        small
                        align="left"
                      >
                        <div>
                          <div class="font-weight-normal">
                            <strong>Vista Materias:</strong> Ver, Crear, Editar y Eliminar Materias por Modulo
                          </div>
                        </div>
                      </v-timeline-item>
                    </v-timeline>
                    
                  </v-expansion-panel-content>
                  <v-expansion-panel-content align="start">
                    <v-timeline
                      align-top
                      dense
                    >
                      <v-timeline-item
                        color="neutral"
                        small
                        align="left"
                        >
                          <div>
                            <div class="font-weight-normal">
                              <strong>Vista Tutores:</strong> Ver, Crear, Editar y Eliminar Tutores
                            </div>
                          </div>
                      </v-timeline-item>
                      <v-timeline-item
                        color="primary"
                        small
                        align="left"
                        >
                          <div>
                            <div class="font-weight-normal">
                              <strong>Vista Alumnos:</strong> Ver, Crear, Editar y Eliminar Alumnos por Tutor
                            </div>
                          </div>
                      </v-timeline-item>
                      <v-timeline-item
                        color="secondary"
                        small
                        align="left"
                        >
                          <div>
                            <div class="font-weight-normal">
                              <strong>Vista Calificaciones:</strong> Ver, Crear, Editar y Eliminar Calificaciones por Alumno
                            </div>
                          </div>
                      </v-timeline-item>
                    </v-timeline>
                  </v-expansion-panel-content>
                  <v-expansion-panel-content align="start">
                    <v-timeline
                      align-top
                      dense
                    >
                      <v-timeline-item
                        color="neutral"
                        small
                        align="left"
                        >
                          <div>
                            <div class="font-weight-normal">
                              <strong>Vista Grupos:</strong> Ver, Crear, Editar y Eliminar Grupos por Carrera
                            </div>
                          </div>
                      </v-timeline-item>
                    </v-timeline>
                  </v-expansion-panel-content>
                  <v-expansion-panel-content align="start">
                    <v-timeline
                      align-top
                      dense
                    >
                      <v-timeline-item
                        color="primary"
                        small
                        align="left"
                        >
                          <div>
                            <div class="font-weight-normal">
                              <strong>Vista Usuarios:</strong> Ver, Registrar, Restablecer y Eliminar Usuarios
                            </div>
                          </div>
                      </v-timeline-item>
                    </v-timeline>
                  </v-expansion-panel-content>
                </v-expansion-panel>
                </v-expansion-panels>
              </v-col>
            </v-row>
            <v-row justify="center">
          <v-col cols="10" sm="8">
            <v-expansion-panels accordion>
            <v-expansion-panel>
              <v-expansion-panel-header><h3>¿Qué puede hacer el Tutor?</h3></v-expansion-panel-header>
              <v-expansion-panel-content align="start">
                <v-timeline
                  align-top
                  dense
                >
                <v-timeline-item
                    color="primary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Alumnos:</strong> Ver, Crear, Editar y Eliminar Alumnos
                        </div>
                      </div>
                  </v-timeline-item>
                  <v-timeline-item
                    color="secondary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Calificaciones:</strong> Ver, Crear, Editar y Eliminar Calificaciones por Alumno
                        </div>
                      </div>
                  </v-timeline-item>
                </v-timeline>
              </v-expansion-panel-content>
            </v-expansion-panel>
            </v-expansion-panels>
          </v-col>
            </v-row>
            <v-row justify="center">
          <v-col cols="10" sm="8">
            <v-expansion-panels accordion>
            <v-expansion-panel>
              <v-expansion-panel-header><h3>¿Qué puede hacer el Alumno?</h3></v-expansion-panel-header>
              <v-expansion-panel-content align="start">
                <v-timeline
                  align-top
                  dense
                >
                  <v-timeline-item
                    color="primary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Calificaciones:</strong> Ver Calificaciones
                        </div>
                      </div>
                  </v-timeline-item>
                </v-timeline>
              </v-expansion-panel-content>
            </v-expansion-panel>
            </v-expansion-panels>
          </v-col>
            </v-row>
          </v-container>
          </v-col>
        </v-row>
      </div>

      <!-- -----------------------------------Alumno/Ttutor------------------------------------ -->

      <div v-else class="mx-auto disabled text-center">
        <v-img v-if="Item.alumnoId"
          width="200"
          class="mx-auto"
          src="../../../src/assets/img/alumno.png"
        ></v-img>
        <v-img v-if="Item.tutorId"
          width="200"
          class="mx-auto"
          src="../../../src/assets/img/tutor.png"
        ></v-img>
      </div>

      <div v-if="Item.alumnoId" class="text-center mt-8">
        <h1>
          {{ Item.alumnoNombre }} {{ Item.alumnoApaterno }} {{ Item.alumnoAmaterno }}
        </h1>
      </div>


      <div v-if="Item.tutorId" class="text-center">
        <h1>{{ Item.tutorNombre }} {{ Item.tutorApaterno }} {{ Item.tutorAmaterno }}</h1>
      </div>

      <div v-if="Item.tutorId"  class="text-center ma-2">
        <span v-if="Item.alumnoId" >
          Alumno
        </span>

        <span v-else>
          Docente Tutor
        </span>
      </div>

      <div>
      </div>

      <!-- -----------------------VER CALIFICACIONES  -------------------------- -->
      <div  v-if="Item.alumnoId" class="text-center">
        <v-tooltip right>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="secondary"
            class="d-flex justify-center mx-auto mt-4"
            @click="calificaciones(Item)"
            v-bind="attrs"
            v-on="on"
          >
            <span>Mis Calificaciones</span>
          </v-btn>
        </template>
        <span>Ver Registro Escolar</span>
      </v-tooltip>
      </div>

      <!-- -----------------------VER ALUMNOS  -------------------------- -->
      <div  v-if="Item.tutorId" class="text-center">
        <v-tooltip right>
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            color="secondary"
            class="d-flex justify-center mx-auto mt-4"
            @click="alumnos(Item)"
            v-bind="attrs"
            v-on="on"
          >
            <span>Mis Alumnos</span>
          </v-btn>
        </template>
        <span>Ver Alumnos Tutorados</span>
      </v-tooltip>
      </div>
      <div v-if="Item.alumnoId">
        <v-row justify="center" class="ml-12 mr-12 mt-1 mb-1">
          <v-col cols="10" sm="8">
            <v-expansion-panels accordion>
            <v-expansion-panel>
              <v-expansion-panel-header><h3>¿Qué puede hacer el Alumno?</h3></v-expansion-panel-header>
              <v-expansion-panel-content align="start">
                <v-timeline
                  align-top
                  dense
                  class="ml-6"
                >
                  <v-timeline-item
                    color="primary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Calificaciones:</strong> Ver Calificaciones
                        </div>
                      </div>
                  </v-timeline-item>
                </v-timeline>
              </v-expansion-panel-content>
            </v-expansion-panel>
            </v-expansion-panels>
          </v-col>
        </v-row>
      </div>

      <div v-if="Item.tutorId">
        <v-row justify="center" class="ml-12 mr-12 mt-1 mb-1">
          <v-col cols="10" sm="8">
            <v-expansion-panels accordion>
            <v-expansion-panel>
              <v-expansion-panel-header><h3>¿Qué puede hacer el Tutor?</h3></v-expansion-panel-header>
              <v-expansion-panel-content align="start">
                <v-timeline
                  align-top
                  dense
                  class="ml-6"
                >
                <v-timeline-item
                    color="primary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Alumnos:</strong> Ver, Crear, Editar y Eliminar Alumnos
                        </div>
                      </div>
                  </v-timeline-item>
                  <v-timeline-item
                    color="secondary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Calificaciones:</strong> Ver, Crear, Editar y Eliminar Calificaciones por Alumno
                        </div>
                      </div>
                  </v-timeline-item>
                </v-timeline>
              </v-expansion-panel-content>
            </v-expansion-panel>
            </v-expansion-panels>
          </v-col>
        </v-row>
        <v-row justify="center" class="ml-12 mr-12 mt-1 mb-1">
          <v-col cols="10" sm="8">
            <v-expansion-panels accordion>
            <v-expansion-panel>
              <v-expansion-panel-header><h3>¿Qué puede hacer el Alumno?</h3></v-expansion-panel-header>
              <v-expansion-panel-content align="start">
                <v-timeline
                  align-top
                  dense
                  class="ml-6"
                >
                  <v-timeline-item
                    color="primary"
                    small
                    align="left"
                    >
                      <div>
                        <div class="font-weight-normal">
                          <strong>Vista Calificaciones:</strong> Ver Calificaciones
                        </div>
                      </div>
                  </v-timeline-item>
                </v-timeline>
              </v-expansion-panel-content>
            </v-expansion-panel>
            </v-expansion-panels>
          </v-col>
        </v-row>
      </div>
    </v-col>
  </div>
</template>

<script>
  import AuthService from '@/services/AuthService.js';
  import {mapActions} from 'vuex'
  import Nuevo from './nuevo.vue'
  export default {
    props:['Items'],

  components:{
    Nuevo
  },

  data(){
      return {
        search: '',
        dialog: false,
        itemSelected:{},
        username: ''
      }
    },

    async created() {
      if (!this.$store.getters.isLoggedIn) {
        this.$router.push('/login');
      }
      this.username = this.$store.getters.getUser.username;
      this.secretMessage = await AuthService.getSecretContent();
    },

  methods:{
    ...mapActions('usuarios', ['eliminarUsuario', 'verCalificaciones', 'verAlumnos', 'verSedes', 'verTutores', 'verUsuarios']),

    calificaciones(item){
      this.itemSelected= item;
      this.verCalificaciones(this.itemSelected);
    },

    alumnos(item){
      this.itemSelected= item;
      this.verAlumnos(this.itemSelected);
    },

    sedes(){
      this.verSedes();
    },
    tutores(){
      this.verTutores();
    },
    usuarios(){
      this.verUsuarios();
    }
  }
}
</script>
