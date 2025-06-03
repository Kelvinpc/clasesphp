CREATE DATABASE centrocapacitacion;

-- drop database centrocapacitacion;


USE centrocapacitacion;

CREATE TABLE alumnos(
	idalumno				            INT 						AUTO_INCREMENT PRIMARY KEY,
    nombre					            VARCHAR(20)					NOT NULL,
    apellidos				            VARCHAR(40)					NOT NULL,
    correo					            VARCHAR(60)					NOT NULL,
    tipodoc					            ENUM('DNI','DEX','PASS')	NOT NULL COMMENT 'DEX = Documento de EXtranjeria. PASS = Pasaporte',
    numdoc					            VARCHAR(12)					NOT NULL,

    fechacreacion			            DATE DEFAULT NOW()			NULL,
    fechamodificacion 		            DATE						NULL

)ENGINE = INNODB;



CREATE TABLE cursos(

    idcurso                             INT 						AUTO_INCREMENT PRIMARY KEY,
    curso                               VARCHAR(30)                 NOT NULL

)ENGINE = INNODB;


CREATE TABLE evaluaciones(
  
	idevaluacion			            INT							AUTO_INCREMENT PRIMARY KEY,
	titulo			                    VARCHAR(20)					NOT NULL,
    preguntas				            INT	DEFAULT 20 				NOT NULL,
    intentosDisponible		            INT DEFAULT 1 				NOT NULL,
    fechainicio				            DATE						NOT NULL,
    fechafin				            DATE						NULL,
    duracion	                        INT							NULL,

    idcurso                             INT                         NOT NULL,

    fechacreacion			            DATE DEFAULT NOW()		    NOT NULL,
    fechamodificacion 		            DATE						NULL,

	CONSTRAINT fk_idcurso_cur FOREIGN KEY (idcurso) REFERENCES cursos(idcurso) 

  
)ENGINE = INNODB;


CREATE TABLE preguntas(

    idpregunta                          INT							AUTO_INCREMENT PRIMARY KEY,
    pregunta                            VARCHAR(300)                NOT NULL,
    puntaje                             INT                         NOT NULL,

    idevaluacion                        INT                         NOT NULL,
  
    fechacreacion			            DATE DEFAULT NOW()			NOT NULL,
    fechamodificacion 		            DATE						NULL,

	CONSTRAINT fk_idevaluacion_eva FOREIGN KEY (idevaluacion) REFERENCES evaluaciones(idevaluacion) 


)ENGINE = INNODB;


CREATE TABLE alternativas(

    idalternativas                      INT							AUTO_INCREMENT PRIMARY KEY,
    texto                               VARCHAR(100)                NOT NULL,
    escorrecto                          BOOLEAN                     NOT NULL,

    idpregunta                          INT                         NOT NULL,

    fechacreacion			            DATE DEFAULT NOW()			NOT NULL,
    fechamodificacion 		            DATE						NULL,

	CONSTRAINT fk_idpregunta_pre FOREIGN KEY (idpregunta) REFERENCES preguntas(idpregunta) 


)ENGINE = INNODB;


CREATE TABLE asignaciones(

    idasignaciones                      INT							AUTO_INCREMENT PRIMARY KEY,
    fechainicio                         DATETIME                    NOT NULL,
    fechafin                            DATETIME                    NULL,

    idevaluacion                        INT                         NOT NULL,
    idalumno                            INT                         NOT NULL,

    fechacreacion			            DATE DEFAULT NOW()			NOT NULL,
    fechamodificacion 		            DATE						NULL,

    CONSTRAINT fk_idevaluacion_eval FOREIGN KEY (idevaluacion) REFERENCES evaluaciones(idevaluacion),
    CONSTRAINT fk_idalumno_alu FOREIGN KEY (idalumno) REFERENCES alumnos(idalumno) 

)ENGINE =INNODB;


CREATE TABLE respuestas(

    idrespuesta                         INT							AUTO_INCREMENT PRIMARY KEY,
    escorrecta                          BOOLEAN                     NOT NULL,  

    idasignaciones                      INT                         NOT NULL,
    idpregunta                          INT                         NOT NULL,
    idalternativas                       INT                         NOT NULL,

    fechacreacion			            DATE DEFAULT NOW()			NOT NULL,
    fechamodificacion 		            DATE						NULL,
    CONSTRAINT fk_idasignaciones_asigna_r FOREIGN KEY (idasignaciones) REFERENCES asignaciones(idasignaciones),
    CONSTRAINT fk_idpregunta_pregun_r FOREIGN KEY (idpregunta) REFERENCES preguntas(idpregunta),
    CONSTRAINT fk_idalternativa_altern_r FOREIGN KEY (idalternativas) REFERENCES alternativas(idalternativas) 

)ENGINE =INNODB;

show tables;