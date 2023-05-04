const TABLA = 'materia';

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

    

    function materiaByModulo (idmodulo){
        return db.materiaByModulo(TABLA,idmodulo);
    }

    function materiaBySemestre (idsemestre){
        return db.materiaBySemestre(TABLA,idsemestre);
    }

    function materiaByCarrera (idcarrera){
        return db.materiaByCarrera(TABLA,idcarrera);
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
        materiaByModulo,
        materiaBySemestre,
        materiaByCarrera,
        agregar,
        eliminar,
    }
}