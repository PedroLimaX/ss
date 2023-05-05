<template>
  <div>
    <div class="ma-4">
      <v-row>
        <v-col cols=12 class="text-center ma-4">
          <h1 >
            ¡Bienvenido al Sistema de Control Escolar!
          </h1>
        </v-col>
        <v-col cols="12" class="text-center ma-4">
          <h2>
            Lorem ipsum dolor sit amet consectetur adipisicing elit.
          </h2>
        </v-col>
        
        <v-col cols="12"
          v-for="n in 2"
          :key="n"
        >
          <div class="main-text">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo illo animi laudantium necessitatibus itaque suscipit autem quibusdam. Voluptatum quam aspernatur magni, quo porro nemo, sequi, reprehenderit harum sint obcaecati ipsa?
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Perferendis odit consequatur reiciendis molestiae rerum atque provident doloremque illo inventore sit? Assumenda quas blanditiis ullam, ipsum ratione earum harum excepturi ut.
          </div>
        </v-col>

      </v-row>
    </div>
  <template>
  <v-parallax
    height="600"
    class="ma-12"
    src="../assets/img/istii_bg.jpg"
  >
    <div class="d-flex flex-column fill-height justify-center align-center text-white">
      <h1 class="text-h1 font-weight-black mb-4 secondary--text">
        San José Chiapa
      </h1>
      <h2 class="subheading white--text">
        Complejo Regional Centro
      </h2>
    </div>
  </v-parallax>
</template>
  
  <div class="ma-4">
  <v-row>

    <v-col cols="12" class="text-center ma-4">
      <h2>
        Lorem ipsum dolor sit amet consectetur adipisicing elit.
      </h2>
    </v-col>
    <v-col cols="12"
      v-for="n in 1"
      :key="n"
    >
      <div class="main-text">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo illo animi laudantium necessitatibus itaque suscipit autem quibusdam. Voluptatum quam aspernatur magni, quo porro nemo, sequi, reprehenderit harum sint obcaecati ipsa?
        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Perferendis odit consequatur reiciendis molestiae rerum atque provident doloremque illo inventore sit? Assumenda quas blanditiis ullam, ipsum ratione earum harum excepturi ut.
      </div>
    </v-col>

    <v-col
      class="d-flex child-flex"
      cols="4"
    >
      <v-img
        src="../assets/img/logo_buap_azul.png"
        aspect-ratio="1"
        class="grey lighten-2"
      >
      <div class="fill-height bottom-gradient"></div>
        <template v-slot:placeholder>
          <v-row
            class="fill-height ma-0"
            align="center"
            justify="center"
          >
            <v-progress-circular
              indeterminate
              color="grey lighten-5"
            ></v-progress-circular>
          </v-row>
        </template>
      </v-img>
    </v-col>

    <v-col
      class="d-flex child-flex"
      cols="4"
    >
      <v-img
        src="../assets/img/sjch.jpg"
        aspect-ratio="1"
        class="grey lighten-2"
      >
      <div class="fill-height bottom-gradient"></div>
        <template v-slot:placeholder>
          <v-row
            class="fill-height ma-0"
            align="center"
            justify="center"
          >
            <v-progress-circular
              indeterminate
              color="grey lighten-5"
            ></v-progress-circular>
          </v-row>
        </template>
      </v-img>
    </v-col>

    <v-col
      class="d-flex child-flex"
      cols="4"
    >
      <v-img
        src="../assets/img/crc.jpg"
        aspect-ratio="1"
        class="grey lighten-2"
      >
      <div class="fill-height bottom-gradient"></div>
        <template v-slot:placeholder>
          <v-row
            class="fill-height ma-0"
            align="center"
            justify="center"
          >
            <v-progress-circular
              indeterminate
              color="grey lighten-5"
            ></v-progress-circular>
          </v-row>
        </template>
      </v-img>
    </v-col>

    <v-col cols="12" class="text-center ma-4">
      <h2>
        Lorem ipsum dolor sit amet consectetur adipisicing elit.
      </h2>
    </v-col>
    <v-col cols="12"
      v-for="n in 2"
      :key="n"
    >
      <div class="main-text">
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo illo animi laudantium necessitatibus itaque suscipit autem quibusdam. Voluptatum quam aspernatur magni, quo porro nemo, sequi, reprehenderit harum sint obcaecati ipsa?
        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Perferendis odit consequatur reiciendis molestiae rerum atque provident doloremque illo inventore sit? Assumenda quas blanditiis ullam, ipsum ratione earum harum excepturi ut.
      </div>
    </v-col>

  </v-row>
  </div>

  <div class="ma-0">
    <v-footer
    dark
    padless
  >
    <v-card
      flat
      tile
      class="primary white--text text-center"
    >
      <v-card-text>
        <v-btn
          v-for="icon in icons"
          :key="icon"
          class="mx-4 white--text"
          icon
        >
          <v-icon size="24px">
            {{ icon }}
          </v-icon>
        </v-btn>
      </v-card-text>

      <v-card-text class="white--text pt-0">
        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Autem similique mollitia ratione officia eum, nulla dolorum, atque necessitatibus maiores, saepe tempore eius a? Dolorem sit explicabo maiores cupiditate at nemo.
      </v-card-text>

      <v-divider></v-divider>

      <v-card-text class="white--text">
        {{ new Date().getFullYear() }} — <strong>BUAP</strong>
      </v-card-text>
    </v-card>
  </v-footer>
  </div>
  
  </div>

</template>

<script>
  export default {
    data: () => ({
      icons: [
        'mdi-facebook',
        'mdi-twitter',
        'mdi-linkedin',
        'mdi-instagram',
      ],
    }),
  }
</script>

<style scoped>
  .bottom-gradient {
    background-image: linear-gradient(to top, rgba(0, 20, 35, 0.6) 5%, transparent 72px);
  }

  .repeating-gradient {
    background-image: repeating-linear-gradient(-45deg,
                        rgba(255,0,0,.25),
                        rgba(255,0,0,.25) 5px,
                        rgba(0,0,255,.25) 5px,
                        rgba(0,0,255,.25) 10px
                      );
  }
</style>