const app = require('./app');

const express = require('express');
const cors = require('cors');

// set up port
const PORT = process.env.PORT || 4000;
app.use(express.json());
app.use(cors());

// add routes
const router = require('./modulos/router.js');
app.use('/api', router);


// run server
app.listen(app.get('port'), ()=>{

    console.log("Servidor escuchando en el puerto ", app.get("port"));

});