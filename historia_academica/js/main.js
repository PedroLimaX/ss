let sedes = [
    {
        id_sede: 1,
        nombre: 'San José Chiapa',
        direccion: 'Calle 2 sur s/n Ciudad Modelo',
        municipio: 'San José Chiapa',
        carreras: [
            {
                id_carrera: 1,
                nombre: 'Ingeniería en Sistemas y tecnologías de la Información Industrial',
                creditosmin: 250,
                creditosmax: 282,
                horasmin: 4950,
                horasmax: 5526,
                semestres: [
                    //Semestre 1
                    {
                        id_semestre: 1,
                        creditos_totales: 34,
                        modulos: [
                            {
                                id_modulo: 1,
                                nombre_modulo: 'Modelado de Fenomenos Fisicos Existentes en un problema de Ingenieria',
                                creditos_modulo: 16,
                                tipo_modulo: 'tci',

                                materias: [
                                    {
                                        id_materia: 1,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Introduccion a las Ciencias de la Ingenieria',
                                        creditos_materia: 2,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 2,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Modelado de Fenomenos fisicos',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'pendiente',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 3,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Fenomenos Fisicos 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'reprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 4,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Matematicas 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'no_disponible',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 5,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Razonamiento Algoritmico',
                                        creditos_materia: 2,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 2,
                                nombre_modulo: 'Diseño y Desarrollo de Software Industrial 1',
                                creditos_modulo: 14,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 6,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Ingenieria de Software Industrial 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 7,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Lenguajes de Programacion 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 8,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Ingenieria y Tecnologias Web 1',
                                        creditos_materia: 3,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 9,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Base de Datos 1',
                                        creditos_materia: 3,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 3,
                                nombre_modulo: 'Lengua Extranjera',
                                creditos_modulo: 4,
                                tipo_modulo: 'general',

                                materias: [
                                    {
                                        id_materia: 10,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Lengua Extranjera 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2019',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    },
                    //semestre 2
                    {
                        id_semestre: 2,
                        creditos_totales: 32,
                        modulos: [
                            {
                                id_modulo: 4,
                                nombre_modulo: 'Diseño de Experimentos',
                                creditos_modulo: 10,
                                tipo_modulo: 'tci',

                                materias: [
                                    {
                                        id_materia: 11,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Diseño y Realizacion de Experimentos',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 12,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Estadistica 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 13,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Matematica Vectorial y Matricial',
                                        creditos_materia: 2,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 5,
                                nombre_modulo: 'Diseño y Desarrollo de Software Industrial 2',
                                creditos_modulo: 14,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 14,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Ingenieria de Software Industrial 2',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 15,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Lenguajes de Programacion 2',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 16,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Aplicaciones Moviles 1',
                                        creditos_materia: 3,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 17,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Base de Datos 2',
                                        creditos_materia: 3,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 6,
                                nombre_modulo: 'Formacion Humana y Social',
                                creditos_modulo: 4,
                                tipo_modulo: 'general',

                                materias: [
                                    {
                                        id_materia: 18,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Formacion Humana y Social',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 7,
                                nombre_modulo: 'Lengua Extranjera',
                                creditos_modulo: 4,
                                tipo_modulo: 'general',

                                materias: [
                                    {
                                        id_materia: 19,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Lengua Extranjera 2',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }

                        ]
                    },
                    //Semestre 3
                    {
                        id_semestre: 3,
                        creditos_totales: 32,
                        modulos: [
                            {
                                id_modulo: 8,
                                nombre_modulo: 'Solucion de Problemas de Ingenieria Asociados a la Produccion',
                                creditos_modulo: 12,
                                tipo_modulo: 'tci',

                                materias: [
                                    {
                                        id_materia: 20,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Solucion de los Problemas de Ingenieria',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 21,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Teoria de Resolucion de Problemas de Inventiva',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 22,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Analisis y Resolucion Creativa de Problemas',
                                        creditos_materia: 2,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 23,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Vigilancia y Prospectiva Tecnologica',
                                        creditos_materia: 2,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 9,
                                nombre_modulo: 'Sistemas de Informacion en las Organizaciones',
                                creditos_modulo: 18,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 24,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Integracion de los Sistemas de Informacion en las Organizaciones',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 25,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Sistemas de Informacion Empresarial',
                                        creditos_materia: 2,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 26,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Inteligencia de Negocios',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 27,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Mineria de Datos',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 28,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Introduccion a Big Data',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 10,
                                nombre_modulo: 'Area Basica',
                                creditos_modulo: 3,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 29,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Fisica',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 11,
                                nombre_modulo: 'Lengua Extranjera',
                                creditos_modulo: 3,
                                tipo_modulo: 'general',

                                materias: [
                                    {
                                        id_materia: 30,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Lengua Extranjera 3',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2020',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    },
                    //semestre 4
                    {
                        id_semestre: 4,
                        creditos_totales: 36,
                        modulos: [
                            {
                                id_modulo: 12,
                                nombre_modulo: 'Diseño y Evaluacion de Procesos y Sistemas de Ingenieria',
                                creditos_modulo: 12,
                                tipo_modulo: 'tci',

                                materias: [
                                    {
                                        id_materia: 31,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Diseño y Evaluacion de Procesos y Sistemas de Ingenieria',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 32,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Teoria General de Sistemas',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 33,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Analisis y Diseño de Procesos (Modelado de Procesos de Negocios)',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 13,
                                nombre_modulo: 'Diseño, Seleccion, Implementacion y Gestion de Soluciones Empresariales de TI',
                                creditos_modulo: 16,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 34,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Diseño y Gestion de una Arquitectura Empresarial de Informacion en una Organizacion',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 35,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Arquitectura Empresarial',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 36,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Arquitectura de Computo en la Nube',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 37,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Estrucctura de Gestion y Control de los Servicios de TI',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 14,
                                nombre_modulo: 'Desarrollo de Habilidades del Pensamiento Complejo',
                                creditos_modulo: 4,
                                tipo_modulo: 'general',

                                materias: [
                                    {
                                        id_materia: 38,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Desarrollo de Habilidades del Pensamiento Complejo',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 15,
                                nombre_modulo: 'Lengua Extranjera',
                                creditos_modulo: 4,
                                tipo_modulo: 'general',

                                materias: [
                                    {
                                        id_materia: 39,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Lengua Extranjera 4',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    },
                    //semestre 5
                    {
                        id_semestre: 5,
                        creditos_totales: 36,
                        modulos: [
                            {
                                id_modulo: 16,
                                nombre_modulo: 'Gestion de Proyectos de Ingenieria',
                                creditos_modulo: 12,
                                tipo_modulo: 'tci',

                                materias: [
                                    {
                                        id_materia: 40,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Gestion de Proyectos',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 41,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Gestion de la Calidad',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 42,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Ingenieria Economica',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 17,
                                nombre_modulo: 'Arquitecturas de Computo, Sistemas y Redes de Comunicacion',
                                creditos_modulo: 16,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 43,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Infraestructura de Tecnologias de la Informacion',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 44,
                                        nombre_materia: 'Sistemas Operativos',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 45,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Redes de Computadoras',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 46,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Aseguramiento de la Seguridad de la Informacion',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 18,
                                nombre_modulo: 'Gestion Estrategica de los Sistemas de Informacion',
                                creditos_modulo: 4,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 47,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Diseño de una Estrategia para la Implementacion, Actualizacion o Mejora de los Sistemas de Informacion de una Empresa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 19,
                                nombre_modulo: 'Asignaturas Optativas Complementarias',
                                creditos_modulo: 4,
                                tipo_modulo: 'asignatura-optativa',

                                materias: [
                                    {
                                        id_materia: 48,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Optativa 1',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño  2021',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    },
                    //semestre 6
                    {
                        id_semestre: 6,
                        creditos_totales: 36,
                        modulos: [
                            {
                                id_modulo: 20,
                                nombre_modulo: 'Innovacion y Emprendimiento',
                                creditos_modulo: 8,
                                tipo_modulo: 'tci',

                                materias: [
                                    {
                                        id_materia: 49,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Innovacion y Emprendimiento',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 50,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Innnovacion Centrada en el Cliente',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 21,
                                nombre_modulo: 'Interaccion Humano Computadora',
                                creditos_modulo: 20,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 51,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Diseño Centrado en la Experiencia del Usuario',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 52,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Programacion de Sistemas Interactivos',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 53,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Realidad Virtual',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 54,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Realidad Aumentada y Mixta',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 55,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Procesamiento de Lenguaje Natural',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 22,
                                nombre_modulo: 'Simulacion',
                                creditos_modulo: 4,
                                tipo_modulo: 'disciplina',

                                materias: [
                                    {
                                        id_materia: 56,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Modelado y Simulacion de Sistemas',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 23,
                                nombre_modulo: 'Asignaturas Optativas Complememtarias',
                                creditos_modulo: 4,
                                tipo_modulo: 'asignatura-optativa',

                                materias: [
                                    {
                                        id_materia: 57,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Optativa 2',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Primavera 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    },
                    //semestre 7
                    {
                        id_semestre: 7,
                        creditos_totales: 41,
                        modulos: [
                            {
                                id_modulo: 24,
                                nombre_modulo: 'Optativo Disciplinario 1',
                                creditos_modulo: 16,
                                tipo_modulo: 'optativo',

                                materias: [
                                    {
                                        id_materia: 58,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Integradora del Modulo',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 59,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 60,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 61,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 25,
                                nombre_modulo: 'Optativo Complementario 1',
                                creditos_modulo: 16,
                                tipo_modulo: 'optativo',

                                materias: [
                                    {
                                        id_materia: 62,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Integradora del Modulo',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 63,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 64,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 65,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 26,
                                nombre_modulo: 'Asignaturas Optativas Complementarias',
                                creditos_modulo: 4,
                                tipo_modulo: 'asignatura-optativa',

                                materias: [
                                    {
                                        id_materia: 66,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Optativa 3',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'aprobada',

                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 27,
                                nombre_modulo: 'Practicas Profesionales',
                                creditos_modulo: 5,
                                tipo_modulo: 'pp-ss',

                                materias: [
                                    {
                                        id_materia: 67,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Practicas Profesionales',
                                        creditos_materia: 5,
                                        totalh: 240,
                                        status: 'aprobada',
                                        periodo_aprobada: 'Otoño 2022',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    },
                    //semestre 8
                    {
                        id_semestre: 8,
                        creditos_totales: 30,
                        modulos: [
                            {
                                id_modulo: 28,
                                nombre_modulo: 'Optativo Disciplinario 2',
                                creditos_modulo: 16,
                                tipo_modulo: 'optativo',

                                materias: [
                                    {
                                        id_materia: 68,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Integradora del Modulo',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'pendiente',

                                        periodo_aprobada: 'Primavera 2023',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 69,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'pendiente',

                                        periodo_aprobada: 'Primavera 2023',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 70,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'pendiente',

                                        periodo_aprobada: 'Primavera 2023',
                                        programa_educativo: 'Desconocido',
                                    },
                                    {
                                        id_materia: 71,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Formativa',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'pendiente',

                                        periodo_aprobada: 'Primavera 2023',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 29,
                                nombre_modulo: 'Asignaturas Optativas Complementarias',
                                creditos_modulo: 4,
                                tipo_modulo: 'asignatura-optativa',

                                materias: [
                                    {
                                        id_materia: 72,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Asignatura Optativa 4',
                                        creditos_materia: 4,
                                        ht: 2,
                                        hp: 2,
                                        totalh: 72,
                                        status: 'pendiente',

                                        periodo_aprobada: 'Primavera 2023',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            },
                            {
                                id_modulo: 30,
                                nombre_modulo: 'Servicio Social',
                                creditos_modulo: 10,
                                tipo_modulo: 'pp-ss',

                                materias: [
                                    {
                                        id_materia: 73,
                                        clave_materia: 'ABC123',
                                        nombre_materia: 'Servicio Social',
                                        creditos_materia: 10,
                                        totalh: 480,
                                        status: 'pendiente',
                                        periodo_aprobada: 'Primavera 2023',
                                        programa_educativo: 'Desconocido',
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ]
    }
];


function domGenerate() {
    for (let index = 0; index < sedes.length; index++) {
        let container = document.getElementsByClassName('sedes')[0];
        let element = document.createElement('div');
        element.className = 'sede';
        element.id = 'sede-' + sedes[index].id_sede;
        element.innerHTML = `
            <h2>Sede: ${sedes[index].nombre}</h2>
        `;
        let sedeId = index;
        container.appendChild(element);
        domCarreras(sedeId);
    }
}

function domCarreras(sedeId) {
    for (let index = 0; index < sedes[sedeId].carreras.length; index++) {
        let container = document.getElementsByClassName('sede')[0];
        let element = document.createElement('div');
        element.className = 'carrera';
        element.id = 'carrera-' + sedes[sedeId].carreras[index].id_carrera;
        element.innerHTML = `
            <p>Carrera: ${sedes[sedeId].carreras[index].nombre}</p>
            <span>Creditos Minimos: ${sedes[sedeId].carreras[index].creditosmin} 
                | Creditos Maximos: ${sedes[sedeId].carreras[index].creditosmax}
                | Horas Minimas: ${sedes[sedeId].carreras[index].horasmin}
                | Horas Maximas: ${sedes[sedeId].carreras[index].horasmax}
            </span>
        `;
        let carreraId = index;

        container.appendChild(element);
        domSemestres(sedeId, carreraId);
    }
}

function domSemestres(carreraId, sedeId) {
    for (let index = 0; index < sedes[sedeId].carreras[carreraId].semestres.length; index++) {
        let container = document.getElementsByClassName('carrera')[0];
        let element = document.createElement('div');
        element.className = 'semestre';
        element.id = 'semestre-' + sedes[sedeId].carreras[carreraId].semestres[index].id_semestre;
        element.innerHTML = `
            <h2>Semestre: ${sedes[sedeId].carreras[carreraId].semestres[index].id_semestre}</h2>
            <h3>Creditos Totales: ${sedes[sedeId].carreras[carreraId].semestres[index].creditos_totales}</h3>
        `;
        let semestreId = index;

        container.appendChild(element);
        domModulos(sedeId, carreraId, semestreId);
    }
}


function domModulos(sedeId, carreraId, semestreId) {
    for (let index = 0; index < sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos.length; index++) {
        const semestreTagId = 'semestre-';
        let container = document.getElementById(semestreTagId.concat(sedes[sedeId].carreras[carreraId].semestres[semestreId].id_semestre));
        let element = document.createElement('div');
        element.className = 'modulo modulo-' + sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[index].tipo_modulo;
        element.id = 'modulo-' + sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[index].id_modulo;

        element.innerHTML = `
            <p>Modulo: ${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[index].nombre_modulo}</p>
            <span>Creditos por Modulo: ${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[index].creditos_modulo}</span>
            <div class='modulo-header'>
                <span>Clave</span>
                <span>Nombre de la Materia</span>
                <span>C&eacute;ditos</span>
                <span>Horas Totales</span>
                <span>Periodo Aprobada</span>
                <span>Status</span>
            </div>
        `;

        let moduloId = index;

        container.appendChild(element);

        domMaterias(sedeId, carreraId, semestreId, moduloId);
    }
}

function domMaterias(sedeId, carreraId, semestreId, moduloId) {
    for (let index = 0; index < sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias.length; index++) {
        const moduloTagId = 'modulo-';
        let container = document.getElementById(moduloTagId.concat(sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].id_modulo));
        let element = document.createElement('div');
        element.className = 'materia'
        element.id = 'materia-' + sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[index].id_materia;
        element.innerHTML = `
                <span class='clave-materia'>${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[index].clave_materia}</span>
                <span class='nombre-materia'>${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[index].nombre_materia}</span>
                <span class="creditos-materia">${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[index].creditos_materia}</span>
                
                <span class="totalh-materia">${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[index].totalh}</span>
                <span class="periodo-aprobada">${sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[index].periodo_aprobada}</span>
                `;
        let materiaId = index;
        container.appendChild(element);
        domMateriaStauts(sedeId, carreraId, semestreId, moduloId, materiaId);
        element.addEventListener("click", function () { location.href = "materia_info.html"; });

    }
}


function domMateriaStauts(sedeId, carreraId, semestreId, moduloId, materiaId) {
    const materiaTagId = 'materia-';
    let container = document.getElementById(materiaTagId.concat(sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[materiaId].id_materia));
    let element = document.createElement('div');
    element.className = 'icon status-icon'

    if (sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[materiaId].status == 'aprobada') {
        element.innerHTML = `
            <i class='bx bx-check'></i>
        `;
    }
    else if (sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[materiaId].status == 'reprobada') {
        element.innerHTML = `
            <i class='bx bx-x'></i>
        `;
    }
    else if (sedes[sedeId].carreras[carreraId].semestres[semestreId].modulos[moduloId].materias[materiaId].status == 'pendiente') {
        element.innerHTML = `
            <i class='bx bx-time'></i>
        `;
    }
    else {
        element.innerHTML = `
            <i class='bx bx-minus-circle'></i>
        `;
    }

    container.appendChild(element);

}


function domMateriaInfo(semestreId, moduloId, materiaId) {
    let container = document.getElementsByClassName('materiaInfo')[0];
    let element = document.createElement('div');
    element.innerHTML = `
        <span class='clave-materia'>a</span>
        `;
    container.appendChild(element);
};

domGenerate();