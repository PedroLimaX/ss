import router from '@/router';
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    TutorFK:[],
    GrupoFK: [],
    UserData:[]
  },
  getters: {
    Items(state){
      return state.Items;
    },
    TutorFK(state){
      return state.TutorFK;
    },
    GrupoFK(state){
      return state.GrupoFK;
    },

    UserData(state){
      return state.UserData;
    },
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

    LlenarTutorFK(state,data){
      state.TutorFK = data
    },
    
    LlenarGrupoFK(state,data){
      state.GrupoFK = data
    },

    LlenarUserData(state,data){
      state.UserData = data
    },

  },
  actions: {
    cargarAlumnos: async function({commit},tutorId){

      try{
          const setting={
              method:'GET',
          }

          const url = "http://localhost:4000/api/alumnos/bytutor/" + tutorId;
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

        const url = "http://localhost:4000/api/tutores/" + tutorId;
        const data = await fetch(url,setting);
        const json = await data.json();
        commit('LlenarTutorFK',json);
      }
      catch(err){
          console.log(err);
      }

    try{
      const setting={
          method:'GET',
      }
      const url = "http://localhost:4000/api/grupos/";
      const data = await fetch(url,setting);
      const json = await data.json();
      commit('LlenarGrupoFK',json);
    }
    catch(err){
        console.log(err);
    }
  },
  

  agregarAlumno:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/alumnos"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarAlumnos',datos.idtutor);
    }
    catch(err){
        console.log(err);
    }
  },

  cargarUsuario: async function({commit},datos){
    try{
        const setting={
            method:'GET',
        }
        const url = "http://localhost:4000/api/usuarios/byMatricula/" + datos
        const data = await fetch(url,setting);
        const json = await data.json();
        commit('LlenarUserData',json);
    }
    catch(err){
        console.log(err);
    }
  },

  leerAlumno: async function({commit}, datos){
      try{
        router.push({name:'calificacionesByAlumno', params:{id:datos.id}});
    }
    catch(err){
        console.log(err);
    }
  },

  eliminarAlumno:async function({commit,dispatch},datos,tutorId){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/alumnos"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarAlumnos',datos.idtutor);
        
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
