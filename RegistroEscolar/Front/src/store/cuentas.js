import axios from 'axios';
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
  },
  getters: {
    Items(state){
      return state.Items;
    }
  },
  mutations: {
    LlenarItems(state,data){
      state.Items = data;
    },

  },
  actions: {
    cargarCuentas: async function({commit}){
      try{
          const setting={
              method:'GET',
          }
          const url = "http://localhost:4000/api/usuarios"
          const data = await fetch(url,setting);
          const json = await data.json();
          commit('LlenarItems',json);
      }
      catch(err){
          console.log(err);
      }
  },

  restablecerCuenta:async function({commit,dispatch},credentials) {
      const response = await axios
        .post('http://localhost:4000/api/reset/', credentials);
      return response.data;
  },


  eliminarCuenta:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
        }

        const url = "http://localhost:4000/api/usuarios"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarCuentas');
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
