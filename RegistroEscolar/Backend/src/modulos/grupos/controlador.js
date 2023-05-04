const TABLA = 'grupo';

module.exports = function (dbInyectada) {

    let db= dbInyectada;

    if(!db){
        db = require('../../DB/mysql');
    }

    function todos (){
        return db.todos(TABLA);
    }
    
    function uno (id){
        return db.uno(TABLA,id);
    }
    
    function grupoByCarrera (idcarrera){
        return db.grupoByCarrera(TABLA,idcarrera);
    }
    
    function agregar (body){
        return db.agregar(TABLA,body);
    }
    
    function eliminar (body){
        return db.eliminar(TABLA,body);
    }

    return{
        todos,
        uno,
        grupoByCarrera,
        agregar,
        eliminar,
    }
}