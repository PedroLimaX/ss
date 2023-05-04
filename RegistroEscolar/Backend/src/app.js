const express = require('express');
const cors = require('cors');
const morgan= require('morgan');
const config = require('./config');

// RUTAS MODULOS
//----------------ALUMNOS---------------------
const calificaciones = require('./modulos/calificaciones/rutas')
const alumnos = require('./modulos/alumnos/rutas')
const tutores = require('./modulos/tutores/rutas')
const grupos = require('./modulos/grupos/rutas')

//----------------MATERIAS---------------------
const materias = require('./modulos/materias/rutas')
const modulos = require('./modulos/modulos/rutas')
const semestres = require('./modulos/semestres/rutas')
const carreras = require('./modulos/carreras/rutas')
const sedes = require('./modulos/sedes/rutas')
const usuarios = require('./modulos/usuarios/rutas')
const auth = require('./modulos/auth/rutas')
const error = require('./red/errors');


const app = express();

var corsOptions = {
  origin: '*',
  optionsSuccessStatus: 200
}

//Middleware
app.use(cors(corsOptions));
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true}));

//configuracion
app.set('port', config.app.port);


//RUTAS API

//----------------ALUMNOS---------------------

app.use('/api/calificaciones', calificaciones);
app.use('/api/alumnos', alumnos);
app.use('/api/tutores', tutores);
app.use('/api/grupos', grupos);

//----------------MATERIAS---------------------

app.use('/api/materias', materias);
app.use('/api/modulos', modulos);
app.use('/api/semestres', semestres);
app.use('/api/carreras', carreras);
app.use('/api/sedes', sedes);
app.use('/api/usuarios', usuarios);
app.use('/api/auth', auth);
app.use(error);

module.exports = app;