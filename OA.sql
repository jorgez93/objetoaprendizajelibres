CREATE DATABASE  IF NOT EXISTS `sistemaoa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sistemaoa`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: sistemaoa
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `nombreAdmin` varchar(50) NOT NULL,
  `usuarioAdmin` varchar(15) NOT NULL,
  `pwAdmin` varchar(255) NOT NULL,
  `bloqueo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAdministrador`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCarrera` varchar(100) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idCarrera`),
  KEY `idFacultad` (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario` (
  `idComentario` int(11) NOT NULL AUTO_INCREMENT,
  `detalleComent` text NOT NULL,
  `idOA` int(11) DEFAULT NULL,
  `idProfesor` int(11) DEFAULT NULL,
  `pathImagen` varchar(200) DEFAULT NULL,
  `fechaComentario` varchar(25) NOT NULL,
  `pathVideo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idOA` (`idOA`),
  KEY `idProfesor` (`idProfesor`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` varchar(100) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idDepartamento`),
  KEY `idFacultad` (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiante` (
  `idEstudiante` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaEst` varchar(10) NOT NULL,
  `nombresEst` varchar(50) NOT NULL,
  `apellidosEst` varchar(50) NOT NULL,
  `correoEst` varchar(50) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `usuarioEst` varchar(15) NOT NULL,
  `pwEst` varchar(255) NOT NULL,
  `idComentarioForo` int(11) DEFAULT NULL,
  `bloqueo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEstudiante`),
  KEY `idCarrera` (`idCarrera`),
  KEY `idComentarioForo_idx` (`idComentarioForo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `idFacultad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreFacultad` varchar(100) NOT NULL,
  PRIMARY KEY (`idFacultad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `foro`
--

DROP TABLE IF EXISTS `foro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foro` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `imagen` blob,
  `imagename` varchar(255) DEFAULT NULL,
  `archivo` blob,
  `asunto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagen`
--

DROP TABLE IF EXISTS `imagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen` (
  `idimagen` int(11) NOT NULL AUTO_INCREMENT,
  `rutaImagen` varchar(100) NOT NULL,
  PRIMARY KEY (`idimagen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materias` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMateria` varchar(200) DEFAULT NULL,
  `idCarrera` int(11) NOT NULL,
  PRIMARY KEY (`idMateria`),
  KEY `FK_idCarrera` (`idCarrera`),
  CONSTRAINT `FK_idCarrera` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objetoaprendizaje`
--

DROP TABLE IF EXISTS `objetoaprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetoaprendizaje` (
  `idOA` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha` date NOT NULL,
  `p_clave` varchar(100) NOT NULL,
  `institucion` varchar(200) NOT NULL,
  `tamano` varchar(50) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha_ing` datetime DEFAULT NULL,
  `ruta_zip` varchar(200) NOT NULL,
  `idProfesor` int(11) NOT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `descargas` int(11) DEFAULT NULL,
  PRIMARY KEY (`idOA`),
  KEY `FK_idMateria` (`idMateria`),
  CONSTRAINT `FK_idMateria` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `bodyPost` varchar(254) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `cedulaProf` varchar(10) NOT NULL,
  `nombresProf` varchar(50) NOT NULL,
  `apellidosProf` varchar(50) NOT NULL,
  `correoProf` varchar(50) NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  `usuarioProf` varchar(15) DEFAULT NULL,
  `pwProf` varchar(255) DEFAULT NULL,
  `idComentario` int(11) DEFAULT NULL,
  `idMateria` int(11) DEFAULT NULL,
  `bloqueo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProfesor`),
  KEY `idDepartamento` (`idDepartamento`),
  KEY `idComentario_idx` (`idComentario`),
  KEY `FK_idMateriaProf` (`idMateria`),
  CONSTRAINT `FK_idMateriaProf` FOREIGN KEY (`idMateria`) REFERENCES `materias` (`idMateria`),
  CONSTRAINT `idComentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`idComentario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puntuacion`
--

DROP TABLE IF EXISTS `puntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntuacion` (
  `idPuntuacion` int(11) NOT NULL AUTO_INCREMENT,
  `calificacionObjeto` int(11) DEFAULT NULL,
  `idObjetosAprendizaje` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPuntuacion`),
  KEY `FK_idObjetoAprendizaje` (`idObjetosAprendizaje`),
  CONSTRAINT `FK_idObjetoAprendizaje` FOREIGN KEY (`idObjetosAprendizaje`) REFERENCES `objetoaprendizaje` (`idOA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `idrespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `contenido` varchar(255) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `imagen` blob,
  `archivo` blob,
  `imagename` varchar(255) DEFAULT NULL,
  `idforo` int(11) DEFAULT NULL,
  `asunto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrespuesta`),
  KEY `respuestaforo_idx` (`idforo`),
  CONSTRAINT `respuestaforo` FOREIGN KEY (`idforo`) REFERENCES `foro` (`idpost`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rutaoa`
--

DROP TABLE IF EXISTS `rutaoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rutaoa` (
  `idRuta` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) DEFAULT NULL,
  `idOA` int(11) DEFAULT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rutaoa` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`idRuta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seguidores`
--

DROP TABLE IF EXISTS `seguidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seguidores` (
  `idSeg` int(11) NOT NULL AUTO_INCREMENT,
  `idseguidor` int(11) NOT NULL,
  `idseguido` int(11) NOT NULL,
  PRIMARY KEY (`idSeg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tema` (
  `idTema` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionTema` varchar(50) NOT NULL,
  `idComentario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTema`),
  KEY `FK_Comentario_idx` (`idComentario`),
  CONSTRAINT `FK_Comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`idComentario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'sistemaoa'
--

--
-- Dumping routines for database 'sistemaoa'
--
/*!50003 DROP PROCEDURE IF EXISTS `cargarComentarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargarComentarios`(
IN tmpIdOA int(11)
)
BEGIN
SELECT detalleComent, nombresProf, apellidosProf, fechaComentario, pathImagen, pathVideo
                    FROM comentario c
                    JOIN profesor p
                    ON p.idProfesor = c.idProfesor
                    WHERE idOA = tmpIdOA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cargarObj` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargarObj`()
begin
	select * from objetoaprendizaje;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cargarObjetosDescarga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargarObjetosDescarga`()
BEGIN
	select * from objetoaprendizaje;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cargarPuntuacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cargarPuntuacion`()
begin
	select o.descripcion, p.calificacionObjeto from puntuacion p, objetoaprendizaje o where o.idOA=p.idObjetosAprendizaje;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cMat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cMat`()
BEGIN
select * from materias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarCarrera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarCarrera`()
BEGIN
select * from carrera;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarMat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarMat`(
in nameMateria varchar(200))
BEGIN
select m.idMateria from materias m where m.nombreMateria = nameMateria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarMaterias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarMaterias`(
in nameCarrera varchar(100))
BEGIN
select * from materias m where m.idCarrera in (select c.idCarrera from carrera c where c.nombreCarrera=nameCarrera);  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultarMatProf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultarMatProf`(
in idMat int)
BEGIN
select p.correoProf from profesor p where p.idMateria=idMat;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarCalificacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCalificacion`(
in idObjetoAprendizaje int,
in valorObjeto int,
in idUsuario int)
begin
if (select not exists (select o.idProfesor from objetoaprendizaje o where o.idProfesor = idUsuario)= 1)
then
	if (select exists (select p.idObjetosAprendizaje from puntuacion p where p.idObjetosAprendizaje = idObjetoAprendizaje) = 0) 
	then
		insert into puntuacion(calificacionObjeto, idObjetosAprendizaje) values(valorObjeto, idObjetoAprendizaje);
	else 
		update puntuacion set calificacionObjeto=calificacionObjeto+valorObjeto where idObjetosAprendizaje= idObjetoAprendizaje; 
	end if;
    select 'Calificación con éxito' as mensaje;
else
	select 'Este usuario ya ha calificado' as mensaje;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertarDescarga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDescarga`(
in idDescargar int)
begin
	update objetoaprendizaje set descargas=descargas+1 where idOA= idDescargar; 
    select 'Gracias por descargar el Objeto de Aprendizaje' as mensaje;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarEstudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarEstudiante`(
IN cedulaEst varchar(150),
IN nombresEst varchar(150),
IN apellidosEst varchar(150),
IN correoEst varchar(100),
IN idCarrera int(11),
IN usuarioEst varchar(150),
IN pwEst varchar(150)
)
BEGIN
insert into estudiante(cedulaEst, nombresEst, apellidosEst, correoEst, idCarrera, usuarioEst, pwEst,bloqueo)
values(cedulaEst, nombresEst, apellidosEst, correoEst, idCarrera, usuarioEst, pwEst,1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarProfesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarProfesor`(
IN cedulaProf varchar(150),
IN nombresProf varchar(150),
IN apellidosProf varchar(150),
IN correoProf varchar(100),
IN idDepartamento int(11),
IN usuarioProf varchar(150),
IN pwProf varchar(150),
IN idMat int
)
BEGIN
insert into profesor(cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento, usuarioProf, pwProf, idMateria,bloqueo)
values(cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento, usuarioProf, pwProf, idMat,1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-15 13:17:30
