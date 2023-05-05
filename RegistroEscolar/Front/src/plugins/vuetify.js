import Vue from 'vue';
import Vuetify from 'vuetify';
import 'vuetify/dist/vuetify.min.css';

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
      options: {
        customProperties: true,
      },
    themes: {
      light: {
        primary: '#003a5c',
        secondary: '#00b4e0',
        accent: '#82B1FF',
        neutral:'#E6E6E6',
        error: '#cd3232',
        info: '#2196F3',
        success: '#2dc838',
        warning: '#E14D2A',

      },
    },
  },
  
});
