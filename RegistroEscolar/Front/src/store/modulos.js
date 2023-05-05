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
    },
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

  },
  actions: {
    cargarModulos: async function({commit},semestreId){
      try{
        const setting={
          method:'GET',

      }
      const url = "http://localhost:4000/api/modulos/bysemestre/" + semestreId;
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

        const url = "http://localhost:4000/api/semestres/" + semestreId;
        const data = await fetch(url,setting);
        const json = await data.json();
        commit('LlenarSemestreFK',json);
    }
    catch(err){
        console.log(err);
    }
  },

  agregarModulo:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/modulos"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarModulos', datos.idsemestre);
    }
    catch(err){
        console.log(err);
    }
  },

  verMaterias: async function({commit}, datos){
    try{
      router.push({name:'materiasByModulo', params:{id:datos.id}});
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

  eliminarModulo:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/modulos"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarModulos', datos.idsemestre);
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
