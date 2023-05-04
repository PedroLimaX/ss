const TABLA = 'alumno';

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
    

    function carreraAlumno (idalumno){
        return db.carreraAlumno(TABLA,idalumno);
    }

    function alumnoByGrupo (idgrupo){
        return db.alumnoByGrupo(TABLA,idgrupo);
    }

    function alumnoByTutor (idtutor){
        return db.alumnoByTutor(TABLA,idtutor);
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
        carreraAlumno,
        alumnoByGrupo,
        alumnoByTutor,
        agregar,
        eliminar,
    }
}