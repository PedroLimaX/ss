const express = require('express');

const respuesta = require('../../red/respuestas');
const controlador = require('./index');


const router =  express.Router();

router.get('/', todos);
router.get('/:id', uno);
router.get('/bygrupo/:idgrupo', alumnoByGrupo);
router.get('/carrera/:idalumno', carreraAlumno);
router.get('/bytutor/:idtutor', alumnoByTutor);
router.post('/',agregar);
router.put('/',eliminar);

async function todos (req,res,next) {
    try{
        const items = await controlador.todos();
        respuesta.success(req, res, items, 200);
    }
    catch(err){
        next(err);
    } 
};

async function uno(req,res,next){
    try{
        const items = await controlador.uno(req.params.id);
        respuesta.success(req,res,items,200);
    }
    catch(err){
        next(err);
    }
};

async function carreraAlumno(req,res,next){
    try{
        const items = await controlador.carreraAlumno(req.params.idalumno);
        respuesta.success(req,res,items,200);
    }
    catch(err){
        next(err);
    }
};

async function alumnoByGrupo(req,res,next){
    try{
        const items = await controlador.alumnoByGrupo(req.params.idgrupo);
        respuesta.success(req,res,items,200);
    }
    catch(err){
        next(err);
    }
};

async function alumnoByTutor(req,res,next){
    try{
        const items = await controlador.alumnoByTutor(req.params.idtutor);
        respuesta.success(req,res,items,200);
    }
    catch(err){
        next(err);
    }
};

async function agregar(req,res,next){
    try{
        const items = await controlador.agregar(req.body);
        if(req.body.id == 0){
            mensaje = 'Item Guardado con exito';
        }else{
            mensaje = 'Item actualizado con exito';
        }
        respuesta.success(req,res,'Item eliminado correctamente',201);
    }
    catch(err){
        next(err);
    }
};

async function eliminar(req,res,next){
    try{
        const items = await controlador.eliminar(req.body);
        respuesta.success(req,res,'Item eliminado correctamente',200);
    }
    catch(err){
        next(err);
    }
};

module.exports = router;