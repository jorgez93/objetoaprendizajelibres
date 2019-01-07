-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sistemaoa
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES (1,'Administrador','admin','$2y$10$nXfCxVyPD5M8nTsPR3Dk3.tBDBY2WZKrQqFuKXk7pGy/DjPkjNIKC',1);
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Fisica',1),(2,'Matematicas',1),(3,'Ingenieria Matematica',1),(4,'Ingenieria en Ciencias Economicas y Financieras',1),(5,'Maestria en Fisica',1),(6,'Ingenieria Empresarial',2),(7,'Ingenieria de la Produccion',2),(8,'Maestria en Gestion de Software',2),(9,'Maestria en Gestion de Recusos Humanos',2),(10,'Ingenieria Civil',3),(11,'Ingenieria Ambiental',3),(12,'Ingenieria Electrica',4),(13,'Ingenieria Electrica y Control',4),(14,'Ingenieria Electrica y en Redes de Comunicacion',4),(15,'Ingenieria Electrica y Telecomunicaciones',4),(16,'Maestria en Gestion de Produccion',4),(17,'Maestria en Conectividad y Redes de Telecomunicaciones',4),(18,'Maestria en Automatizacion y Control Electronico Industrial',4),(19,'Maestria en Administracion de Negocios Electricos',4),(20,'Maestria en Ingenieria­a Electrica en Distribucion',4),(21,'Maestria en Redes Elecctricas Inteligentes',4),(22,'Ingenieria en Geologia',5),(23,'Ingenieria en Petroleos',5),(24,'Ingenieria Mecanica',6),(25,'Maestria en Mecatronica y Robotica',6),(26,'Maestria en Sistemas Automotrices',6),(27,'Maestria en Disenoo y Simulacion',6),(28,'Programa Doctoral en Ciencias de la Mecanica',6),(29,'Ingenieria Agroindustrial',7),(30,'Ingenieria Quimica',7),(31,'Ingenieria en Software',8),(32,'Ingenieria en Computacion',8),(33,'Ingenieria en Sistemas Informaticos y de Computacion',8),(34,'Maestria y Especialista en Gestion de las Comunicaciones y Tecnologia de la Informacion',8),(35,'Maestria en Ciencias de la Computacion',8),(36,'Maestria en Sistemas de Informacion',8),(37,'Doctorado en Informatica',8),(38,'Tecnologia en Electronica y Telecomunicaciones',9),(39,'Tecnologia en Ana¡lisis de Sistemas Informaticos',9),(40,'Tecnologia en Electromecanica',9),(41,'Tecnologia en Agua y Saneamiento Ambiental',9);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Adjuntar mejor objeto de aprendizaje',NULL,NULL,NULL,'0000-00-00',NULL),(2,'El debate se debe implementar mejor',NULL,NULL,NULL,'0000-00-00',NULL),(3,'Se debe realizar una mejor suma para un total de objeto de aprendizaje',NULL,NULL,NULL,'0000-00-00',NULL),(4,'Los problemas de los objetos de aprendizaje se deben crear mejor',NULL,NULL,NULL,'0000-00-00',NULL),(5,'Me parece que se debe realizar una adaptacion al problema',NULL,NULL,NULL,'0000-00-00',NULL),(6,'buen ejercicio',1,2,NULL,'0000-00-00',NULL),(7,'te faltan datos en los ejercicios',1,3,NULL,'0000-00-00',NULL),(8,'buenos dias estimado profesor me puede dar mas informacion',1,1,NULL,'0000-00-00',NULL),(9,'Me parece que esta mal su documentacion',3,2,NULL,'0000-00-00',NULL),(10,'prueba',1,2,NULL,'0000-00-00',NULL),(11,'mejore sus preguntas',2,1,NULL,'23/06/2018',NULL),(12,'',3,2,NULL,'26/06/2018',NULL),(13,'',3,2,NULL,'26/06/2018',NULL),(14,'',3,2,NULL,'27/06/2018',NULL),(15,'',3,2,NULL,'27/06/2018',NULL),(16,'',2,2,NULL,'27/06/2018',NULL),(17,'me parece que esta incorrecto',3,2,NULL,'27/06/2018',NULL),(18,'soy otro estudiante',3,1,NULL,'27/06/2018',NULL),(22,'nuevo objeto',3,2,'img/wallpapers-hd.jpg','01/07/2018',NULL),(23,'nueva imagen',3,2,'img/paraisos-en-el-mar-wallpaper-4k-full-hd-fotosdelanaturaleza.es-2-1140x641.jpg','01/07/2018',NULL),(24,'Tenga una base con este video',3,2,'img/','02/07/2018','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/EY2SWmKwo4k\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>'),(25,'probando con un nuevo video',1,2,'img/paraisos-en-el-mar-wallpaper-4k-full-hd-fotosdelanaturaleza.es-2-1140x641.jpg','11/07/2018','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wjU8j2bj3RY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>'),(26,'sasdsddassaddas',4,2,'img/wallpapers-hd.jpg','11/07/2018','<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wjU8j2bj3RY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>'),(27,'>P',6,4,'img/fis.jpeg','24/07/2018','https://www.youtube.com/watch?v=hueM23rMcC4'),(28,'comentalo xfis jajja\r\n',6,7,'img/richard stallman.png','24/07/2018','');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Departamento de Fisica (DF)',1),(2,'Departamento de Matematica (DM)',1),(3,'Departamento de Ciencias Administrativas (DEPCA)',2),(4,'Departamento de Estudios Organizacionales Desarrollo Humano (DESODEH)',2),(5,'Departamento de Ingenieria Civil y Ambiental (DICA)',3),(6,'Departamento de Automatizacion y Control Industrial (DACI)',4),(7,'Departamento de Energia Electrica (DEE)',4),(8,'Departamento de Electronica, Telecomunicaciones y Redes de Informacion (DETRI)',4),(9,'Departamento de Geologia (DG)',5),(10,'Departamento de Petroleos (DP)',5),(11,'Departamento de Ingenieria Mecanica (DIM)',6),(12,'Departamento de Materiales (DMT)',6),(13,'Departamento de Ingenieria Quimica (DIQ)',7),(14,'Departamento de Ciencias de Alimentos y Biotecnologia (DECAB)',7),(15,'Departamento de Ciencias Nucleares (DCN)',7),(16,'Departamento de Metalurgia Extractiva (DEMEX)',7),(17,'Departamento de Informatica y Ciencias de la Computacion (DICC)',8),(18,'Departamento de Formacion Basica (DFB)',10),(19,'Instituto Geofisico',10),(20,'Departamento de Ciencias Sociales',10);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,'1723128318','mario javier','giler salavarria','mariojavier0795@gmail.com',10,'mgiler','$2y$10$eaoIIJKksVJPp6j6HFhK7uy5Xjy8K6f.bLnp6RJl7flJxQPsGFBCm',0,1),(2,'1304189200','kelly','salavarria','mariojavier0795@gmail.com',7,'kelysalavarria','$2y$10$PB1w4WFJZHYAL6uPOX/fB.fGC/qEcm4QGw0A/h1uJR//GvWxpmRJe',0,1),(3,'1302207228','jersson','andrango','jerssonandrangon@gmail.com',1,'jandrango','$2y$10$FafD6HkCIqLBVAPKea9adOLteCXadO6U250E5vILQoDRSMfBOSB3C',NULL,0),(4,'1302207228','carlos','mendoza','carlosmendoza@gmail.com',10,'carlos','$2y$10$CrBf6xmJSlwTAcF5VK1Do.XCf3Arq5CDarb.5bfMdm4KV5dRCd0l2',NULL,1),(5,'1725937302','Steven','zambrano','stevenzambrano1@hotmail.com',2,'steven','$2y$10$xtLBOeb3.1qD9HosKA3YWeDkB.ygo/fW3yAqphJHcnh88QKkObB9y',NULL,1),(6,'1725937302','ramon','zambrano','stevenzambrano1@hotmail.com',12,'steven','$2y$10$A87xL.OXdvlR7J95FAhiD.GrR90JAlMWPxPqlLBy2TBbgVW5VF7E6',NULL,1),(7,'0502873326','Fernando','Pasquel','kfcp1234@gmail.com',3,'fernando','$2y$10$iot5juohdtU.RFQp9GRtfe.0OWWSzAT79x6i/NTt2JuP0m53GPtuq',NULL,1);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Facultad de Ciencias'),(2,'Facultad de Ciencias Administrativas'),(3,'Facultad de Ing. Civil y Ambiental'),(4,'Facultad de Ing. Electrica y Electronica'),(5,'Facultad de Geologia y Petroleos'),(6,'Facultad de Ing. Mecanica'),(7,'Facultad de Ing. Quimica y Agroindustria'),(8,'Facultad de Ing. de Sistemas'),(9,'Escuela de Formacion de Tecnologos'),(10,'Otros');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `imagen`
--

LOCK TABLES `imagen` WRITE;
/*!40000 ALTER TABLE `imagen` DISABLE KEYS */;
INSERT INTO `imagen` VALUES (1,'img/wallpapers-hd.jpg'),(2,'img/comprobante.jpg'),(3,'img/paraisos-en-el-mar-wallpaper-4k-full-hd-fotosdelanaturaleza.es-2-1140x641.jpg');
/*!40000 ALTER TABLE `imagen` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (1,'Metrología',24),(2,'Tecnología de fundición',24),(3,'Tecnología de cconformado',24),(4,'Fisica Molecular',1),(5,'Fisica Experimental',1),(6,'Mecanica Newtoniana',1),(7,'Probabilidad y Estadistica',1),(8,'Calculo en una Variable',2),(9,'Probabilidad y Estadistica',2),(10,'Analisis Numerico I',2),(11,'Geometria',2),(12,'Biomatematica y Ecologia',2),(13,'Algebra Lineal',3),(14,'Analisis Vectorial',3),(15,'Optimizacion',3),(16,'Geometria',3),(17,'Fisica',3),(18,'Legislacion Empresarial',4),(19,'Geografia Economica',4),(20,'Teoria Monetaria',4),(21,'Desarrollo Sustentable',4),(22,'Finanzas',4),(23,'-',5),(24,'-',5),(25,'-',5),(26,'-',5),(27,'-',5),(28,'Contabilidad General',6),(29,'Administracion',6),(30,'Gestion de Ventas',6),(31,'Auditoria Financiera',6),(32,'Formulacion de Proyectos',6),(33,'Quimica General',7),(34,'Mecanica Newtoniana',7),(35,'Estadistica Aplicable',7),(36,'Ingenieria Financiera',7),(37,'Programacion Avanzada',7),(38,'Inteligencia de Negocios',8),(39,'Plataformas Tecnologicas',8),(40,'Aseguramiento de la calidad y seguridad del software',8),(41,'Herramientas de Seguridad de Software',8),(42,'Calidad del Producto de Software',8),(43,'-',9),(44,'-',9),(45,'-',9),(46,'-',9),(47,'-',9),(48,'Topografia',10),(49,'Calculo Vectorial',10),(50,'Estructuras',10),(51,'Probabilidad y Estadistica',10),(52,'Mecanica de Suelos',10),(53,'Fundamentos de Biologia',11),(54,'Algebra Lineal',11),(55,'Ingenieria de la Reaccion',11),(56,'Bioquimica',11),(57,'Limnologia',11),(58,'Mecanica Newtoniana',12),(59,'Software de Simulacion',12),(60,'Alto Voltaje',12),(61,'Teoria Electromagnetica',12),(62,'Control Industrial',12),(63,'Fisica General',13),(64,'Calculo en una Variable',13),(65,'Analisis de Seniales y Sistemas',13),(66,'Probabilidad y Estadistica',13),(67,'Maquinas Electricas',13),(68,'Calculo en una Variable',14),(69,'Teoria Electromagnetica',14),(70,'Programacion Orienda a Objetos',14),(71,'Seguridad en Redes',14),(72,'Aplicaciones Distribuidas',14),(73,'Algebra Lineal',15),(74,'Ecuaciones Diferenciales Ordinarias',15),(75,'Circuitos Electronicos',15),(76,'Ingenieria de Trafica',15),(77,'Sistemas de Transmision',15);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetoaprendizaje`
--

LOCK TABLES `objetoaprendizaje` WRITE;
/*!40000 ALTER TABLE `objetoaprendizaje` DISABLE KEYS */;
INSERT INTO `objetoaprendizaje` VALUES (1,'Fundamentos de Software Libre','Mario Giler','Objeto de aprendizaje Software Libre','2018-06-14','OAmario','Escuela Politecnica Nacional','1174849 bytes','WinRAR ZIP',NULL,'zip/WEB.zip',2,1,1),(2,'Fundamentos de Software Libre','Charles giler','Objeto de aprendizaje de metodos agiles','2018-06-15','OAcharles','Escuela Politecnica Nacional','1195349 bytes','WinRAR ZIP','2018-06-15 00:00:00','zip/SCROM.zip',3,1,2),(3,'Interfaz de Usuario','Fernando Carrasco','Documento para saber sobre la interfaz de usuario','2018-06-15','OAusuario','Escuela Politecnica Nacional','111760 bytes','WinRAR ZIP','2018-06-15 00:00:00','zip/DisenioDeInterfazDeUsuario.zip',4,2,3),(4,'DISEÑO A NIVEL DE COMPONENTES','Tamayo Edison','Son líneas de diseño bien definidas que adecuan la estructura de diseño, el interfaz y diseño.','2018-01-02','Diseño a nivel de Componentes','Escuela Politecnica Nacional','561523 bytes','WinRAR ZIP','2018-01-02 00:00:00','zip/DisenioDeComponentes.zip',2,2,1),(5,'Refactorizar','Mario Giler','Concepto de refactorizar','2018-07-11','refactorizar','Escuela Politecnica Nacional','372035 bytes','WinRAR ZIP','2018-07-11 00:00:00','zip/Refactorizar.zip',2,2,1),(6,'DISEÑO A NIVEL DE COMPONENTES','Tamayo Edison','Son líneas de diseño bien definidas que adecuan la estructura de diseño, el interfaz y diseño.','2018-01-02','Diseño a nivel de Componentes','EPN','561523 bytes','WinRAR ZIP','2018-01-02 00:00:00','zip/DisenioDeComponentes.zip',4,41,1),(7,'Diseño arquitectónico del repositorio de Objetos de Aprendizaje','Luis Orquera','Es el diseño previo a la creación previa del  repositorio  el cual permitirá crear objetos de aprendizajes.','2018-02-01','Diseño Arquitectonico','EPN','425394 bytes','WinRAR ZIP','2018-02-01 00:00:00','zip/DisenioArquitectonicoDeOA.zip',5,29,1),(8,'Algebra Lineal','Luis Orquera','ejercicios','2018-07-13','Algebra','EPN','179039 bytes','WinRAR ZIP','2018-07-13 00:00:00','zip/SoftwareLibre.zip',5,30,2),(9,'Web','Charles','consultas Web','2018-07-11','WEB','EPN','1174849 bytes','WinRAR ZIP','2018-07-11 00:00:00','zip/WEB.zip',3,39,NULL),(10,'Scrum','Charles Giler','Metodologia de desarrollo de sotware','2018-07-11','Metodologias, Scrum','EPN','1195349 bytes','WinRAR ZIP','2018-07-11 00:00:00','zip/SCROM.zip',3,72,NULL);
/*!40000 ALTER TABLE `objetoaprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'1304189200','kely esperanza','salavarria bravo','kelysalavarria@gmail.com',8,NULL,NULL,NULL,NULL,1),(2,'1723128318','mario','giler','mariojavier0795@gmail.com',2,'mario','$2y$10$vtlblpP.BIKGMMRfxfEsI.eOuQUfAOeN34U2higqAHWlUKfYefyJa',NULL,NULL,1),(3,'1302207228','charles','giler','charlesgilermendoza@gmail.com',10,'charles','$2y$10$4NVFBAbbgH4iE1Yx0qZ4Ce2uAqDaYxoq0OAeSVqFTHZfljB0CBsDa',NULL,NULL,1),(4,'1722295134','fernando','carrasco','fernandocarrasco@gmail.com',17,'fernando','$2y$10$hxBTuJOq272qfJ4idc9HJu0dEI0mEsFLa/YrpeVHg4ABivgOq9emS',NULL,NULL,1),(5,'1000982882','luis','orquera','luis.orquera@gmail.com',12,'luis','$2y$10$KDQrY3DsMjSeVaSvwdZewu3MTCetFmp2VMdRbF0IHicyKYFpu5iG6',NULL,NULL,1),(6,'1000982882','luis','orquera','luis.orquera@epn.edu.ec',5,'luis','$2y$10$/KVutV27/bfQO3snUriJeuaYjFZ7/OSTDFw60kfI07N.1YcBfWGRq',NULL,NULL,1),(7,'0502873326','marco','santorum','mariojavier0795@gmail.com',11,'marco','$2y$10$ZYr/XNQqSMwpsBLuTtacOuqD6wgxCIsUAqWio8t2uuUj0gPDWFb6u',NULL,1,0),(8,'1000982882','luis','orquera','miguelo42@hotmail.com',1,'luis','$2y$10$yPIhhXcx2SmXjdkqVRMn0.74.9LzI1iDIm01Ke14azPW//gsMEeTS',NULL,1,0),(9,'1000982882','luis','orquera','miguelo42@hotmail.com',1,'luis','$2y$10$Zr6UJhVubwp6JV/0U7CPsOjrvyfudtfRB091Kwibx66RS8XB7cYBG',NULL,2,1),(10,'1000982882','luis','orquera','miguelo42@hotmail.com',1,'luis','$2y$10$Dsng5jzI0L4vkMjjsXaD7OHjUXYnRbQ5zjHsmgBHYvy3aK88EQzb.',NULL,NULL,1);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuacion`
--

LOCK TABLES `puntuacion` WRITE;
/*!40000 ALTER TABLE `puntuacion` DISABLE KEYS */;
INSERT INTO `puntuacion` VALUES (1,21,2),(2,2,1),(3,8,3),(4,9,6),(5,11,4);
/*!40000 ALTER TABLE `puntuacion` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `rutaoa`
--

LOCK TABLES `rutaoa` WRITE;
/*!40000 ALTER TABLE `rutaoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `rutaoa` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (1,'Objetos de Aprendizaje',1),(2,'Objetos de Aprendizaje',2),(3,'Exposiciones',3),(4,'Exposiciones',4);
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

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
	select o.nombre, p.calificacionObjeto from puntuacion p, objetoaprendizaje o where o.idOA=p.idObjetosAprendizaje;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
insert into estudiante(cedulaEst, nombresEst, apellidosEst, correoEst, idCarrera, usuarioEst, pwEst)
values(cedulaEst, nombresEst, apellidosEst, correoEst, idCarrera, usuarioEst, pwEst);
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
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
insert into profesor(cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento, usuarioProf, pwProf, idMateria)
values(cedulaProf, nombresProf, apellidosProf, correoProf, idDepartamento, usuarioProf, pwProf, idMat);
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

-- Dump completed on 2018-09-19  9:48:40
