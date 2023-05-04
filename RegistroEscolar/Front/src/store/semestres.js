import router from '@/router';
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    CarreraFK:[],
    ConteoMaterias:[],
    Sede:[]
  },
  getters: {
    Items(state){
      return state.Items;
    },
    CarreraFK(state){
      return state.CarreraFK;
    },

    ConteoMaterias(state){
      return state.ConteoMaterias;
    },

    Sede(state){
      return state.Sede;
    }
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

    LlenarCarreraFK(state,data){
      state.CarreraFK = data
    },

    LlenarConteoMaterias(state,data){
      state.ConteoMaterias = data
    },

    LlenarSede(state,data){
      state.Sede = data
    }

  },
  actions: {
    cargarSemestres: async function({commit},carreraId){
      try{
          const setting={
              method:'GET',
          }
          const url = "http://localhost:4000/api/semestres/bycarrera/" + carreraId;
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
        commit('LlenarCarreraFK',json);
    }
    catch(err){
        console.log(err);
    }

    try{
      const setting={
          method:'GET',
      }

      const url = "http://localhost:4000/api/calificaciones/conteomaterias/" + carreraId;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarConteoMaterias',json);
    }
    catch(err){
        console.log(err);
    }
  },


  agregarSemestre:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/semestres"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarSemestres',datos.idcarrera);
    }
    catch(err){
        console.log(err);
    }
  },

  verModulos: async function({commit}, datos){
    try{
      router.push({name:'modulosBySemestre', params:{id:datos.id}});
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

  eliminarSemestre:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/semestres"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarSemestres', datos.idcarrera);
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
