import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import Axios from 'axios';


import VueAlertify from 'vue-alertify';

Vue.config.productionTip = false;

// set auth header
Axios.defaults.headers.common['Authorization'] = `Bearer ${store.state.token}`;

Vue.use(VueAlertify);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: function (h) { return h(App) }
}).$mount('#app')
