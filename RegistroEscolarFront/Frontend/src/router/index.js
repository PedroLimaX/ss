import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import About from '../views/AboutView.vue'
import NotFound from '../views/NotFound.vue'

import Usuarios from '../views/Usuarios.vue'
import Cuentas from '../views/Cuentas.vue'

import SignUp from "../views/SignUp.vue";
import Login from "../views/Login.vue";


// -----------------Alumnos-------------------
import Tutores from '../views/Tutores.vue'
import Grupos from '../views/Grupos.vue'
import Alumnos from '../views/Alumnos.vue'
import Calificaciones from '../views/Calificaciones.vue'



// -----------------Materias-------------------
import Materias from '../views/Materias.vue'
import Modulos from '../views/Modulos.vue'
import Semestres from '../views/Semestres.vue'
import Carreras from '../views/Carreras.vue'
import Sedes from '../views/Sedes.vue'

Vue.use(VueRouter)

const routes = [

  // LOGIN

    {
      path: "/sign-up",
      name: "sign-up",
      component: SignUp
    },
    {
      path: "/login",
      name: "login",
      component: Login
    },


    //MAIN VIEWS
  {
    path: '/',
    name: 'home',
    component: HomeView
  },

  {
    path: '/about',
    name: 'about',
    component: About
  },

  {
    path: '/usuario/:matricula',
    name: 'usuario',
    component: Usuarios
  },

// -----------------Materias-------------------


  {
    path: '/materias',
    name: 'materias',
    component: Materias
  },

  {
    path: '/modulos',
    name: 'modulos',
    component: Modulos
  },
  
  {
    path: '/semestres',
    name: 'semestres',
    component: Semestres
  },

  {
    path: '/carreras/',
    name: 'carreras',
    component: Carreras
  },


  {
    path: '/sedes',
    name: 'sedes',
    component: Sedes
  },

  {
    path: '/carreras/bysede/:id',
    name: 'carrerasBySede',
    component: Carreras,
  },

  {
    path: '/semestres/bycarrera/:id',
    name: 'semestresByCarrera',
    component: Semestres
  },

  {
    path: '/modulos/bysemestre/:id',
    name: 'modulosBySemestre',
    component: Modulos
  },

  {
    path: '/materias/bymodulo/:id',
    name: 'materiasByModulo',
    component: Materias
  },


// -----------------Alumnos-------------------
  {
    path: '/tutores',
    name: 'tutores',
    component: Tutores
  },

  {
    path: '/alumnos/byTutor/:id',
    name: 'alumnosByTutor',
    component: Alumnos
  },

  {
    path: '/alumnos/byGrupo/:id',
    name: 'alumnosByGrupo',
    component: Alumnos
  },

  {
    path: '/grupos/byCarrera/:id',
    name: 'gruposByCarrera',
    component: Grupos
  },

  {
    path: '/calificaciones/byAlumno/:id',
    name: 'calificacionesByAlumno',
    component: Calificaciones
  },

  {
    path: '*',
    name: 'Not Found',
    component: NotFound
  },

  {
    path: '/cuentas/',
    name: 'cuentas',
    component: Cuentas
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
