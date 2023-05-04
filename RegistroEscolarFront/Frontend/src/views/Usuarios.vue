<template>
    <div>
      <cards :Items="Items.body"/>
      <v-container>
            <v-row justify="center">
              <v-col cols="6">
                <v-expansion-panels accordion>
                <v-expansion-panel>
                  <v-expansion-panel-header><h3>Cambiar Contraseña</h3></v-expansion-panel-header>
                  <v-expansion-panel-content align="start">
                    <v-card ref="form" elevation="0">
                      <v-card-text>
                        <v-text-field
                          ref="password"
                          v-model="newPassword"
                          :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
                          :type="show ? 'text' : 'password'"
                          name="input-10-1"
                          label="Nueva Contraseña"
                          hint="Nueva Contraseña"
                          counter
                          @click:append="show = !show"
                        ></v-text-field>
                        <v-text-field
                          ref="password_repeat"
                          v-model="newPassword_repeat"
                          :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                          :type="show1 ? 'text' : 'password'"
                          name="input-10-2"
                          label="Repetir Nueva Contraseña"
                          hint="Repetir Nueva Contraseña"
                          counter
                          @click:append="show1 = !show1"
                        ></v-text-field>
                      </v-card-text>
                      <v-divider class="mt-2"></v-divider>
                      <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn
                          color="primary"
                          @click="editar()"
                          value="Save"
                        >
                          Guardar
                        </v-btn>
                      </v-card-actions>
                      <div v-if="msg">
                        <v-alert
                          v-model="alert"
                          text
                          dense
                          color="success"
                          icon="mdi-check"
                          border="left"
                          dismissible
                        >
                          <span>{{ msg }}</span>
                        </v-alert>
                      </div>
                    </v-card>
                  </v-expansion-panel-content>
                </v-expansion-panel>
                </v-expansion-panels>
              </v-col>
            </v-row>
      </v-container>
    </div>
    
  </template>
  
  <script>
  
    import {mapGetters,mapActions} from 'vuex'
  
    import cards from '@/components/usuarios/cards.vue'
    
  
    export default{
      name: 'USUARIOS',
      components:{
        cards,
      },
  
      created(){
        this.cargarUsuarios(this.$store.getters.getUser.username);
      },
  
      data(){
        return{
          username: this.$store.getters.getUser.username,
          newPassword: '',
          newPassword_repeat: '',
          msg: '',
          formHasErrors: false,
          show:false,
          show1:false,
          alert:true
        }
    },
      methods:{
        ...mapActions('usuarios', ['cargarUsuarios', 'cambiarContrasena']),

        editar(){
        this.$alertify.confirm('¿Desea Actualizar Contraseña?<br> <strong>Deberá de volver a iniciar sesión</strong>',
        () => {
              try {
                const credentials = {
                  username: this.username,
                  password: this.newPassword,
                  password_repeat: this.newPassword_repeat,
                }
                this.cambiarContrasena(credentials);
              }catch (error) {
                this.msg = error.response.data.msg;
              }
                
                this.$alertify.success('Contraseña Actualizada')
                this.$store.dispatch('logout');
                this.$router.push('/login');
              },
              () => this.$alertify.error('Acción Cancelada')
        ).setHeader('<h4><strong> Confirmar Acción</strong></h4>');
        
        
      }
    

      },
  
      computed:{
        ...mapGetters('usuarios', ['Items'])
      }
    }
  </script>