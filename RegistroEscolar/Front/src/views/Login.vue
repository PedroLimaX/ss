<template>
  <div justify="center" align="center">
    <v-row justify="center" align="center">
    <v-col
      cols="12"
      sm="10"
      md="10"
      lg="4"
    >
      <v-card class="mt-12 pt-12 pb-6 pl-5 pr-5 " color="primary" elevation="10" dark>
        <v-card-title class="text-center">
          <h2 class="white--text mx-auto">Inicio de Sesión</h2>
        </v-card-title>
        <v-card-text>
          <v-text-field
            filled
            rounded
            dense
            class="mt-6 mb-6"
            ref="username"
            v-model="username"
            label="Matricula/ID"
            placeholder="202312345"
            required
          ></v-text-field>
          <v-text-field
            filled
            rounded
            dense
            class="mt-6 mb-6"
            ref="password"
            v-model="password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :type="show1 ? 'text' : 'password'"
            name="input-10-1"
            label="Contraseña"
            counter
            @click:append="show1 = !show1"
          ></v-text-field>
        </v-card-text>
        <v-spacer></v-spacer>
        <v-card-actions class="text-center">
          <v-btn
            rounded
            large
            width="95%"
            class="mx-auto"
            color="secondary"
            @click="login"
            value="Login"
          >
            Ingresar
          </v-btn>
        </v-card-actions>

        <div v-if="msg" class="pa-0 white-bg">
          <v-alert
            v-model="alert"
            dense
            color="red darken-2"
            icon="mdi-information-outline"
            border="left"
          >
            <span>{{ msg }}</span>
          </v-alert>
        </div>
      </v-card>
    </v-col>
    <v-col cols="12" class="d-none">
      <span class="white--text">¿Aún no tienes una cuenta?</span><a class="secondary--text" href="sign-up"> Registrarse</a>
    </v-col>
  </v-row>
  
</div>
</template>
<script>

import AuthService from '@/services/AuthService.js';

export default {
  data() {
    return {
      username: '',
      password: '',
      msg: '',
      show1: false,
      alert:true,
    };
  },

  methods: {
    async login() {
      try {
        const credentials = {
          username: this.username,
          password: this.password
        };
        const response = await AuthService.login(credentials);
        this.msg = response.msg;

        const token = response.token;
        const user = response.user;

        this.$store.dispatch('login', { token, user });

        this.$router.push('/usuario/' + this.$store.getters.getUser.username);
      } catch (error) {
        this.msg = error.response.data.msg;
      }
    },
  }
};
</script>