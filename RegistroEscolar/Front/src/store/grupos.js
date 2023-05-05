import router from '@/router';
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    ItemFK:[],
    Sede:[]
  },
  getters: {
    Items(state){
      return state.Items;
    },
    ItemFK(state){
      return state.ItemFK;
    },

    Sede(state){
      return state.Sede;
    }
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

    LlenarItemFK(state,data){
      state.ItemFK = data
    },

    LlenarSede(state,data){
      state.Sede = data
    }

  },
  actions: {
    cargarGrupos: async function({commit},carreraId){

      try{
          const setting={
              method:'GET',
          }

          const url = "http://localhost:4000/api/grupos/bycarrera/" + carreraId;
          const data = await fetch(url,setting);
          const json = await data.json();
          commit('LlenarItems',json);
      }
      catch(err){
          console.log(err);
      }

      try{
        const setting={
            method:'GET',
        }

        const url = "http://localhost:4000/api/carreras/" + carreraId;
        const data = await fetch(url,setting);
        const json = await data.json();
        commit('LlenarItemFK',json);
    }
    catch(err){
        console.log(err);
    }
  },
  

  agregarGrupo:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/grupos"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarGrupos',datos.idcarrera);
    }
    catch(err){
        console.log(err);
    }
  },

  verAlumnos: async function({commit}, datos){
      try{
        router.push({name:'alumnosByGrupo', params:{id:datos.id}});
    }
    catch(err){
        console.log(err);
    }
  },

  getSede: async function({commit}, datos){
    try{
      const setting={
        method:'GET',
      }
      const url = "http://localhost:4000/api/sedes/" + datos;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarSede',json);
    }
    catch(err){
      console.log(err);
    }
  },

  eliminarGrupo:async function({commit,dispatch},datos,carreraId){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/grupos"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarGrupos',datos.idcarrera);
        
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
