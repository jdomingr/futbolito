-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: futbolito
-- ------------------------------------------------------
-- Server version 5.7.17-log

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
-- Table structure for table `cancha`
--

DROP TABLE IF EXISTS `cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancha` (
  `idCancha` int(11) NOT NULL AUTO_INCREMENT,
  `Numero` int(11) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `idRecinto` int(11) NOT NULL,
  PRIMARY KEY (`idCancha`) USING BTREE,
  KEY `fk_Cancha_Recinto1_idx` (`idRecinto`),
  CONSTRAINT `fk_Cancha_Recinto1` FOREIGN KEY (`idRecinto`) REFERENCES `recinto` (`idRecinto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancha`
--

LOCK TABLES `cancha` WRITE;
/*!40000 ALTER TABLE `cancha` DISABLE KEYS */;
INSERT INTO `cancha` (`idCancha`, `Numero`, `Estado`, `idRecinto`) VALUES
(1, 1, 'Reservada', 1),
(2, 2, 'Reservada', 1),
(3, 1, 'Reservada', 2),
(4, 2, 'Reservada', 2),
(5, 3, 'Reservada', 2),
(6, 4, 'Reservada', 2);
/*!40000 ALTER TABLE `cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competir`
--

DROP TABLE IF EXISTS `competir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competir` (
  `idTorneo` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  KEY `fk_Torneo_has_Equipo_Equipo1_idx` (`idEquipo`),
  KEY `fk_Torneo_has_Equipo_Torneo1_idx` (`idTorneo`),
  CONSTRAINT `fk_Torneo_has_Equipo_Equipo1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Torneo_has_Equipo_Torneo1` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competir`
--

LOCK TABLES `competir` WRITE;
/*!40000 ALTER TABLE `competir` DISABLE KEYS */;
/*!40000 ALTER TABLE `competir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `numeroPartidos` int(11) DEFAULT NULL,
  `numeroJugadores` varchar(45) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idEquipo`,`idUsuario`),
  KEY `fk_Equipo_Usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Equipo_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Liverpool FC',0,'0',9),(2,'Parral City',0,'2',7);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `idHorario` int(11) NOT NULL AUTO_INCREMENT,
  `Precio` int(11) DEFAULT NULL,
  `horaInicio` varchar(20) DEFAULT NULL,
  `horaFin` varchar(10) DEFAULT NULL,
  `idCancha` int(11) NOT NULL,
  PRIMARY KEY (`idHorario`,`idCancha`),
  KEY `fk_Horario_Cancha1_idx` (`idCancha`),
  CONSTRAINT `fk_Horario_Cancha1` FOREIGN KEY (`idCancha`) REFERENCES `cancha` (`idCancha`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (10,25000,'10:00-11:00','10',1),(11,25000,'11:00-12:00','10',1),(12,25000,'12:00-13:00','10',1),(13,25000,'13:00-14:00','10',1),(14,25000,'14:00-15:00','10',1),(15,25000,'15:00-16:00','10',1),(16,25000,'16:00-17:00','10',1),(17,25000,'17:00-18:00','10',1),(18,25000,'18:00-19:00','10',1),(19,30000,'19:00-20:00','10',1),(20,30000,'20:00-21:00','10',1),(21,30000,'21:00-22:00','10',1),(22,30000,'22:00-23:00','10',1),(23,25000,'10:00-11:00','10',2),(24,25000,'11:00-12:00','10',2),(25,25000,'12:00-13:00','10',2),(26,25000,'13:00-14:00','10',2);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `idJugador` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `idEquipo` int(11) NOT NULL,
  PRIMARY KEY (`idJugador`),
  KEY `fk_Jugador_Equipo1_idx` (`idEquipo`),
  CONSTRAINT `fk_Jugador_Equipo1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (3,'Juan','Dominguez',2),(5,'Remigio','Espinoza',2);
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `idPartido` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `golesEquipo1` int(11) DEFAULT NULL,
  `golesEquipo2` int(11) DEFAULT NULL,
  `idEquipo1` int(11) NOT NULL,
  `idEquipo2` int(11) NOT NULL,
  `idCancha` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  idTorneo int NOT NULL,
  foreign key (idTorneo) references Torneo (idTorneo),
  PRIMARY KEY (`idPartido`),
  KEY `fk_Partido_Equipo1_idx` (`idEquipo1`),
  KEY `fk_Partido_Equipo2_idx` (`idEquipo2`),
  KEY `fk_Partido_Cancha1_idx` (`idCancha`),
  KEY `fk_Partido_Usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Partido_Cancha1` FOREIGN KEY (`idCancha`) REFERENCES `cancha` (`idCancha`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Partido_Equipo1` FOREIGN KEY (`idEquipo1`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Partido_Equipo2` FOREIGN KEY (`idEquipo2`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Partido_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recinto`
--

DROP TABLE IF EXISTS `recinto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recinto` (
  `idRecinto` int(11) NOT NULL AUTO_INCREMENT,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) NOT NULL,
  `numeroCanchas` int(11) NOT NULL,
  PRIMARY KEY (`idRecinto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recinto`
--

LOCK TABLES `recinto` WRITE;
/*!40000 ALTER TABLE `recinto` DISABLE KEYS */;
INSERT INTO `recinto` VALUES (1,'Chillan 123','12345','La curva',2),(2,'Las rosas 142','12331231','Mas Futbol',4);
/*!40000 ALTER TABLE `recinto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Horario_idHorario` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) NOT NULL,
  PRIMARY KEY (`idReserva`),
  KEY `fk_Usuario_has_Horario_Horario1_idx` (`Horario_idHorario`),
  KEY `fk_Usuario_has_Horario_Usuario_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_Usuario_has_Cancha_Cancha1` FOREIGN KEY (`Horario_idHorario`) REFERENCES `horario` (`idHorario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Usuario_has_Cancha_Usuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (9,7,1,'2017-11-22','10:00-11:00'),(13,7,3,'2017-11-23','11:00-12:00');
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'admin'),(2,'normal');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `id_solicitud` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_equipo` varchar(30) NOT NULL,
  `accion` varchar(20) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_solicitud`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (1,'Barcelona','Eliminar',NULL,'pendiente',9),(3,'Liverpool ','Modificar','cambiar nombre a Liverpool FC                       \r\n                          ','pendiente',9),(4,'Juan FC','Crear','                     \r\n                      ','realizado',7),(5,'ublense','Crear','                      \r\n                      ','realizado',7);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torneo`
--

DROP TABLE IF EXISTS `torneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `numeroParticipantes` int(11) DEFAULT NULL,
  `idCampeon` int(11) DEFAULT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idTorneo`),
  KEY `fk_Torneo_Usuario1_idx` (`idUsuario`),
  CONSTRAINT `fk_Torneo_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torneo`
--

LOCK TABLES `torneo` WRITE;
/*!40000 ALTER TABLE `torneo` DISABLE KEYS */;
INSERT INTO `torneo` VALUES (1,'Champions League','2017-12-09',0,NULL,9),(2,'Premier League','2017-12-14',0,NULL,9),(3,'Torneo Parral','2017-12-27',0,NULL,6);
/*!40000 ALTER TABLE `torneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Contrasena` varchar(45) DEFAULT NULL,
  `idRol` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_Usuario_Rol1_idx` (`idRol`),
  CONSTRAINT `fk_Usuario_Rol1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,'Juan','Dominguez','Juan@hotmail.com','12345678','1234',1),(7,'Juan','D','j@gmail.com','123123','4321',2),(8,'Camilo','Inostroza','caminost@alumnos.ubiobio.cl','93912171','qwerty123',1),(9,'Roman','Reigns','roman@empire.cl','90612786','123456789',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 20:03:34
