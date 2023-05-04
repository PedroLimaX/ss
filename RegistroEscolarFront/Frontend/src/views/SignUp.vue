<template>
  <div>
    <div>
      <v-row>
        <v-col cols="12" sm="1" align="end">
          <goBack/>
        </v-col>
        <v-col sm="10">
          <h1 class="text-center ma-4">Registro de Usuario</h1>
        </v-col>
      </v-row>
    </div>
    <v-row justify="center" align="center">
      <v-col
        cols="12"
        sm="10"
        md="10"
        lg="4"
      >
        <v-card class="mt-12 pt-0 pb-1 pl-5 pr-5 " ref="form">
          <v-card-text>
            <v-text-field
              class="mt-2 mb-2"
              ref="username"
              v-model="username"
              label="Matrícula/ID"
              placeholder="202312345"
              required
            ></v-text-field>
            <v-text-field
              class="mt-2 mb-2"
              ref="password"
              v-model="password"
              :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
              :type="show1 ? 'text' : 'password'"
              name="input-10-1"
              label="Contraseña"
              hint="Contraseña"
              counter
              @click:append="show1 = !show1"
            ></v-text-field>

            <v-text-field
              class="mt-2 mb-2"
              ref="password_repeat"
              v-model="password_repeat"
              :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
              :type="show1 ? 'text' : 'password'"
              name="input-10-1"
              label="Repetir Contraseña"
              hint="Repetir Contraseña"
              counter
              @click:append="show1 = !show1"
            ></v-text-field>
          </v-card-text>
          <v-divider class="mt-2"></v-divider>
          <v-card-actions>
            <v-btn text>
              
            </v-btn>
            <v-spacer></v-spacer>
            <v-slide-x-reverse-transition>
              <v-tooltip
                v-if="formHasErrors"
                left
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    icon
                    class="mt-0"
                    v-bind="attrs"
                    @click="resetForm"
                    v-on="on"
                  >
                    <v-icon>mdi-refresh</v-icon>
                  </v-btn>
                </template>
                <span>Actualizar</span>
              </v-tooltip>
            </v-slide-x-reverse-transition>
            <v-btn
              color="primary"
              @click="signUp"
              value="Sign Up"
            >
              Registrar
            </v-btn>
          </v-card-actions>
          <div v-if="msg">
            <v-alert
              v-model="alert"
              text
              dense
              color="info"
              icon="mdi-information-outline"
              border="left"
              
            >
              <span>{{ msg }}</span>
            </v-alert>
          </div>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>

import AuthService from '@/services/AuthService.js';
import goBack from "@/components/goBack"


export default {
  components:{
      goBack
    },
  data() {
    return {
      username: '',
      password: '',
      password_repeat: '',
      msg: '',
      formHasErrors: false,
      show1:false,
      alert:true
    };
  },

  async created(){
      if (!this.$store.getters.isLoggedIn) {
        this.$router.push('/');
      }
      this.secretMessage = await AuthService.getSecretContent();
    },

  methods: {
    async signUp() {
      
      try {
        const credentials = {
          username: this.username,
          password: this.password,
          password_repeat: this.password_repeat
        };
        const response = await AuthService.signUp(credentials);
        this.msg = response.msg;
        // this.$router.push('/');
      } catch (error) {
        this.msg = error.response.data.msg;
      }
    }
  }
};
</script>