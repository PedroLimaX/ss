const TABLA = 'calificacion';

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
    
    function calificacionByAlumno (idalumno){
        return db.calificacionByAlumno(TABLA,idalumno);
    }

    function conteoMaterias(idcarrera){
        return db.conteoMaterias(TABLA,idcarrera);
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
        calificacionByAlumno,
        conteoMaterias,
        agregar,
        eliminar,
    }
}