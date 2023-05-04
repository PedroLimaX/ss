const express = require('express');

const respuesta = require('../../red/respuestas');
const controlador = require('./index');


const router =  express.Router();

router.get('/', todos);
router.get('/:id', uno);
router.get('/byMatricula/:matricula', usuarioByMatricula);
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

async function usuarioByMatricula(req,res,next){
    try{
        const items = await controlador.usuarioByMatricula(req.params.matricula);
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