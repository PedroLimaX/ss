const TABLA = 'modulo';

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

    function moduloBySemestre (idsemestre){
        return db.moduloBySemestre(TABLA,idsemestre);
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
        moduloBySemestre,
        agregar,
        eliminar,
    }
}