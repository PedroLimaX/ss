const express = require('express');

const respuesta = require('../../red/respuestas');
const controlador = require('./index');


const router =  express.Router();

router.get('/', todos);
router.get('/:id', uno);
router.get('/bymodulo/:idmodulo', materiaByModulo);
router.get('/bysemestre/:idsemestre', materiaBySemestre);
router.get('/bycarrera/:idcarrera', materiaByCarrera);
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

async function materiaByModulo(req,res,next){
    try{
        const items = await controlador.materiaByModulo(req.params.idmodulo);
        respuesta.success(req,res,items,200);
    }
    catch(err){
        next(err);
    }
};


async function materiaBySemestre(req,res,next){
    try{
        const items = await controlador.materiaBySemestre(req.params.idsemestre);
        respuesta.success(req,res,items,200);
    }
    catch(err){
        next(err);
    }
};

async function materiaByCarrera(req,res,next){
    try{
        const items = await controlador.materiaByCarrera(req.params.idcarrera);
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