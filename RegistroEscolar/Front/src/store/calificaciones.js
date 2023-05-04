import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    AlumnoFK:[],
    MateriasFK:[],
  },
  getters: {
    Items(state){
      return state.Items;
    },
    AlumnoFK(state){
      return state.AlumnoFK;
    },
    MateriasFK(state){
      return state.MateriasFK;
    }
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

    LlenarAlumnoFK(state,data){
      state.AlumnoFK = data
    },

    LlenarMateriasFK(state,data){
      state.MateriasFK = data
    }

  },
  actions: {
    cargarCalificaciones: async function({commit},alumnoId){
      try{
          const setting={
              method:'GET',
          }

          const url = "http://localhost:4000/api/calificaciones/byalumno/" + alumnoId;
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

        const url = "http://localhost:4000/api/alumnos/carrera/" + alumnoId;
        const data = await fetch(url,setting);
        const json = await data.json();
        commit('LlenarAlumnoFK',json);
        }
        catch(err){
            console.log(err);
        }

        
  },

  cargarMateriasFK: async function({commit},carreraId){
    try{
      const setting={
          method:'GET',
      }

      const url = "http://localhost:4000/api/materias/bycarrera/" + carreraId;
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarMateriasFK',json);
    }
    catch(err){
        console.log(err);
    }
    
  },
  

  agregarCalificacion:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/calificaciones"
        const data = await fetch(url,setting);
        const json = await data.json();
        // console.log(json);
        dispatch('cargarCalificaciones',datos.idalumno);
    }
    catch(err){
        console.log(err);
    }
  },

  eliminarCalificacion:async function({commit,dispatch},datos){
    console.log(datos);
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/calificaciones"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarCalificaciones',datos.idalumno);
        
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
