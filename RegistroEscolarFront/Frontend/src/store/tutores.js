import router from '@/router';
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
    cargarTutores: async function({commit}){
      try{
          const setting={
              method:'GET',
              
          }
          const url = "http://localhost:4000/api/tutores"
          const data = await fetch(url,setting);
          const json = await data.json();
          commit('LlenarItems',json);
      }
      catch(err){
          console.log(err);
      }
  },

  agregarTutor:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/tutores"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarTutores');
    }
    catch(err){
        console.log(err);
    }
  },

  leerTutor: async function({commit}, datos){
    try{
      router.push({name:'alumnosByTutor', params:{id:datos.id}});
  }
  catch(err){
      console.log(err);
  }
},

  eliminarTutor:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
        }

        const url = "http://localhost:4000/api/tutores"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarTutores');
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
