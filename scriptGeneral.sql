DROP DATABASE if exists `um`;
CREATE DATABASE `um`
    DEFAULT CHARACTER SET = latin1
	DEFAULT COLLATE = latin1_spanish_ci;
	
USE `um`;

  DROP TABLE IF EXISTS `tbniveles`;
  CREATE TABLE `tbniveles` (
  `idNivel` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idNivel`)
) ENGINE=InnoDB  COMMENT='Catalogo de Niveles de Colocación';

INSERT INTO `um`.`tbniveles` (`descripcion`) VALUES ('Básico');
INSERT INTO `um`.`tbniveles` (`descripcion`) VALUES ('Medio'); 
INSERT INTO `um`.`tbniveles` (`descripcion`) VALUES ('Alto'); 
INSERT INTO `um`.`tbniveles` (`descripcion`) VALUES ('Nativo');
	
DROP TABLE if exists `tbcarreras`;

CREATE TABLE `tbcarreras` (
  `idCarrera` tinyint(1) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `descripcion` varchar(38)  NOT NULL COMMENT 'Nombre de las diferentes carreras de la Universidad Marista.',
  PRIMARY KEY (`idCarrera`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB COMMENT='Cátalogo con las carreras de la Universidad Marista';

INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Actuaria');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Administracion y Direccion del Deporte');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Administracion y Mercadotecnia');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Arquitectura');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Ciencias de la Comunicacion');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Contaduria');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Derecho');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Diseno Grafico');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Ingeniería Industrial');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Ingeniería Mecatrónica');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Negocios Internacionales');
INSERT INTO `um`.`tbcarreras` (`descripcion`) VALUES ('Psicologia');


DROP TABLE if exists `tbpreguntas`;

CREATE TABLE `tbpreguntas` (
  `idPregunta` int(11) NOT NULL AUTO_INCREMENT,
  `oracion` varchar(200) NOT NULL,
  `idNivel` tinyint(1) NOT NULL DEFAULT '1',  
  `o1` varchar(50) NOT NULL,
  `v1` tinyint(1) NOT NULL CHECK (v1 IN (0,1)),
  `o2` varchar(50) NOT NULL,
  `v2` tinyint(1) NOT NULL CHECK (v2 IN (0,1)),
  `o3` varchar(50) NOT NULL,
  `v3` tinyint(1) NOT NULL CHECK (v3 IN (0,1)),
  `o4` varchar(50) DEFAULT NULL,
  `v4` tinyint(1) NOT NULL CHECK (v4 IN (0,1)),  
  `imagen` blob  DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `fkNivelPregunta_idx` (`idNivel`),
  CONSTRAINT `fkNivelPregunta` FOREIGN KEY (`idNivel`) REFERENCES `tbniveles` (`idNivel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  COMMENT='En esta tabla se almacenarán las preguntas del examen de colocación para medir el nivel de inglés de un alumno en la Universidad marista.';

/*DROP VIEW if exists vPreguntas;
CREATE VIEW vPreguntas AS 
  SELECT * FROM tbpreguntas 
  WHERE nivel  IN (1, 2, 3)
  AND v1 IN (0,1)
  AND v2 IN (0,1)
  AND v3 IN (0,1)
  AND v4 IN (0,1)
  AND v5 IN (0,1)
  WITH CHECK OPTION;*/ /*'Esta vista se crea para garantizar la integridad relacional de la tbPreguntas.'*/
  

DROP TABLE if exists `tbaspirantes`;
CREATE TABLE `tbaspirantes` (
  `idAspirante` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(120) NOT NULL COMMENT 'Nombre o nombres del Aspirante. Mandatory',
  `aPaterno` varchar(80) NOT NULL COMMENT 'Apellido Paterno del Aspirante. Mandatory',
  `aMaterno` varchar(80) DEFAULT NULL COMMENT 'Apellido Materno del aspirante. NOT Mandatory',
  `fNacimiento` date NOT NULL COMMENT 'Fecha de nacimiento del aspirante. Mandatory',
  `escuelaProc` varchar(250) NOT NULL COMMENT 'Escuela de Procedencia. Mandatory',
  `tipoEscuela` tinyint(1) DEFAULT NULL COMMENT 'Clasifica el tipo de Escuela donde procede el estudiante',
  `idNivel` tinyint(1) NOT NULL DEFAULT '1',
  `idCarrera` tinyint(1) NOT NULL COMMENT 'Carrera en la que se encuentra inscrito el aspirante',
  PRIMARY KEY (`idAspirante`),  
  KEY `fkAspiranteCarrera_idx` (`idCarrera`),
  CONSTRAINT `fkAspiranteCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `tbcarreras` (`idCarrera`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB  COMMENT='tabla que registra los datos de los aspirantes.';

DROP TABLE if exists `tbaspirantesniveles`;
CREATE TABLE `tbaspirantesniveles` (
  `idAspirante` int(11) NOT NULL,
  `idPregunta` int(11) NOT NULL,
  `respuesta` tinyint(1) DEFAULT NULL,
  KEY `fkAspirantePregunta_idx` (`idPregunta`),
  KEY `fkAspirante_idx` (`idAspirante`),
  CONSTRAINT `fkAspirantePregunta` FOREIGN KEY (`idPregunta`) REFERENCES `tbpreguntas` (`idPregunta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fkAspirante` FOREIGN KEY (`idAspirante`) REFERENCES `tbaspirantes` (`idAspirante`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB;