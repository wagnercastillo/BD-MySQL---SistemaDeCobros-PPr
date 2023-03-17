-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: pasantias
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AuditoriaCliente`
--

DROP TABLE IF EXISTS `AuditoriaCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaCliente` (
  `id_AuditoriaCliente` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_cliente_copia` int DEFAULT NULL,
  `id_persona_copia` int DEFAULT NULL,
  `calificacion_copia` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaCliente`
--

LOCK TABLES `AuditoriaCliente` WRITE;
/*!40000 ALTER TABLE `AuditoriaCliente` DISABLE KEYS */;
INSERT INTO `AuditoriaCliente` VALUES (1,'root@localhost','INSERT','2022-09-11 23:30:25',' ',' - IdCliente: 1 - IdPersona: 2 - Calificación: ',1,2,''),(2,'root@localhost','INSERT','2022-09-11 23:31:27',' ',' - IdCliente: 2 - IdPersona: 3 - Calificación: ',2,3,''),(3,'root@localhost','INSERT','2022-09-11 23:32:13',' ',' - IdCliente: 3 - IdPersona: 4 - Calificación: ',3,4,''),(4,'root@localhost','INSERT','2022-09-11 23:32:46',' ',' - IdCliente: 4 - IdPersona: 5 - Calificación: ',4,5,''),(5,'root@localhost','INSERT','2022-09-11 23:35:17',' ',' - IdCliente: 5 - IdPersona: 6 - Calificación: ',5,6,''),(6,'root@localhost','INSERT','2022-09-11 23:41:24',' ',' - IdCliente: 6 - IdPersona: 7 - Calificación: ',6,7,'');
/*!40000 ALTER TABLE `AuditoriaCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaConvenio`
--

DROP TABLE IF EXISTS `AuditoriaConvenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaConvenio` (
  `id_AuditoriaConvenio` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_convenio_copia` int DEFAULT NULL,
  `nombre_convenio_copia` varchar(55) DEFAULT NULL,
  `inicio_convenio_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  `fin_convenio_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_AuditoriaConvenio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaConvenio`
--

LOCK TABLES `AuditoriaConvenio` WRITE;
/*!40000 ALTER TABLE `AuditoriaConvenio` DISABLE KEYS */;
INSERT INTO `AuditoriaConvenio` VALUES (1,'root@localhost','INSERT','2022-09-11 23:27:54',' ','IdConvenio: 1 - Nombre: convenio_prueba - InicioConvenio: 2022-09-11 23:27:54 - FinConvenio: 2028-05-31 00:00:00',1,'convenio_prueba','2022-09-11 23:27:54','2028-05-31 00:00:00');
/*!40000 ALTER TABLE `AuditoriaConvenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaCuota`
--

DROP TABLE IF EXISTS `AuditoriaCuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaCuota` (
  `id_AuditoriaCuota` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_cuota_copia` int DEFAULT NULL,
  `cantidad_total_copia` decimal(10,2) DEFAULT NULL,
  `valor_cuota_copia` decimal(10,2) DEFAULT NULL,
  `valor_restante_copia` decimal(10,2) DEFAULT NULL,
  `fecha_cuota_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_AuditoriaCuota`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaCuota`
--

LOCK TABLES `AuditoriaCuota` WRITE;
/*!40000 ALTER TABLE `AuditoriaCuota` DISABLE KEYS */;
INSERT INTO `AuditoriaCuota` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:20',' ','IdCuota: 1 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2022-10-19 23:28:20',1,3000.00,150.00,3000.00,'2022-10-19 23:28:20'),(2,'root@localhost','INSERT','2022-09-11 23:28:21',' ','IdCuota: 2 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2022-11-26 23:28:20',2,3000.00,150.00,3000.00,'2022-11-26 23:28:20'),(3,'root@localhost','INSERT','2022-09-11 23:28:21',' ','IdCuota: 3 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-01-03 23:28:20',3,3000.00,150.00,3000.00,'2023-01-03 23:28:20'),(4,'root@localhost','INSERT','2022-09-11 23:28:21',' ','IdCuota: 4 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-02-10 23:28:20',4,3000.00,150.00,3000.00,'2023-02-10 23:28:20'),(5,'root@localhost','INSERT','2022-09-11 23:28:22',' ','IdCuota: 5 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-03-20 23:28:20',5,3000.00,150.00,3000.00,'2023-03-20 23:28:20'),(6,'root@localhost','INSERT','2022-09-11 23:28:22',' ','IdCuota: 6 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-04-27 23:28:20',6,3000.00,150.00,3000.00,'2023-04-27 23:28:20'),(7,'root@localhost','INSERT','2022-09-11 23:28:22',' ','IdCuota: 7 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-06-04 23:28:20',7,3000.00,150.00,3000.00,'2023-06-04 23:28:20'),(8,'root@localhost','INSERT','2022-09-11 23:28:23',' ','IdCuota: 8 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-07-12 23:28:20',8,3000.00,150.00,3000.00,'2023-07-12 23:28:20'),(9,'root@localhost','INSERT','2022-09-11 23:28:23',' ','IdCuota: 9 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-08-19 23:28:20',9,3000.00,150.00,3000.00,'2023-08-19 23:28:20'),(10,'root@localhost','INSERT','2022-09-11 23:28:23',' ','IdCuota: 10 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-09-26 23:28:20',10,3000.00,150.00,3000.00,'2023-09-26 23:28:20'),(11,'root@localhost','INSERT','2022-09-11 23:28:24',' ','IdCuota: 11 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-11-03 23:28:20',11,3000.00,150.00,3000.00,'2023-11-03 23:28:20'),(12,'root@localhost','INSERT','2022-09-11 23:28:24',' ','IdCuota: 12 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-12-11 23:28:20',12,3000.00,150.00,3000.00,'2023-12-11 23:28:20'),(13,'root@localhost','INSERT','2022-09-11 23:28:24',' ','IdCuota: 13 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-01-18 23:28:20',13,3000.00,150.00,3000.00,'2024-01-18 23:28:20'),(14,'root@localhost','INSERT','2022-09-11 23:28:25',' ','IdCuota: 14 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-02-25 23:28:20',14,3000.00,150.00,3000.00,'2024-02-25 23:28:20'),(15,'root@localhost','INSERT','2022-09-11 23:28:25',' ','IdCuota: 15 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-04-03 23:28:20',15,3000.00,150.00,3000.00,'2024-04-03 23:28:20'),(16,'root@localhost','INSERT','2022-09-11 23:28:25',' ','IdCuota: 16 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-05-11 23:28:20',16,3000.00,150.00,3000.00,'2024-05-11 23:28:20'),(17,'root@localhost','INSERT','2022-09-11 23:28:26',' ','IdCuota: 17 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-06-18 23:28:20',17,3000.00,150.00,3000.00,'2024-06-18 23:28:20'),(18,'root@localhost','INSERT','2022-09-11 23:28:26',' ','IdCuota: 18 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-07-26 23:28:20',18,3000.00,150.00,3000.00,'2024-07-26 23:28:20'),(19,'root@localhost','INSERT','2022-09-11 23:28:26',' ','IdCuota: 19 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-09-02 23:28:20',19,3000.00,150.00,3000.00,'2024-09-02 23:28:20'),(20,'root@localhost','INSERT','2022-09-11 23:28:27',' ','IdCuota: 20 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2024-10-09 00:00:00',20,3000.00,150.00,3000.00,'2024-10-09 00:00:00'),(21,'root@localhost','UPDATE','2022-09-11 23:30:25','IdCuota: 1 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2022-10-19 23:28:20','IdCuota: 1 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 2850.00 - FechaCuota: 2022-10-19 23:28:20',1,3000.00,150.00,2850.00,'2022-10-19 23:28:20'),(22,'root@localhost','UPDATE','2022-09-11 23:31:27','IdCuota: 2 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2022-11-26 23:28:20','IdCuota: 2 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 2850.00 - FechaCuota: 2022-11-26 23:28:20',2,3000.00,150.00,2850.00,'2022-11-26 23:28:20'),(23,'root@localhost','INSERT','2022-09-11 23:31:53',' ','IdCuota: 21 - CantidadTotal: 3000.00 - ValorCuota: 1500.00 - ValorRestante: 3000.00 - FechaCuota: 2023-09-25 23:31:53',21,3000.00,1500.00,3000.00,'2023-09-25 23:31:53'),(24,'root@localhost','INSERT','2022-09-11 23:31:54',' ','IdCuota: 22 - CantidadTotal: 3000.00 - ValorCuota: 1500.00 - ValorRestante: 3000.00 - FechaCuota: 2024-10-09 00:00:00',22,3000.00,1500.00,3000.00,'2024-10-09 00:00:00'),(25,'root@localhost','UPDATE','2022-09-11 23:32:13','IdCuota: 21 - CantidadTotal: 3000.00 - ValorCuota: 1500.00 - ValorRestante: 3000.00 - FechaCuota: 2023-09-25 23:31:53','IdCuota: 21 - CantidadTotal: 3000.00 - ValorCuota: 1500.00 - ValorRestante: 1500.00 - FechaCuota: 2023-09-25 23:31:53',21,3000.00,1500.00,1500.00,'2023-09-25 23:31:53'),(26,'root@localhost','UPDATE','2022-09-11 23:32:46','IdCuota: 22 - CantidadTotal: 3000.00 - ValorCuota: 1500.00 - ValorRestante: 3000.00 - FechaCuota: 2024-10-09 00:00:00','IdCuota: 22 - CantidadTotal: 3000.00 - ValorCuota: 1500.00 - ValorRestante: 1500.00 - FechaCuota: 2024-10-09 00:00:00',22,3000.00,1500.00,1500.00,'2024-10-09 00:00:00'),(27,'root@localhost','UPDATE','2022-09-11 23:35:16','IdCuota: 3 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-01-03 23:28:20','IdCuota: 3 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 2850.00 - FechaCuota: 2023-01-03 23:28:20',3,3000.00,150.00,2850.00,'2023-01-03 23:28:20'),(28,'root@localhost','UPDATE','2022-09-11 23:41:23','IdCuota: 4 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 3000.00 - FechaCuota: 2023-02-10 23:28:20','IdCuota: 4 - CantidadTotal: 3000.00 - ValorCuota: 150.00 - ValorRestante: 2850.00 - FechaCuota: 2023-02-10 23:28:20',4,3000.00,150.00,2850.00,'2023-02-10 23:28:20');
/*!40000 ALTER TABLE `AuditoriaCuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaEmpleado`
--

DROP TABLE IF EXISTS `AuditoriaEmpleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaEmpleado` (
  `id_AuditoriaEmpleado` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text NOT NULL,
  `id_persona_copia` int DEFAULT NULL,
  `periodo_contrato_inicio_copia` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `periodo_contrato_fin_copia` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cargo_copia` varchar(55) DEFAULT NULL,
  `sueldo_copia` int DEFAULT '0',
  `experiencia_copia` varchar(55) DEFAULT NULL,
  `observaciones_copia` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaEmpleado`
--

LOCK TABLES `AuditoriaEmpleado` WRITE;
/*!40000 ALTER TABLE `AuditoriaEmpleado` DISABLE KEYS */;
INSERT INTO `AuditoriaEmpleado` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:02',' ','Id_Persona: 1 - PeriodoContratoInicio: 2022-09-11 23:28:02 - PeriodoContratoFin: 2022-09-11 23:28:02 - Cargo: Vendedor - Sueldo: 300 - Experiencia: 3 - Observaciones:  Buen trabajador',1,'2022-09-12 04:28:02','2022-09-12 04:28:02','Vendedor',300,'3','Buen trabajador');
/*!40000 ALTER TABLE `AuditoriaEmpleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaGestionRecargo`
--

DROP TABLE IF EXISTS `AuditoriaGestionRecargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaGestionRecargo` (
  `id_GestionRecargo` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_recargo_copia` int DEFAULT NULL,
  `catidad_cobro_copia` decimal(10,2) DEFAULT NULL,
  `fecha_gestion_recargo_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_GestionRecargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaGestionRecargo`
--

LOCK TABLES `AuditoriaGestionRecargo` WRITE;
/*!40000 ALTER TABLE `AuditoriaGestionRecargo` DISABLE KEYS */;
INSERT INTO `AuditoriaGestionRecargo` VALUES (1,'root@localhost','INSERT','2022-09-11 23:32:12',' ','IdRecargo: 1 - CantidadCobro: 1515.00 - FechaGestionRecargo: 2022-09-11 23:32:12',1,1515.00,'2022-09-11 23:32:12');
/*!40000 ALTER TABLE `AuditoriaGestionRecargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaInstitucion`
--

DROP TABLE IF EXISTS `AuditoriaInstitucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaInstitucion` (
  `id_AuditoriaInstitucion` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_institucion_copia` int DEFAULT NULL,
  `nombre_intitucion_copia` varchar(55) DEFAULT NULL,
  `ciudad_copia` varchar(55) DEFAULT NULL,
  `direccion_copia` varchar(55) DEFAULT NULL,
  `telefono_copia` varchar(55) DEFAULT NULL,
  `correo_copia` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaInstitucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaInstitucion`
--

LOCK TABLES `AuditoriaInstitucion` WRITE;
/*!40000 ALTER TABLE `AuditoriaInstitucion` DISABLE KEYS */;
INSERT INTO `AuditoriaInstitucion` VALUES (1,'root@localhost','INSERT','2022-09-11 23:27:54',' ','IdInstitucion: 1 - NombreInstitucion: UNL - Ciudad: Loja - Direccion: Benjamin-carrion y Av Universitaria - Telefono: 00000000 - Correo: unl@gmail.com',1,'UNL','Loja','Benjamin-carrion y Av Universitaria','00000000','unl@gmail.com');
/*!40000 ALTER TABLE `AuditoriaInstitucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaMetodoPago`
--

DROP TABLE IF EXISTS `AuditoriaMetodoPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaMetodoPago` (
  `id_AuditoriaMetodoPago` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_metodo_pago_copia` int NOT NULL,
  `nombre_copia` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaMetodoPago`
--

LOCK TABLES `AuditoriaMetodoPago` WRITE;
/*!40000 ALTER TABLE `AuditoriaMetodoPago` DISABLE KEYS */;
INSERT INTO `AuditoriaMetodoPago` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:17',' ','IdMetodoPago: 1 - Nombre: efectivo',1,'efectivo');
/*!40000 ALTER TABLE `AuditoriaMetodoPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaPago`
--

DROP TABLE IF EXISTS `AuditoriaPago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaPago` (
  `id_AuditoriaMetodoPago` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_pago_copia` int DEFAULT NULL,
  `id_metodo_pago_copia` int DEFAULT NULL,
  `valor_pagado_copia` decimal(10,2) DEFAULT NULL,
  `fecha_pago_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_AuditoriaMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaPago`
--

LOCK TABLES `AuditoriaPago` WRITE;
/*!40000 ALTER TABLE `AuditoriaPago` DISABLE KEYS */;
INSERT INTO `AuditoriaPago` VALUES (1,'root@localhost','INSERT','2022-09-11 23:30:25',' ','IdPago: 1 - IdMetodoPago: 1 - ValorPagado: 150.00 - FechaPago: 2022-09-11 23:30:25',1,1,150.00,'2022-09-11 23:30:25'),(2,'root@localhost','INSERT','2022-09-11 23:31:27',' ','IdPago: 2 - IdMetodoPago: 1 - ValorPagado: 150.00 - FechaPago: 2022-09-11 23:31:27',2,1,150.00,'2022-09-11 23:31:27'),(3,'root@localhost','INSERT','2022-09-11 23:32:12',' ','IdPago: 3 - IdMetodoPago: 1 - ValorPagado: 1515.00 - FechaPago: 2022-09-11 23:32:12',3,1,1515.00,'2022-09-11 23:32:12'),(4,'root@localhost','INSERT','2022-09-11 23:32:45',' ','IdPago: 4 - IdMetodoPago: 1 - ValorPagado: 1500.00 - FechaPago: 2022-09-11 23:32:45',4,1,1500.00,'2022-09-11 23:32:45'),(5,'root@localhost','INSERT','2022-09-11 23:35:16',' ','IdPago: 5 - IdMetodoPago: 1 - ValorPagado: 150.00 - FechaPago: 2022-09-11 23:35:16',5,1,150.00,'2022-09-11 23:35:16'),(6,'root@localhost','INSERT','2022-09-11 23:41:23',' ','IdPago: 6 - IdMetodoPago: 1 - ValorPagado: 150.00 - FechaPago: 2022-09-11 23:41:23',6,1,150.00,'2022-09-11 23:41:23');
/*!40000 ALTER TABLE `AuditoriaPago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaPersona`
--

DROP TABLE IF EXISTS `AuditoriaPersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaPersona` (
  `id_AuditoriaPersona` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_persona_copia` int DEFAULT NULL,
  `cedula_copia` varchar(10) DEFAULT NULL,
  `nombre_copia` varchar(55) DEFAULT NULL,
  `apellidos_copia` varchar(55) DEFAULT NULL,
  `celular_copia` int DEFAULT NULL,
  `telefono_copia` int DEFAULT NULL,
  `provincia_copia` varchar(55) DEFAULT NULL,
  `direccion_copia` varchar(55) DEFAULT NULL,
  `correo_copia` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaPersona`
--

LOCK TABLES `AuditoriaPersona` WRITE;
/*!40000 ALTER TABLE `AuditoriaPersona` DISABLE KEYS */;
INSERT INTO `AuditoriaPersona` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:02',' ','Id_Persona  1 - Cedula: 1114414232 - Nombre: Javier - Apellidos:  Paz - Celular:  981816146 - Telefono: 0 - Provincia: LOja - Direccion: Acacana-Acana - Correo: lujapak@mgil.com',1,'1114414232','Javier','Paz',981816146,0,'LOja','Acacana-Acana','lujapak@mgil.com'),(2,'root@localhost','INSERT','2022-09-11 23:30:25',' ','Id_Persona  2 - Cedula: 1112 - Nombre: Pedro - Apellidos:  Paz - Celular:  969270416 - Telefono: 0 - Provincia: Loja - Direccion: Acacana - Correo: lujapak@gmail.com',2,'1112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(3,'root@localhost','INSERT','2022-09-11 23:31:27',' ','Id_Persona  3 - Cedula: 11112 - Nombre: Pedro - Apellidos:  Paz - Celular:  969270416 - Telefono: 0 - Provincia: Loja - Direccion: Acacana - Correo: lujapak@gmail.com',3,'11112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(4,'root@localhost','INSERT','2022-09-11 23:32:13',' ','Id_Persona  4 - Cedula: 9999999346 - Nombre: Pedro - Apellidos:  Paz - Celular:  969270416 - Telefono: 0 - Provincia: Loja - Direccion: Acacana - Correo: lujapak@gmail.com',4,'9999999346','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(5,'root@localhost','INSERT','2022-09-11 23:32:46',' ','Id_Persona  5 - Cedula: 9999992346 - Nombre: Pedro - Apellidos:  Paz - Celular:  969270416 - Telefono: 0 - Provincia: Loja - Direccion: Acacana - Correo: lujapak@gmail.com',5,'9999992346','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(6,'root@localhost','INSERT','2022-09-11 23:35:16',' ','Id_Persona  6 - Cedula: 13112 - Nombre: Pedro - Apellidos:  Paz - Celular:  969270416 - Telefono: 0 - Provincia: Loja - Direccion: Acacana - Correo: lujapak@gmail.com',6,'13112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(7,'root@localhost','INSERT','2022-09-11 23:41:23',' ','Id_Persona  7 - Cedula: 43112 - Nombre: Pedro - Apellidos:  Paz - Celular:  969270416 - Telefono: 0 - Provincia: Loja - Direccion: Acacana - Correo: lujapak@gmail.com',7,'43112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com');
/*!40000 ALTER TABLE `AuditoriaPersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaRecaudacion`
--

DROP TABLE IF EXISTS `AuditoriaRecaudacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaRecaudacion` (
  `id_AuditoriaRecaudacion` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_recaudacion_copia` int DEFAULT NULL,
  `id_servicio_copia` int DEFAULT NULL,
  `id_persona_copia` int DEFAULT NULL,
  `id_empleado_copia` int DEFAULT NULL,
  `fecha_limite_recaudacion_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_recargo_copia` int DEFAULT NULL,
  `descripcion_recaudacion_copia` varchar(255) DEFAULT NULL,
  `lugar_recaudacion_copia` varchar(55) DEFAULT NULL,
  `id_cuota_copia` int DEFAULT NULL,
  `id_pago_copia` int DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaRecaudacion`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaRecaudacion`
--

LOCK TABLES `AuditoriaRecaudacion` WRITE;
/*!40000 ALTER TABLE `AuditoriaRecaudacion` DISABLE KEYS */;
INSERT INTO `AuditoriaRecaudacion` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:21',' ',NULL,1,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,1,NULL),(2,'root@localhost','INSERT','2022-09-11 23:28:21',' ',NULL,2,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,2,NULL),(3,'root@localhost','INSERT','2022-09-11 23:28:21',' ',NULL,3,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,3,NULL),(4,'root@localhost','INSERT','2022-09-11 23:28:22',' ',NULL,4,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,4,NULL),(5,'root@localhost','INSERT','2022-09-11 23:28:22',' ',NULL,5,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,5,NULL),(6,'root@localhost','INSERT','2022-09-11 23:28:22',' ',NULL,6,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,6,NULL),(7,'root@localhost','INSERT','2022-09-11 23:28:23',' ',NULL,7,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,7,NULL),(8,'root@localhost','INSERT','2022-09-11 23:28:23',' ',NULL,8,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,8,NULL),(9,'root@localhost','INSERT','2022-09-11 23:28:23',' ',NULL,9,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,9,NULL),(10,'root@localhost','INSERT','2022-09-11 23:28:24',' ',NULL,10,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,10,NULL),(11,'root@localhost','INSERT','2022-09-11 23:28:24',' ',NULL,11,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,11,NULL),(12,'root@localhost','INSERT','2022-09-11 23:28:24',' ',NULL,12,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,12,NULL),(13,'root@localhost','INSERT','2022-09-11 23:28:25',' ',NULL,13,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,13,NULL),(14,'root@localhost','INSERT','2022-09-11 23:28:25',' ',NULL,14,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,14,NULL),(15,'root@localhost','INSERT','2022-09-11 23:28:25',' ',NULL,15,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,15,NULL),(16,'root@localhost','INSERT','2022-09-11 23:28:25',' ',NULL,16,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,16,NULL),(17,'root@localhost','INSERT','2022-09-11 23:28:26',' ',NULL,17,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,17,NULL),(18,'root@localhost','INSERT','2022-09-11 23:28:26',' ',NULL,18,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,18,NULL),(19,'root@localhost','INSERT','2022-09-11 23:28:27',' ',NULL,19,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,19,NULL),(20,'root@localhost','INSERT','2022-09-11 23:28:27',' ',NULL,20,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,20,NULL),(21,'root@localhost','UPDATE','2022-09-11 23:30:25',NULL,NULL,1,1,2,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',1,1),(22,'root@localhost','UPDATE','2022-09-11 23:31:27',NULL,NULL,2,1,3,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',2,2),(23,'root@localhost','INSERT','2022-09-11 23:31:54',' ',NULL,21,2,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,21,NULL),(24,'root@localhost','INSERT','2022-09-11 23:31:54',' ',NULL,22,2,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,22,NULL),(25,'root@localhost','UPDATE','2022-09-11 23:32:13',NULL,NULL,21,2,4,NULL,'2024-10-09 00:00:00',1,'pagada','Loja',21,3),(26,'root@localhost','UPDATE','2022-09-11 23:32:46',NULL,NULL,22,2,5,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',22,4),(27,'root@localhost','UPDATE','2022-09-11 23:35:17',NULL,NULL,3,1,6,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',3,5),(28,'root@localhost','UPDATE','2022-09-11 23:41:24',NULL,NULL,4,1,7,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',4,6);
/*!40000 ALTER TABLE `AuditoriaRecaudacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaRegistroDeAcceso`
--

DROP TABLE IF EXISTS `AuditoriaRegistroDeAcceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaRegistroDeAcceso` (
  `id_AuditoriaRegistroDeAcceso` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `fechaHoraAcceso` datetime DEFAULT NULL,
  `id_cuentaCu` int DEFAULT NULL,
  `id_personaCu` int DEFAULT NULL,
  `usuarioCu` varchar(55) DEFAULT NULL,
  `claveCu` varchar(55) DEFAULT NULL,
  `fechaAccesoCu` datetime DEFAULT NULL,
  PRIMARY KEY (`id_AuditoriaRegistroDeAcceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaRegistroDeAcceso`
--

LOCK TABLES `AuditoriaRegistroDeAcceso` WRITE;
/*!40000 ALTER TABLE `AuditoriaRegistroDeAcceso` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuditoriaRegistroDeAcceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaReporte`
--

DROP TABLE IF EXISTS `AuditoriaReporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaReporte` (
  `id_AuditoriaReporte` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_reporte_copia` int DEFAULT NULL,
  `id_institucion_copia` int DEFAULT NULL,
  `periodo_inicio_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  `periodo_fin_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  `catidad_recaudada_copia` decimal(10,2) DEFAULT NULL,
  `fecha_reporte_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_AuditoriaReporte`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaReporte`
--

LOCK TABLES `AuditoriaReporte` WRITE;
/*!40000 ALTER TABLE `AuditoriaReporte` DISABLE KEYS */;
INSERT INTO `AuditoriaReporte` VALUES (1,'root@localhost','INSERT','2022-09-11 23:32:46',' ','IdReporte: 1 - IdInstitucion: 1 - PeriodoInicio: 2022-09-11 23:31:53 - PeriodoFin: 2024-10-09 00:00:00 - CantidadRecaudad: 3015.00 - FechaReporte: 2022-09-11 23:32:46',1,1,'2022-09-11 23:31:53','2024-10-09 00:00:00',3015.00,'2022-09-11 23:32:46');
/*!40000 ALTER TABLE `AuditoriaReporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaServicio`
--

DROP TABLE IF EXISTS `AuditoriaServicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaServicio` (
  `id_AuditoriaServicio` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_servicio_copia` int DEFAULT NULL,
  `id_institucion_copia` int DEFAULT NULL,
  `id_tipo_servicio_copia` int DEFAULT NULL,
  `periodo_servicio_copia` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_AuditoriaServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaServicio`
--

LOCK TABLES `AuditoriaServicio` WRITE;
/*!40000 ALTER TABLE `AuditoriaServicio` DISABLE KEYS */;
INSERT INTO `AuditoriaServicio` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:20',' ','IdServicio: 1 - IdInstitucion: 1 - IdTipoServicio: 1 - PeriodoSevicio: 2022-09-11 23:28:20',1,1,1,'2022-09-11 23:28:20'),(2,'root@localhost','INSERT','2022-09-11 23:31:53',' ','IdServicio: 2 - IdInstitucion: 1 - IdTipoServicio: 1 - PeriodoSevicio: 2022-09-11 23:31:53',2,1,1,'2022-09-11 23:31:53');
/*!40000 ALTER TABLE `AuditoriaServicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuditoriaTipoServicio`
--

DROP TABLE IF EXISTS `AuditoriaTipoServicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AuditoriaTipoServicio` (
  `id_TipoServicio` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(55) DEFAULT NULL,
  `accion` varchar(55) DEFAULT NULL,
  `fechaModificacion` datetime DEFAULT NULL,
  `valorAnterior` text,
  `ValorNuevo` text,
  `id_tipo_servicio_copia` int DEFAULT NULL,
  `nombre_copia` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_TipoServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuditoriaTipoServicio`
--

LOCK TABLES `AuditoriaTipoServicio` WRITE;
/*!40000 ALTER TABLE `AuditoriaTipoServicio` DISABLE KEYS */;
INSERT INTO `AuditoriaTipoServicio` VALUES (1,'root@localhost','INSERT','2022-09-11 23:28:12',' ',' IdTipoServicio: 1 - Nombre: Cobros de cuotas por préstamos',1,'Cobros de cuotas por préstamos');
/*!40000 ALTER TABLE `AuditoriaTipoServicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Cantidad_Recolecion_Servicio_Diario`
--

DROP TABLE IF EXISTS `Cantidad_Recolecion_Servicio_Diario`;
/*!50001 DROP VIEW IF EXISTS `Cantidad_Recolecion_Servicio_Diario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Cantidad_Recolecion_Servicio_Diario` AS SELECT 
 1 AS `id_servicio`,
 1 AS `cantidad`,
 1 AS `ValorRecaudado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `Cantidad_Recolecion_Servicio_Semanal`
--

DROP TABLE IF EXISTS `Cantidad_Recolecion_Servicio_Semanal`;
/*!50001 DROP VIEW IF EXISTS `Cantidad_Recolecion_Servicio_Semanal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Cantidad_Recolecion_Servicio_Semanal` AS SELECT 
 1 AS `id_servicio`,
 1 AS `cantidad`,
 1 AS `ValorRecaudado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ListaEmpleadosMayorRecuperacion`
--

DROP TABLE IF EXISTS `ListaEmpleadosMayorRecuperacion`;
/*!50001 DROP VIEW IF EXISTS `ListaEmpleadosMayorRecuperacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ListaEmpleadosMayorRecuperacion` AS SELECT 
 1 AS `id_empleado`,
 1 AS `cedula`,
 1 AS `nombre`,
 1 AS `correo`,
 1 AS `NumeroRecaudaciones`,
 1 AS `CantidadRecuperada`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `calificacion` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `persona_cliente_fk` (`id_persona`),
  CONSTRAINT `persona_cliente_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,2,''),(2,3,''),(3,4,''),(4,5,''),(5,6,''),(6,7,'');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenio` (
  `id_convenio` int NOT NULL AUTO_INCREMENT,
  `nombre_convenio` varchar(55) DEFAULT NULL,
  `inicio_convenio` datetime DEFAULT CURRENT_TIMESTAMP,
  `fin_convenio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_convenio`),
  CONSTRAINT `convenio_intitucion_fk` FOREIGN KEY (`id_convenio`) REFERENCES `institucion` (`id_institucion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (1,'convenio_prueba','2022-09-11 23:27:54','2028-05-31 00:00:00');
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `id_cuenta` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `usuario` varchar(55) DEFAULT NULL,
  `clave` varchar(55) DEFAULT NULL,
  `fechaAcceso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `id_persona_fk` (`id_persona`),
  CONSTRAINT `id_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuota`
--

DROP TABLE IF EXISTS `cuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuota` (
  `id_cuota` int NOT NULL AUTO_INCREMENT,
  `cantidad_total` decimal(10,2) DEFAULT NULL,
  `valor_cuota` decimal(10,2) DEFAULT NULL,
  `valor_restante` decimal(10,2) DEFAULT NULL,
  `fecha_cuota` datetime DEFAULT NULL,
  PRIMARY KEY (`id_cuota`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuota`
--

LOCK TABLES `cuota` WRITE;
/*!40000 ALTER TABLE `cuota` DISABLE KEYS */;
INSERT INTO `cuota` VALUES (1,3000.00,150.00,2850.00,'2022-10-19 23:28:20'),(2,3000.00,150.00,2850.00,'2022-11-26 23:28:20'),(3,3000.00,150.00,2850.00,'2023-01-03 23:28:20'),(4,3000.00,150.00,2850.00,'2023-02-10 23:28:20'),(5,3000.00,150.00,3000.00,'2023-03-20 23:28:20'),(6,3000.00,150.00,3000.00,'2023-04-27 23:28:20'),(7,3000.00,150.00,3000.00,'2023-06-04 23:28:20'),(8,3000.00,150.00,3000.00,'2023-07-12 23:28:20'),(9,3000.00,150.00,3000.00,'2023-08-19 23:28:20'),(10,3000.00,150.00,3000.00,'2023-09-26 23:28:20'),(11,3000.00,150.00,3000.00,'2023-11-03 23:28:20'),(12,3000.00,150.00,3000.00,'2023-12-11 23:28:20'),(13,3000.00,150.00,3000.00,'2024-01-18 23:28:20'),(14,3000.00,150.00,3000.00,'2024-02-25 23:28:20'),(15,3000.00,150.00,3000.00,'2024-04-03 23:28:20'),(16,3000.00,150.00,3000.00,'2024-05-11 23:28:20'),(17,3000.00,150.00,3000.00,'2024-06-18 23:28:20'),(18,3000.00,150.00,3000.00,'2024-07-26 23:28:20'),(19,3000.00,150.00,3000.00,'2024-09-02 23:28:20'),(20,3000.00,150.00,3000.00,'2024-10-09 00:00:00'),(21,3000.00,1500.00,1500.00,'2023-09-25 23:31:53'),(22,3000.00,1500.00,1500.00,'2024-10-09 00:00:00');
/*!40000 ALTER TABLE `cuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echo`
--

DROP TABLE IF EXISTS `echo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echo`
--

LOCK TABLES `echo` WRITE;
/*!40000 ALTER TABLE `echo` DISABLE KEYS */;
INSERT INTO `echo` VALUES (1,'Se ha pagado la cantidad de 150.00 por parte de Pedro'),(2,'Se ha pagado la cantidad de 150.00 por parte de Pedro');
/*!40000 ALTER TABLE `echo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `periodo_contrato_inicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `periodo_contrato_fin` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cargo` varchar(55) DEFAULT NULL,
  `sueldo` int DEFAULT '0',
  `experiencia` varchar(55) DEFAULT NULL,
  `observaciones` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `persona_empleado_fk` (`id_persona`),
  CONSTRAINT `persona_empleado_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,1,'2022-09-12 04:28:02','2022-09-12 04:28:02','Vendedor',300,'3','Buen trabajador');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_recargo`
--

DROP TABLE IF EXISTS `gestion_recargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_recargo` (
  `id_recargo` int NOT NULL AUTO_INCREMENT,
  `catidad_cobro` decimal(10,2) DEFAULT NULL,
  `fecha_gestion_recargo` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_recargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_recargo`
--

LOCK TABLES `gestion_recargo` WRITE;
/*!40000 ALTER TABLE `gestion_recargo` DISABLE KEYS */;
INSERT INTO `gestion_recargo` VALUES (1,1515.00,'2022-09-11 23:32:12');
/*!40000 ALTER TABLE `gestion_recargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institucion`
--

DROP TABLE IF EXISTS `institucion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institucion` (
  `id_institucion` int NOT NULL AUTO_INCREMENT,
  `nombre_intitucion` varchar(55) DEFAULT NULL,
  `ciudad` varchar(55) DEFAULT NULL,
  `direccion` varchar(55) DEFAULT NULL,
  `telefono` varchar(55) DEFAULT NULL,
  `correo` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_institucion`),
  UNIQUE KEY `nombre_intitucion` (`nombre_intitucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institucion`
--

LOCK TABLES `institucion` WRITE;
/*!40000 ALTER TABLE `institucion` DISABLE KEYS */;
INSERT INTO `institucion` VALUES (1,'UNL','Loja','Benjamin-carrion y Av Universitaria','00000000','unl@gmail.com');
/*!40000 ALTER TABLE `institucion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'efectivo');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_metodo_pago` int DEFAULT NULL,
  `valor_pagado` decimal(10,2) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pago`),
  KEY `id_metodo_pago_fk` (`id_metodo_pago`),
  CONSTRAINT `id_metodo_pago_fk` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,1,150.00,'2022-09-11 23:30:25'),(2,1,150.00,'2022-09-11 23:31:27'),(3,1,1515.00,'2022-09-11 23:32:12'),(4,1,1500.00,'2022-09-11 23:32:45'),(5,1,150.00,'2022-09-11 23:35:16'),(6,1,150.00,'2022-09-11 23:41:23');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(55) DEFAULT NULL,
  `apellidos` varchar(55) DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `provincia` varchar(55) DEFAULT NULL,
  `direccion` varchar(55) DEFAULT NULL,
  `correo` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'1114414232','Javier','Paz',981816146,0,'LOja','Acacana-Acana','lujapak@mgil.com'),(2,'1112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(3,'11112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(4,'9999999346','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(5,'9999992346','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(6,'13112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com'),(7,'43112','Pedro','Paz',969270416,0,'Loja','Acacana','lujapak@gmail.com');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recaudacion`
--

DROP TABLE IF EXISTS `recaudacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recaudacion` (
  `id_recaudacion` int NOT NULL AUTO_INCREMENT,
  `id_servicio` int DEFAULT NULL,
  `id_persona` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_limite_recaudacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_recargo` int DEFAULT NULL,
  `descripcion_recaudacion` varchar(255) DEFAULT NULL,
  `lugar_recaudacion` varchar(55) DEFAULT NULL,
  `id_cuota` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  PRIMARY KEY (`id_recaudacion`),
  KEY `recaudacion_persona_fk` (`id_persona`),
  KEY `recaudacion_cuota_fk` (`id_cuota`),
  KEY `recaudacion_recargo_fk` (`id_recargo`),
  KEY `recaudacion_servicio_fk` (`id_servicio`),
  CONSTRAINT `recaudacion_cuota_fk` FOREIGN KEY (`id_cuota`) REFERENCES `cuota` (`id_cuota`) ON UPDATE CASCADE,
  CONSTRAINT `recaudacion_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`) ON UPDATE CASCADE,
  CONSTRAINT `recaudacion_recargo_fk` FOREIGN KEY (`id_recargo`) REFERENCES `gestion_recargo` (`id_recargo`) ON UPDATE CASCADE,
  CONSTRAINT `recaudacion_servicio_fk` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recaudacion`
--

LOCK TABLES `recaudacion` WRITE;
/*!40000 ALTER TABLE `recaudacion` DISABLE KEYS */;
INSERT INTO `recaudacion` VALUES (1,1,2,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',1,1),(2,1,3,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',2,2),(3,1,6,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',3,5),(4,1,7,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',4,6),(5,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,5,NULL),(6,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,6,NULL),(7,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,7,NULL),(8,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,8,NULL),(9,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,9,NULL),(10,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,10,NULL),(11,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,11,NULL),(12,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,12,NULL),(13,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,13,NULL),(14,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,14,NULL),(15,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,15,NULL),(16,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,16,NULL),(17,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,17,NULL),(18,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,18,NULL),(19,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,19,NULL),(20,1,NULL,NULL,'2024-10-09 00:00:00',NULL,'no pagada',NULL,20,NULL),(21,2,4,NULL,'2024-10-09 00:00:00',1,'pagada','Loja',21,3),(22,2,5,1,'2024-10-09 00:00:00',NULL,'pagada','Loja',22,4);
/*!40000 ALTER TABLE `recaudacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reporte`
--

DROP TABLE IF EXISTS `reporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporte` (
  `id_reporte` int NOT NULL AUTO_INCREMENT,
  `id_institucion` int NOT NULL,
  `periodo_inicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `periodo_fin` datetime DEFAULT CURRENT_TIMESTAMP,
  `catidad_recaudada` decimal(10,2) DEFAULT NULL,
  `fecha_reporte` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reporte`),
  KEY `reporte_institucion_fk` (`id_institucion`),
  CONSTRAINT `reporte_institucion_fk` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reporte`
--

LOCK TABLES `reporte` WRITE;
/*!40000 ALTER TABLE `reporte` DISABLE KEYS */;
INSERT INTO `reporte` VALUES (1,1,'2022-09-11 23:31:53','2024-10-09 00:00:00',3015.00,'2022-09-11 23:32:46');
/*!40000 ALTER TABLE `reporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `id_institucion` int DEFAULT NULL,
  `id_tipo_servicio` int DEFAULT NULL,
  `periodo_servicio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_servicio`),
  KEY `servicio_tipo_servicio_fk` (`id_tipo_servicio`),
  KEY `servicio_institucion_fk` (`id_institucion`),
  CONSTRAINT `servicio_institucion_fk` FOREIGN KEY (`id_institucion`) REFERENCES `institucion` (`id_institucion`) ON UPDATE CASCADE,
  CONSTRAINT `servicio_tipo_servicio_fk` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,1,1,'2022-09-11 23:28:20'),(2,1,1,'2022-09-11 23:31:53');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `id_tipo_servicio` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(55) NOT NULL,
  PRIMARY KEY (`id_tipo_servicio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (1,'Cobros de cuotas por préstamos');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Cantidad_Recolecion_Servicio_Diario`
--

/*!50001 DROP VIEW IF EXISTS `Cantidad_Recolecion_Servicio_Diario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Cantidad_Recolecion_Servicio_Diario` AS select `recaudacion`.`id_servicio` AS `id_servicio`,count(`recaudacion`.`id_servicio`) AS `cantidad`,sum(`pago`.`valor_pagado`) AS `ValorRecaudado` from (`recaudacion` join `pago` on((`recaudacion`.`id_recaudacion` = `pago`.`id_pago`))) where (`pago`.`fecha_pago` between concat(curdate(),' 00:00:00') and concat(curdate(),' 23:59:59')) group by `recaudacion`.`id_servicio` having (`cantidad` >= 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Cantidad_Recolecion_Servicio_Semanal`
--

/*!50001 DROP VIEW IF EXISTS `Cantidad_Recolecion_Servicio_Semanal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Cantidad_Recolecion_Servicio_Semanal` AS select `recaudacion`.`id_servicio` AS `id_servicio`,count(`recaudacion`.`id_servicio`) AS `cantidad`,sum(`pago`.`valor_pagado`) AS `ValorRecaudado` from (`recaudacion` join `pago` on((`recaudacion`.`id_recaudacion` = `pago`.`id_pago`))) where (`pago`.`fecha_pago` between (concat(curdate(),' 00:00:00') - interval 1 week) and concat(curdate(),' 23:59:59')) group by `recaudacion`.`id_servicio` having (`cantidad` >= 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ListaEmpleadosMayorRecuperacion`
--

/*!50001 DROP VIEW IF EXISTS `ListaEmpleadosMayorRecuperacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ListaEmpleadosMayorRecuperacion` AS select `recaudacion`.`id_empleado` AS `id_empleado`,`persona`.`cedula` AS `cedula`,`persona`.`nombre` AS `nombre`,`persona`.`correo` AS `correo`,count(`recaudacion`.`id_empleado`) AS `NumeroRecaudaciones`,sum(`pago`.`valor_pagado`) AS `CantidadRecuperada` from ((`recaudacion` join `pago` on((`recaudacion`.`id_recaudacion` = `pago`.`id_pago`))) join `persona` on((`recaudacion`.`id_empleado` = `persona`.`id_persona`))) where (`pago`.`fecha_pago` between `GetFechaInicial`() and `GetFechaFin`()) group by `recaudacion`.`id_empleado` having (`NumeroRecaudaciones` >= 1) order by `CantidadRecuperada` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-12  1:45:29
