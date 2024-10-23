-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.25-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para directorio
CREATE DATABASE IF NOT EXISTS `directorio` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `directorio`;

-- Volcando estructura para tabla directorio.directorio_general
CREATE TABLE IF NOT EXISTS `directorio_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Presidencia','Retama') NOT NULL,
  `dependencia` varchar(100) NOT NULL,
  `rango` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `ext` int(11) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `numerotelef` varchar(50) DEFAULT NULL,
  `edificio` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla directorio.directorio_general: ~111 rows (aproximadamente)
INSERT INTO `directorio_general` (`id`, `tipo`, `dependencia`, `rango`, `nombre`, `ext`, `correo`, `numerotelef`, `edificio`) VALUES
	(1, 'Presidencia', 'Sindicos', 'Primer Sindico', 'BLANCA LETICIA GUZMAN HONIJOSA', 101, NULL, NULL, NULL),
	(2, 'Presidencia', 'Sindicos', 'Segundo Sindico', 'RICARDO VEGA BARRON', 102, NULL, NULL, NULL),
	(3, 'Presidencia', 'Regidores', 'Primer Regidor', 'DIANA ISABEL RANGEL RANGEL', 135, NULL, NULL, NULL),
	(4, 'Presidencia', 'Regidores', 'Segundo Regidor', 'BERNARDINO ALVAREZ CEDILLO', 136, NULL, NULL, NULL),
	(5, 'Presidencia', 'Regidores', 'Tercer Regidor', 'DAMARIS ORALIA GOMEZ CERVANTES', 137, NULL, NULL, NULL),
	(6, 'Presidencia', 'Regidores', 'Cuarto Regidor', 'EDGAR MAURICIO MEDINA MAGAÑA', 133, NULL, NULL, NULL),
	(7, 'Presidencia', 'Regidores', 'Quinto Regidor', 'NADIA FLOR TORRES MTZ', 142, NULL, NULL, NULL),
	(8, 'Presidencia', 'Regidores', 'Sexto Regidor', 'JUAN FRANCISCO GUEVARA BARRON', 143, NULL, NULL, NULL),
	(9, 'Presidencia', 'Regidores', 'Septimo Regidor', 'EPIFANIA MORAN VILLEDA', 151, NULL, NULL, NULL),
	(10, 'Presidencia', 'Regidores', 'Octavo Regidor', 'JOSE ISMAEL MEX SANTIAGO', 152, NULL, NULL, NULL),
	(11, 'Presidencia', 'Regidores', 'Noveno Regidor', 'MARTHA ELADIA GARCIA CARRIZALES', 153, NULL, NULL, NULL),
	(12, 'Presidencia', 'Regidores', 'Decimo Regidor', 'ABELARDO GARCES REYES', 154, NULL, NULL, NULL),
	(13, 'Presidencia', 'Regidores', 'Decimo Primer Regidor', 'ANA DELIA ZALETA AVALOS', 155, NULL, NULL, NULL),
	(14, 'Presidencia', 'Regidores', 'Decimo Segundo Regidor', 'LUIS GABRIEL MARQUEZ GONZALEZ', 153, NULL, NULL, NULL),
	(15, 'Presidencia', 'Regidores', 'Decimo Tercer Regidor', 'NAIVI ARACELY CASTILLO DIAZ', 157, NULL, NULL, NULL),
	(16, 'Presidencia', 'Regidores', 'Decimo Cuarto Regidor', 'AZUCENA LEDEZMA CAMACHO', 158, NULL, NULL, NULL),
	(17, 'Presidencia', 'Regidores', 'Decimo Quinto Regidor', 'NANCY RUIZ MARTINEZ', 159, NULL, NULL, NULL),
	(18, 'Presidencia', 'Regidores', 'Decimo Sexto Regidor', 'LETICIA BARRIOS CHAVERO', 160, NULL, NULL, NULL),
	(19, 'Presidencia', 'Regidores', 'Decimo Septimo Regidor', 'URIEL ULISES PONCE GARCIA', 161, NULL, NULL, NULL),
	(20, 'Presidencia', 'Regidores', 'Decimo Octavo Regidor', 'JULIO SALVADOR ALFARO FLORES', 162, NULL, NULL, NULL),
	(21, 'Presidencia', 'Regidores', 'Decimo Noveno Regidor', 'FELIX MIGUEL GUILLU MERAZ', 163, NULL, NULL, NULL),
	(22, 'Presidencia', 'Regidores', 'Vigesimo Regidor', 'FLOR DE NUBIA VAZQUEZ CHAVEZ', 164, NULL, NULL, NULL),
	(23, 'Presidencia', 'Regidores', 'Vigesimo Primer Regidor', 'OCTAVIO MOISES JIMENEZ MARQUEZ', 166, NULL, NULL, NULL),
	(24, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'JURIDICO', 126, NULL, NULL, NULL),
	(25, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'SUBSECRETARIA', 134, NULL, NULL, NULL),
	(26, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'ASISTENTE SECRETARIA PARTICULAR', 110, NULL, NULL, NULL),
	(27, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'SECRETARIA PARTICULAR', 108, NULL, NULL, NULL),
	(28, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'SUBSECRETARIA', 131, NULL, NULL, NULL),
	(29, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'SECRETARIA DEL AYUNTAMIENTO', 105, NULL, NULL, NULL),
	(30, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'SALA DE CABILDO', 109, NULL, NULL, NULL),
	(31, 'Presidencia', 'Secretaria Del Ayuntamiento', NULL, 'COORDINACION DE PRESIDENCIA', 103, NULL, NULL, NULL),
	(32, 'Presidencia', 'Externos', NULL, 'BOMBEROS EMERGENCIA', NULL, NULL, '8332644027', NULL),
	(33, 'Presidencia', 'Externos', NULL, 'TURISMO', NULL, NULL, '8331621652', NULL),
	(34, 'Presidencia', 'Externos', NULL, 'POSCO', 651, NULL, NULL, NULL),
	(35, 'Presidencia', 'Externos', NULL, 'POSCO', 652, NULL, NULL, NULL),
	(36, 'Presidencia', 'Externos', NULL, 'DELEGACION ZONA SUR', NULL, NULL, '8334546185', NULL),
	(37, 'Presidencia', 'Externos', NULL, 'DELEGACION Z.S ATENCION CIUDADANA', NULL, NULL, '8334546180', NULL),
	(38, 'Presidencia', 'Externos', NULL, 'DELEGACION ZONA NORTE', NULL, NULL, '8362760312', NULL),
	(39, 'Presidencia', 'Externos', NULL, 'INGRESOS ZONA NORTE', NULL, NULL, '8362760538', NULL),
	(40, 'Presidencia', 'Externos', NULL, 'REGISTRO CIVIL ZONA NORTE', NULL, NULL, '8362760362', NULL),
	(41, 'Presidencia', 'Externos', NULL, 'DIF RECEPCION', NULL, NULL, '8331621650', NULL),
	(42, 'Presidencia', 'Externos', NULL, 'PANTEON MUNICIPAL', 503, NULL, NULL, NULL),
	(43, 'Presidencia', 'Externos', NULL, 'PREPARATORIA MUNICIPAL', NULL, NULL, '8334090058 , 8334090059', NULL),
	(44, 'Presidencia', 'Externos', NULL, 'CULTURA', NULL, NULL, '8334580119', NULL),
	(45, 'Presidencia', 'Externos', NULL, 'TRANSITO', NULL, NULL, '8332248685', NULL),
	(46, 'Presidencia', 'Externos', NULL, 'PROTECCION CIVIL (EMERGENCIAS)', NULL, NULL, '8332646445', NULL),
	(47, 'Presidencia', 'Externos', NULL, 'PROTECCION CIVIL RECEPCION', NULL, NULL, '8334730017', NULL),
	(48, 'Presidencia', 'Externos', NULL, 'BOMBEROS', NULL, NULL, '8331620162', NULL),
	(49, 'Presidencia', 'Externos', NULL, 'OBRAS PUBLICAS', NULL, NULL, '8336888306', NULL),
	(50, 'Presidencia', 'Externos', NULL, 'SERVICIOS PUBLICOS', NULL, NULL, '8331622326', NULL),
	(51, 'Presidencia', 'Externos', NULL, 'BIENESTAR ANIMAL', NULL, NULL, '8331753551', NULL),
	(64, 'Retama', 'Ingresos', NULL, 'FACTURACION', 438, NULL, NULL, '1 Planta Baja'),
	(65, 'Retama', 'Ingresos', NULL, 'ASIST. DIRECTOR', 439, NULL, NULL, '1 Planta Baja'),
	(66, 'Retama', 'Ingresos', NULL, 'CATASTRO OFICIOS', 440, NULL, NULL, '1 Planta Baja'),
	(67, 'Retama', 'Ingresos', NULL, 'MERCADOS AUXILIAR', 488, NULL, NULL, '1 Planta Baja'),
	(68, 'Retama', 'Administracion', NULL, 'RECEPCION', 341, NULL, NULL, '1 Planta Baja'),
	(69, 'Retama', 'Tesoreria', NULL, 'RECEPCION', 215, NULL, NULL, '1 Planta Alta'),
	(70, 'Retama', 'Contraloria', NULL, 'ASISTENTE', 444, NULL, NULL, '1 Planta Alta'),
	(71, 'Retama', 'Contraloria', NULL, 'RECEPCION', 445, NULL, NULL, '1 Planta Alta'),
	(72, 'Retama', 'Contraloria', NULL, 'PROVEEDORES', 487, NULL, NULL, '1 Planta Alta'),
	(73, 'Retama', 'Contraloria', NULL, 'PARQUE VEHICULAR', 477, NULL, NULL, '1 Planta Alta'),
	(74, 'Retama', 'Contraloria', NULL, 'COORD. INVENTARIOS', 465, NULL, NULL, '1 Planta Alta'),
	(75, 'Retama', 'Desarrollo Economico', NULL, 'RECEPCION', 441, NULL, NULL, '2 Planta Baja'),
	(76, 'Retama', 'Desarrollo Economico', NULL, 'ASESORIA A MYPES', 227, NULL, NULL, '2 Planta Baja'),
	(77, 'Retama', 'Desarrollo Economico', NULL, 'COORD ADMINISTRATIVA', 204, NULL, NULL, '2 Planta Baja'),
	(78, 'Retama', 'Desarrollo Economico', NULL, 'COORD. DE PLANEACION', 205, NULL, NULL, '2 Planta Baja'),
	(79, 'Retama', 'Desarrollo Economico', NULL, 'JEFATURA JURIDICA', 203, NULL, NULL, '2 Planta Baja'),
	(80, 'Retama', 'Desarrollo Economico', NULL, 'ENLACE ADMINISTRATIVO', 202, NULL, NULL, '2 Planta Baja'),
	(81, 'Retama', 'Desarrollo Economico', NULL, 'COORD. DE GESTION', 226, NULL, NULL, '2 Planta Baja'),
	(82, 'Retama', 'Desarrollo Economico', NULL, 'COORD. DE SECTORES PRODUCTIVOS', 207, NULL, NULL, '2 Planta Baja'),
	(83, 'Retama', 'Desarrollo Economico', NULL, 'JEFATURA GESTION EMPRESARIAL', 208, NULL, NULL, '2 Planta Baja'),
	(84, 'Retama', 'Desarrollo Economico', NULL, 'JEFATURA DE PROYECTOS Y ENERGIA', 206, NULL, NULL, '2 Planta Baja'),
	(85, 'Retama', 'Atencion A La Mujer', NULL, 'INSTITUTO MUNICIPAL A LA MUJER', NULL, NULL, '8334039655', '2 Planta Baja'),
	(86, 'Retama', 'Programas Sociales', NULL, 'COORD. PROGRAMAS SOCIALES', 225, NULL, NULL, '2 Planta Baja'),
	(87, 'Retama', 'Programas Federales Y Estatales', NULL, 'INAPAM', 237, NULL, NULL, '2 Planta Baja'),
	(88, 'Retama', 'Programas Federales Y Estatales', NULL, 'TRABAJO SOCIAL', 213, NULL, NULL, '2 Planta Baja'),
	(89, 'Retama', 'Programas Federales Y Estatales', NULL, 'COORDINACION DE PROGRAMA SOCIALES', 225, NULL, NULL, '2 Planta Baja'),
	(90, 'Retama', 'Programas Federales Y Estatales', NULL, 'JEFATURA DE PROGRAMAS FEDERALES', 240, NULL, NULL, '2 Planta Baja'),
	(91, 'Retama', 'Programas Federales Y Estatales', NULL, 'ADMINISTRATIVO', 251, NULL, NULL, '2 Planta Baja'),
	(92, 'Retama', 'Educacion', NULL, 'RECEPCION', 231, NULL, NULL, '2 Planta Alta'),
	(93, 'Retama', 'Educacion', NULL, 'BECAS', 232, NULL, NULL, '2 Planta Alta'),
	(94, 'Retama', 'Educacion', NULL, 'ADMINISTRATIVO', 234, NULL, NULL, '2 Planta Alta'),
	(95, 'Retama', 'Educacion', NULL, 'ADMINISTRATIVO', 236, NULL, NULL, '2 Planta Alta'),
	(96, 'Retama', 'Atencion  A La Juventud', NULL, 'RECEPCION', 224, NULL, NULL, '2 Planta Alta'),
	(97, 'Retama', 'Atencion  A La Juventud', NULL, 'ATENCION CIUDADANA', 242, NULL, NULL, '2 Planta Alta'),
	(98, 'Retama', 'Coordinacion De Gestion Social', NULL, 'IZZA MARIA MORALES MARTINEZ', NULL, NULL, '8332639627', '2 Planta Alta'),
	(99, 'Retama', 'Bienestar Social', NULL, 'RECEPCION', 210, NULL, NULL, '2 Planta Alta'),
	(100, 'Retama', 'Bienestar Social', NULL, 'SALUD', 228, NULL, NULL, '2 Planta Alta'),
	(101, 'Retama', 'Bienestar Social', NULL, 'BIENESTAR SOCIAL', 217, NULL, NULL, '2 Planta Alta'),
	(102, 'Retama', 'Bienestar Social', NULL, 'JEFATURA DE PROGRAMAS MUNICIPALES', 243, NULL, NULL, '2 Planta Alta'),
	(103, 'Retama', 'Bienestar Social', NULL, 'ASISTENTE', 247, NULL, NULL, '2 Planta Alta'),
	(104, 'Retama', 'Bienestar Social', NULL, 'COORD. OPERATIVA', 241, NULL, NULL, '2 Planta Alta'),
	(105, 'Retama', 'Bienestar Social', NULL, 'COORD. EQUIDAD Y GENERO', 238, NULL, NULL, '2 Planta Alta'),
	(106, 'Retama', 'Recursos Humanos', NULL, 'RH. RECEPCION', 351, NULL, NULL, '3 Planta Baja'),
	(107, 'Retama', 'Recursos Humanos', NULL, 'RH. ADMINISTRATIVO', 349, NULL, NULL, '3 Planta Baja'),
	(108, 'Retama', 'Sistemas', NULL, 'RECEPCION', 360, NULL, NULL, '3 Planta Baja'),
	(109, 'Retama', 'Sistemas', NULL, 'SOPORTE', 363, NULL, NULL, '3 Planta Baja'),
	(110, 'Retama', 'Sistemas', NULL, 'GOBIERNO DIGITAL', 365, NULL, NULL, '3 Planta Baja'),
	(111, 'Retama', 'Sistemas', NULL, 'TELECOM', 361, NULL, NULL, '3 Planta Baja'),
	(112, 'Retama', 'Sistemas', NULL, 'SISTEMAS PRESIDENCIA', 121, NULL, NULL, '3 Planta Baja'),
	(113, 'Retama', 'Desarrollo Urbano', NULL, 'ASISTENTE', 344, NULL, NULL, '3 Planta Baja'),
	(114, 'Retama', 'Desarrollo Urbano', NULL, 'VENTANILLA', 340, NULL, NULL, '3 Planta Baja'),
	(115, 'Retama', 'Desarrollo Urbano', NULL, 'JURIDICO', 364, NULL, NULL, '3 Planta Baja'),
	(116, 'Retama', 'Desarrollo Urbano', NULL, 'AREA OPERATIVA', 366, NULL, NULL, '3 Planta Baja'),
	(117, 'Retama', 'Desarrollo Urbano', NULL, 'ARCHIVO', 343, NULL, NULL, '3 Planta Baja'),
	(118, 'Retama', 'Servicios Generales', NULL, 'SERVICIOS GENERALES COORD', 356, NULL, NULL, '3 Planta Alta'),
	(119, 'Retama', 'Ecologia Y Medio Ambiente', NULL, 'ECOLOGIA RECEPCION', 403, NULL, NULL, '3 Planta Alta'),
	(120, 'Retama', 'Direccion Tecnica', NULL, 'RECEPCION', 321, NULL, NULL, '3 Planta Alta'),
	(121, 'Retama', 'Direccion Tecnica', NULL, 'MANUAL OPERATIVO', 405, NULL, NULL, '3 Planta Alta'),
	(122, 'Retama', 'Direccion Tecnica', NULL, 'PROGRAMAS', 320, NULL, NULL, '3 Planta Alta'),
	(123, 'Retama', 'Comunicacion Social', NULL, 'RECEPCION', 330, NULL, NULL, '3 Planta Alta');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
