import router from '@/router';
import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default {
  namespaced: true,

  state: {
    Items: [],
    SedeFK:[]
  },
  getters: {
    Items(state){
      return state.Items;
    },
    SedeFK(state){
      return state.SedeFK;
    }
  },
  mutations: {

    LlenarItems(state,data){
      state.Items = data;
    },

    LlenarSedeFK(state,data){
      state.SedeFK = data
    }

  },
  actions: {
    cargarCarreras: async function({commit},sedeId){

      try{
          const setting={
              method:'GET',
          }

          const url = "http://localhost:4000/api/carreras/bysede/" + sedeId;
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

        const url = "http://localhost:4000/api/sedes/" + sedeId;
        const data = await fetch(url,setting);
        const json = await data.json();
        commit('LlenarSedeFK',json);
    }
    catch(err){
        console.log(err);
    }
  },
  

  agregarCarrera:async function({commit,dispatch},datos){
    try{
        const setting={
            method:'POST',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/carreras"
        const data = await fetch(url,setting);
        const json = await data.json();
        console.log(json);
        dispatch('cargarCarreras',datos.idsede);
    }
    catch(err){
        console.log(err);
    }
  },

  verSemestres: async function({commit}, datos){
      try{
        router.push({name:'semestresByCarrera', params:{id:datos.id}});
    }
    catch(err){
        console.log(err);
    }
  },

  verGrupos: async function({commit}, datos){
    try{
      router.push({name:'gruposByCarrera', params:{id:datos.id}});
  }
  catch(err){
      console.log(err);
  }
},

  eliminarCarrera:async function({commit,dispatch},datos,sedeId){
    try{
        const setting={
            method:'PUT',
            headers:{
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(datos),
            
        }
        const url = "http://localhost:4000/api/carreras"
        const data = await fetch(url,setting);
        const json = await data.json();
        dispatch('cargarCarreras',datos.idsede);
        
    }
    catch(err){
        console.log(err);
    }
}
  },
  modules: {
  }
}
