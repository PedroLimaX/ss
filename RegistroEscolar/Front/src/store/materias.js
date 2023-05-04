import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    ModuloFK:[],
    RequisitoFK:[],
    CorrequisitoFK:[],
    Semestre:[],
    Carrera:[],
    Sede:[]
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
    },
    Semestre(state){
      return state.Semestre;
    },
    Carrera(state){
      return state.Carrera;
    },

    Sede(state){
      return state.Sede;
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
    },

    LlenarSemestre(state,data){
      state.Semestre = data
    },

    LlenarCarrera(state,data){
      state.Carrera = data
    },

    LlenarSede(state,data){
      state.Sede = data
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

  getSemestre: async function({commit}, datos){
    try{
      const setting={
          method:'GET',
      }
      const url = "http://localhost:4000/api/semestres/" + datos;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarSemestre',json);
    }
    catch(err){
        console.log(err);
    }
  },

  getCarrera: async function({commit}, datos){
    try{
      const setting={
          method:'GET',
      }
  
      const url = "http://localhost:4000/api/carreras/" + datos;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarCarrera',json);
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
