const mysql = require('mysql');
const config = require('../config');

const dbconfig = {
    host:config.mysql.host,
    user:config.mysql.user,
    password:config.mysql.password,
    database:config.mysql.database,


}

let conexion;

function conMysql(){
    conexion = mysql.createConnection(dbconfig);

    conexion.connect((err)=>{
        if(err){
            console.log('[db err]', err);
            setTimeout(conMysql,200);
        }
        else{
            console.log('DB Conectada');    
        }
    });

    conexion.on('error', err=>{
        console.log('[db err]', err);
        if(err.code === 'PROTOCOL_CONNECION_LOST'){
            conMysql();
        }
        else{
            throw err;
        }
    })
}

conMysql(); 


function todos(tabla){
    return new Promise( (resolve,reject) => {
        conexion.query(`SELECT * FROM ${tabla}` , (error,result) => {
            return error ? reject(error) : resolve(result);
        })
    });
}

function uno(tabla,id){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE id=${id}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}


function usuarioByMatricula(tabla,matricula){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT usuario.username, usuario.registered, usuario.last_login, alumno.id as 'alumnoId', alumno.nombre as 'alumnoNombre',
                                    alumno.apaterno as 'alumnoApaterno', alumno.amaterno as 'alumnoAmaterno',
                                    
                                    tutor.id as 'tutorId', tutor.nombre as 'tutorNombre',
                                    tutor.apaterno as 'tutorApaterno', tutor.amaterno as 'tutorAmaterno'
                            FROM ((${tabla} 
                                LEFT JOIN alumno ON usuario.username = alumno.matricula)
                                LEFT JOIN tutor ON usuario.username = tutor.iddocente)
                            WHERE usuario.username= '${matricula}'`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// ------------------MATERIAS-----------------------------

function carreraBySede(tabla,idsede){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE idsede=${idsede}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function conteoMaterias(tabla,idcarrera){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT materia.nombre as 'materiaNombre', semestre.numero as 'semestreMateria' , COUNT(if(calificacion.estatus = 'No aprobada',1,null)) as 'NoAprobadasTotal',
                            COUNT(if(calificacion.estatus = 'No cursada',1,null)) as 'NoCursadasTotal'
                            FROM ((((${tabla}
                                LEFT JOIN materia ON calificacion.idmateria = materia.id)
                                LEFT JOIN modulo ON materia.idmodulo = modulo.id)
                                LEFT JOIN semestre ON modulo.idsemestre = semestre.id)
                                LEFT JOIN carrera ON semestre.idcarrera = carrera.id)
                            WHERE carrera.id= ${idcarrera} GROUP BY calificacion.idmateria`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function semestreByCarrera(tabla,idcarrera){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE idcarrera=${idcarrera}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}



function moduloBySemestre(tabla,idsemestre){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE idsemestre=${idsemestre}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function materiaByModulo(tabla,idmodulo){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT materia.*,
                            requisito1.clave AS requisito1Clave,
                            requisito1.nombre AS requisito1Nombre,
                            requisito2.clave AS requisito2Clave,
                            requisito2.nombre AS requisito2Nombre,
                            requisito3.clave AS requisito3Clave,
                            requisito3.nombre AS requisito3Nombre,
                            correquisito.id AS correquisitoClave,
                            correquisito.clave AS correquisitoClave,
                            correquisito.nombre AS correquisitoNombre,
                            carrera.id as carreraId
                        FROM ((((((( ${tabla}
                                LEFT JOIN materia as requisito1 ON materia.requisito = requisito1.id)
                                LEFT JOIN materia as requisito2 ON materia.requisito2  = requisito2.id)
                                LEFT JOIN materia as requisito3 ON materia.requisito3 = requisito3.id)
                                LEFT JOIN materia as correquisito ON materia.correquisito = correquisito.id)
                                LEFT JOIN modulo as modulo ON materia.idmodulo = modulo.id)
                                LEFT JOIN semestre as semestre ON modulo.idsemestre = semestre.id)
                                LEFT JOIN carrera as carrera ON semestre.idcarrera = carrera.id)
                        WHERE materia.idmodulo = ${idmodulo};`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function materiaBySemestre(tabla,idsemestre){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT materia.*, modulo.*, semestre.*
                        FROM (( ${tabla}
                            LEFT JOIN modulo ON materia.idmodulo = modulo.id)
                            LEFT JOIN semestre ON modulo.idsemestre = semestre.id)
                        WHERE semestre.id =${idsemestre}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function materiaByCarrera(tabla,idcarrera){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT materia.*, modulo.id as moduloId, modulo.nombre as moduloNombre, modulo.idsemestre, semestre.id as semestreID, semestre.semestre, carrera.id as carreraId, carrera.nombre as carreraNombre
                        FROM ((( ${tabla}
                            LEFT JOIN modulo ON materia.idmodulo = modulo.id)
                            LEFT JOIN semestre ON modulo.idsemestre = semestre.id)
                            LEFT JOIN carrera ON semestre.idcarrera = carrera.id)
                        WHERE carrera.id =${idcarrera}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// ------------------ALUMNOS-----------------------------


function calificacionByAlumno(tabla,idalumno){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT calificacion.*, alumno.nombre as 'nombreAlumno',
                            alumno.matricula,
                            alumno.apaterno,
                            alumno.amaterno,
                            alumno.estatus as estatusAlumno,
                            materia.id as 'califMateriaId',
                            materia.clave as 'califMateriaClave',
                            materia.nombre as 'califMateriaNombre',
                            materia.creditos as 'califMateriaCreditos',
                            requisito1.nombre AS 'requisito1Nombre',
                            requisito1Calificacion.estatus AS 'requisito1Estatus',
                            requisito2.nombre AS 'requisito2Nombre',
                            requisito2Calificacion.estatus AS 'requisito2Estatus',
                            requisito3.nombre AS 'requisito3Nombre',
                            requisito3Calificacion.estatus AS 'requisito3Estatus',
                            correquisito.nombre AS 'correquisitoNombre',
                            correquisitoCalificacion.estatus AS 'correquisitoEstatus',
                            modulo.nombre as 'califModuloNombre',
                            semestre.semestre as 'semestre',
                            semestre.numero as 'numeroSemestre',
                            carrera.creditosmin as 'califCarreraCreditosMin',
                            carrera.id as 'carreraId'
                            FROM ((((((((((((( ${tabla}
                            LEFT JOIN alumno ON calificacion.idalumno = alumno.id)
                            LEFT JOIN materia ON calificacion.idmateria = materia.id)
                            LEFT JOIN modulo ON materia.idmodulo = modulo.id)
                            LEFT JOIN semestre ON modulo.idsemestre = semestre.id)
                            LEFT JOIN carrera ON semestre.idcarrera = carrera.id)
                            LEFT JOIN materia as requisito1 ON materia.requisito = requisito1.id)
                            LEFT JOIN materia as requisito2 ON materia.requisito2  = requisito2.id)
                            LEFT JOIN materia as requisito3 ON materia.requisito3 = requisito3.id)
                            LEFT JOIN materia as correquisito ON materia.correquisito = correquisito.id)
                            LEFT JOIN calificacion as requisito1Calificacion ON requisito1.id = requisito1Calificacion.idmateria AND calificacion.idalumno = requisito1Calificacion.idalumno)
                            LEFT JOIN calificacion as requisito2Calificacion ON requisito2.id = requisito2Calificacion.idmateria AND calificacion.idalumno = requisito2Calificacion.idalumno)
                            LEFT JOIN calificacion as requisito3Calificacion ON requisito3.id = requisito3Calificacion.idmateria AND calificacion.idalumno = requisito3Calificacion.idalumno)
                            LEFT JOIN calificacion as correquisitoCalificacion ON correquisito.id = correquisitoCalificacion.idmateria AND calificacion.idalumno = correquisitoCalificacion.idalumno)
                        WHERE alumno.id =${idalumno}
                        ORDER BY semestre.numero, materia.id;`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function carreraAlumno(tabla, idalumno){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT alumno.*, grupo.id as grupoId, carrera.id as carreraId,
                            carrera.nombre as 'carreraNombre',
                            carrera.siglas as 'carreraSiglas'
                            FROM (( ${tabla}
                                LEFT JOIN grupo ON alumno.idgrupo = grupo.id)
                                LEFT JOIN carrera ON grupo.idcarrera = carrera.id)
                            WHERE alumno.id =${idalumno}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function grupoByCarrera(tabla,idcarrera){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE idcarrera=${idcarrera}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function alumnoByGrupo(tabla,idgrupo){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE idgrupo=${idgrupo}`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}

function alumnoByTutor(tabla,idtutor){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT alumno.*, tutor.nombre as 'nombreTutor',
                                tutor.apaterno as 'apaternoTutor',
                                tutor.amaterno as 'amaternoTutor',
                                grupo.generacion as 'generacionGrupo',
                                grupo.seccion as 'seccionGrupo',
                                carrera.nombre as 'nombreCarrera',
                                carrera.siglas as 'siglasCarrera'
                            FROM ((( ${tabla}
                                LEFT JOIN tutor ON alumno.idtutor = tutor.id)
                                LEFT JOIN grupo ON alumno.idgrupo = grupo.id)
                                LEFT JOIN carrera ON grupo.idcarrera = carrera.id)
                        WHERE alumno.idtutor = ${idtutor};`,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}


function agregar(tabla,data){
    return new Promise((resolve,reject)=>{
        conexion.query(`INSERT INTO ${tabla} SET ? ON DUPLICATE KEY UPDATE ?`,[data,data],(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}


function eliminar(tabla,data){
    return new Promise((resolve,reject)=>{
        conexion.query(`DELETE FROM ${tabla} WHERE id = ?`,data.id,(error,result)=>{
            return error ? reject(error) : resolve(result);
        })
    });
}


function query(tabla,consulta){
    return new Promise((resolve,reject)=>{
        conexion.query(`SELECT * FROM ${tabla} WHERE ?`,consulta,(error,result)=>{
            return error ? reject(error) : resolve(result[0]);
        })
    });
}

module.exports = {
    todos,
    uno,
    carreraBySede,
    conteoMaterias,
    semestreByCarrera,
    moduloBySemestre,
    materiaByModulo,
    materiaBySemestre,
    materiaByCarrera,
    calificacionByAlumno,
    carreraAlumno,
    grupoByCarrera,
    alumnoByGrupo,
    alumnoByTutor,
    agregar,
    eliminar,
    usuarioByMatricula,
    query,
}