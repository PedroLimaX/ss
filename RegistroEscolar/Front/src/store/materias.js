import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    ModuloFK:[],
    RequisitoFK:[],
    CorrequisitoFK:[]
  },
  getters: {
    Items(state){
      return state.Items;
    },
    ModuloFK(state){
      return state.ModuloFK;
    },
    RequisitoFK(state){
      return state.RequisitoFK;
    },
    CorrequisitoFK(state){
      return state.CorrequisitoFK;
    }
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

    LlenarModuloFK(state,data){
      state.ModuloFK = data
    },

    LlenarRequisitoFK(state,data){
      state.RequisitoFK = data
    },

    LlenarCorrequisitoFK(state,data){
      state.CorrequisitoFK = data
    }
  },
  actions: {

    cargarMaterias: async function({commit}, moduloId){
      try{
          const setting={
              method:'GET',
          }
          const url = "http://localhost:4000/api/materias/bymodulo/" + moduloId;
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
          const url = "http://localhost:4000/api/modulos/" + moduloId;
          const data = await fetch(url,setting);
          const json = await data.json();
          commit('LlenarModuloFK',json);
      }
      catch(err){
        console.log(err);
      }

    try{
      const setting={
          method:'GET',
      }
      const url = "http://localhost:4000/api/materias/bymodulo/" + moduloId;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarCorrequisitoFK',json);
    }
    catch(err){
        console.log(err);
    }
  },

  cargarRequisitoFK: async function({commit},carreraId){
    try{
      const setting={
          method:'GET',
      }
      const url = "http://localhost:4000/api/materias/bycarrera/" + carreraId;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarRequisitoFK',json);
    }
    catch(err){
        console.log(err);
    }
    
  },

  agregarMateria:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
        }
        const url = "http://localhost:4000/api/materias"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarMaterias', datos.idmodulo);
    }
    catch(err){
        console.log(err);
        this.$alertify.error(err);
    }
  },

  eliminarMateria:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/materias"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarMaterias', datos.idmodulo);
    }
    catch(err){
        console.log(err);
    }
  }
  },
  modules: {
  }
}
