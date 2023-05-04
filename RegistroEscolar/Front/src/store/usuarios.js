import router from '@/router';
import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios';

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
    cargarUsuarios: async function({commit},datos){
      try{
          const setting={
              method:'GET',
          }
          const url = "http://localhost:4000/api/usuarios/byMatricula/" + datos
          const data = await fetch(url,setting);
          const json = await data.json();
          commit('LlenarItems',json);
      }
      catch(err){
          console.log(err);
      }
  },

  agregarUsuario:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/usuarios"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarUsuarios');
    }
    catch(err){
        console.log(err);
    }
  },

  verCalificaciones: async function({commit}, datos){
    try{
      router.push({name:'calificacionesByAlumno', params:{id:datos.alumnoId}});
    }
    catch(err){
        console.log(err);
    }
  },

  verAlumnos: async function({commit}, datos){
    try{
        router.push({name:'alumnosByTutor', params:{id:datos.tutorId}});
      }
    catch(err){
        console.log(err);
    }
  },

  verTutores: async function({commit}){
    try{
        router.push({name:'tutores'});
      }
    catch(err){
        console.log(err);
    }
  },

  verSedes: async function({commit}){
    try{
        router.push({name:'sedes'});
      }
    catch(err){
        console.log(err);
    }
  },
  
  verUsuarios: async function({commit}){
    try{
        router.push({name:'cuentas'});
      }
    catch(err){
        console.log(err);
    }
  },

  cambiarContrasena:async function({commit,dispatch},credentials) {
      const response = await axios
        .post('http://localhost:4000/api/update-pw/', credentials);
      return response.data;
  },


  eliminarUsuario:async function({commit,dispatch},datos){
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
        dispatch('cargarUsuarios');
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
