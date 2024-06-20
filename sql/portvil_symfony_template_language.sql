-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.4.0 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para portvil_symfony_template_language
CREATE DATABASE IF NOT EXISTS `portvil_symfony_template_language` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `portvil_symfony_template_language`;

-- Volcando estructura para tabla portvil_symfony_template_language.automatizacion
CREATE TABLE IF NOT EXISTS `automatizacion` (
  `id` int NOT NULL,
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `id_usuario` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accommodations_historico_data
CREATE TABLE IF NOT EXISTS `avantio_accommodations_historico_data` (
  `id` int NOT NULL COMMENT 'identificador',
  `date` date NOT NULL COMMENT 'start date',
  `avantio_accommodations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `avantio_accommodations_activados_desactivados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'descriptions',
  `pictures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'pictures',
  `locations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'locations',
  `occupation_rules` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'reglas de ocupación',
  `price` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'prices',
  `price_modify` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'price_modify',
  `services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'services',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accommodations_historico_data_reservations
CREATE TABLE IF NOT EXISTS `avantio_accommodations_historico_data_reservations` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `text_userid` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` double DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adults_number` tinyint(1) DEFAULT NULL,
  `child1_age` tinyint(1) DEFAULT NULL,
  `child2_age` tinyint(1) DEFAULT NULL,
  `child3_age` tinyint(1) DEFAULT NULL,
  `child4_age` tinyint(1) DEFAULT NULL,
  `child5_age` tinyint(1) DEFAULT NULL,
  `child6_age` tinyint(1) DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_booking_type` tinyint(1) DEFAULT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_agencia` tinyint(1) DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accommodations_historico_data_reservations_agencia
CREATE TABLE IF NOT EXISTS `avantio_accommodations_historico_data_reservations_agencia` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `text_userid` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` double DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adults_number` tinyint(1) DEFAULT NULL,
  `child1_age` tinyint(1) DEFAULT NULL,
  `child2_age` tinyint(1) DEFAULT NULL,
  `child3_age` tinyint(1) DEFAULT NULL,
  `child4_age` tinyint(1) DEFAULT NULL,
  `child5_age` tinyint(1) DEFAULT NULL,
  `child6_age` tinyint(1) DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_booking_type` tinyint(1) DEFAULT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_agencia` tinyint(1) DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accommodations_historico_data_reservations_counters
CREATE TABLE IF NOT EXISTS `avantio_accommodations_historico_data_reservations_counters` (
  `fecha` date NOT NULL,
  `year` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_bajo_peticion` smallint DEFAULT NULL,
  `counter_cancelation` smallint DEFAULT NULL,
  `counter_cancel_propietario` smallint DEFAULT NULL,
  `counter_confirmation` smallint DEFAULT NULL,
  `counter_facturada` smallint DEFAULT NULL,
  `counter_garantia` smallint DEFAULT NULL,
  `counter_paid` smallint DEFAULT NULL,
  `counter_peticion_disponibilidad` smallint DEFAULT NULL,
  `counter_peticion_informacion` smallint DEFAULT NULL,
  `counter_peticion_tpv` smallint DEFAULT NULL,
  `counter_de_propietario` smallint DEFAULT NULL,
  `counter_unavailable` smallint DEFAULT NULL,
  `counter_unpaid` smallint DEFAULT NULL,
  `counter_conflicted` smallint DEFAULT NULL,
  `counter_reservation` smallint DEFAULT NULL,
  PRIMARY KEY (`fecha`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accommodations_historico_data_reservations_propietario
CREATE TABLE IF NOT EXISTS `avantio_accommodations_historico_data_reservations_propietario` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `text_userid` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` double DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adults_number` tinyint(1) DEFAULT NULL,
  `child1_age` tinyint(1) DEFAULT NULL,
  `child2_age` tinyint(1) DEFAULT NULL,
  `child3_age` tinyint(1) DEFAULT NULL,
  `child4_age` tinyint(1) DEFAULT NULL,
  `child5_age` tinyint(1) DEFAULT NULL,
  `child6_age` tinyint(1) DEFAULT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_booking_type` tinyint(1) DEFAULT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_agencia` tinyint(1) DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations
CREATE TABLE IF NOT EXISTS `avantio_accomodations` (
  `id` int NOT NULL,
  `language` int NOT NULL COMMENT 'Identificador',
  `avantio_gallery` int DEFAULT NULL COMMENT 'Id',
  `dynamic_taxonomy` int DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `dynamic_georegion` int DEFAULT NULL,
  `dynamic_geocity` int DEFAULT NULL,
  `dynamic_geolocality` int DEFAULT NULL,
  `dynamic_geodistrict` int DEFAULT NULL,
  `avantio_occupation_rules` int DEFAULT NULL COMMENT 'regla ocupación',
  `avantio_pricemodifiers` int NOT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_referencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referéncia',
  `text_userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User id',
  `text_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User id',
  `number_companyid` int DEFAULT NULL COMMENT 'm² construidos',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'User id',
  `text_geo_cp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Geo CP',
  `text_geo_tipo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo Calle',
  PRIMARY KEY (`id`,`language`),
  KEY `IDX_6671DDA29A2FDF42` (`avantio_gallery`),
  KEY `IDX_6671DDA277A90D3F` (`dynamic_taxonomy`),
  KEY `IDX_6671DDA288ACB8A1` (`dynamic_geocountry`),
  KEY `IDX_6671DDA26BDAE05C` (`dynamic_georegion`),
  KEY `IDX_6671DDA24245E053` (`dynamic_geocity`),
  KEY `IDX_6671DDA2E40D3084` (`dynamic_geolocality`),
  KEY `IDX_6671DDA2341ADCE5` (`dynamic_geodistrict`),
  KEY `idx_language` (`language`),
  KEY `idx_avantio_pricemodifiers` (`avantio_pricemodifiers`),
  CONSTRAINT `FK_6671DDA2341ADCE5` FOREIGN KEY (`dynamic_geodistrict`) REFERENCES `dynamic_geodistrict` (`id`),
  CONSTRAINT `FK_6671DDA24245E053` FOREIGN KEY (`dynamic_geocity`) REFERENCES `dynamic_geocity` (`id`),
  CONSTRAINT `FK_6671DDA26BDAE05C` FOREIGN KEY (`dynamic_georegion`) REFERENCES `dynamic_georegion` (`id`),
  CONSTRAINT `FK_6671DDA277A90D3F` FOREIGN KEY (`dynamic_taxonomy`) REFERENCES `dynamic_taxonomy` (`id`),
  CONSTRAINT `FK_6671DDA288ACB8A1` FOREIGN KEY (`dynamic_geocountry`) REFERENCES `dynamic_geocountry` (`id`),
  CONSTRAINT `FK_6671DDA29A2FDF42` FOREIGN KEY (`avantio_gallery`) REFERENCES `avantio_accomodations_pictures` (`id`),
  CONSTRAINT `FK_6671DDA2D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`),
  CONSTRAINT `FK_6671DDA2E40D3084` FOREIGN KEY (`dynamic_geolocality`) REFERENCES `dynamic_geolocality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_descriptions
CREATE TABLE IF NOT EXISTS `avantio_accomodations_descriptions` (
  `language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `avantio_accomodations` int unsigned NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language`,`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_descriptions_tmp
CREATE TABLE IF NOT EXISTS `avantio_accomodations_descriptions_tmp` (
  `language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `avantio_accomodations` int unsigned NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language`,`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_extras
CREATE TABLE IF NOT EXISTS `avantio_accomodations_extras` (
  `avantio_accomodations` int unsigned NOT NULL COMMENT 'id acommodations',
  `dynamic_services` int unsigned NOT NULL COMMENT 'servicios',
  `checkbox_included` tinyint(1) NOT NULL COMMENT 'incluido',
  `price` int unsigned NOT NULL COMMENT 'precio',
  `price_unit` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'precio unitario',
  `price_children` int unsigned NOT NULL COMMENT 'precio niños',
  `price_children_unit` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'precio niños unitario',
  `checkbox_pago_en_reserva` tinyint(1) NOT NULL COMMENT 'pago en reserva',
  `checkbox_opcional` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'opcional',
  `text_type` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tipo',
  `text_parking_location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ubicación parking',
  `number_limit_weight` int unsigned NOT NULL COMMENT 'limite peso',
  PRIMARY KEY (`avantio_accomodations`,`dynamic_services`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_extras_tmp
CREATE TABLE IF NOT EXISTS `avantio_accomodations_extras_tmp` (
  `avantio_accomodations` int unsigned NOT NULL COMMENT 'id acommodations',
  `dynamic_services` int unsigned NOT NULL COMMENT 'servicios',
  `checkbox_included` tinyint(1) NOT NULL COMMENT 'incluido',
  `price` int unsigned NOT NULL COMMENT 'precio',
  `price_unit` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'precio unitario',
  `price_children` int unsigned NOT NULL COMMENT 'precio niños',
  `price_children_unit` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'precio niños unitario',
  `checkbox_pago_en_reserva` tinyint(1) NOT NULL COMMENT 'pago en reserva',
  `checkbox_opcional` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'opcional',
  `text_type` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tipo',
  `text_parking_location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ubicación parking',
  `number_limit_weight` int unsigned NOT NULL COMMENT 'limite peso',
  PRIMARY KEY (`avantio_accomodations`,`dynamic_services`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_fields
CREATE TABLE IF NOT EXISTS `avantio_accomodations_fields` (
  `avantio_accomodations` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador avantio',
  `textarea_notas_internas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'notas internas',
  `number_capacidad_real` int DEFAULT NULL COMMENT 'Capacidad real',
  `text_youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Link youtube',
  `text_cert_energetico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cert. energético',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_fields_bullets
CREATE TABLE IF NOT EXISTS `avantio_accomodations_fields_bullets` (
  `avantio_accomodations` int NOT NULL COMMENT 'Identificador avantio',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'lenguage',
  `textarea_bullet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bullet',
  `textarea_informacion_adicional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Información adicional',
  PRIMARY KEY (`avantio_accomodations`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_id_avantio_portvil
CREATE TABLE IF NOT EXISTS `avantio_accomodations_id_avantio_portvil` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `id_avantio` int DEFAULT NULL COMMENT 'id avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `id_portvil_todos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_id_avantio_portvil_final
CREATE TABLE IF NOT EXISTS `avantio_accomodations_id_avantio_portvil_final` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `id_avantio` int DEFAULT NULL COMMENT 'id avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `text_title_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'avantio',
  `text_title_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'portvil',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_locations
CREATE TABLE IF NOT EXISTS `avantio_accomodations_locations` (
  `avantio_accomodations` int unsigned NOT NULL AUTO_INCREMENT,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo',
  `text_loc_where` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'where',
  `text_loc_howto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'howto',
  `text_loc_desc1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 1',
  `text_loc_desc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 2',
  `text_beach_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Beach name',
  `number_beach_dist` int unsigned NOT NULL COMMENT 'Beach distance',
  `text_beach_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance beach unit',
  `text_golf_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Golf name',
  `number_golf_dist` int unsigned NOT NULL COMMENT 'Golf distance',
  `text_golf_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance golf unit',
  `text_city_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'City Name',
  `number_city_dist` int unsigned NOT NULL COMMENT 'City Distance',
  `text_city_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance city unit',
  `text_super_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Super name',
  `number_super_dist` int unsigned NOT NULL COMMENT 'Super Distance',
  `text_super_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance super unit',
  `text_airport_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Airport Name',
  `number_airport_dist` int unsigned NOT NULL COMMENT 'Airport Distance',
  `text_airport_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance airport unit',
  `text_train_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Train Name',
  `number_train_dist` int unsigned NOT NULL COMMENT 'Train Distance',
  `text_train_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance train unit',
  `text_bus_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bus name',
  `number_bus_dist` int unsigned NOT NULL COMMENT 'Bus Distance',
  `text_bus_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance bus unit',
  `checkbox_view_to_beach` tinyint(1) NOT NULL COMMENT 'View To Beach',
  `checkbox_view_to_swimming_pool` tinyint(1) NOT NULL COMMENT 'View to swimming pool',
  `checkbox_view_to_golf` tinyint(1) NOT NULL COMMENT 'View To golf',
  `checkbox_view_to_garden` tinyint(1) NOT NULL COMMENT 'View to garden',
  `checkbox_view_to_river` tinyint(1) NOT NULL COMMENT 'View to river',
  `checkbox_view_to_mountain` tinyint(1) NOT NULL COMMENT 'View to mountain',
  `checkbox_view_to_lake` tinyint(1) NOT NULL COMMENT 'View to lake',
  `checkbox_first_line_beach` tinyint(1) NOT NULL COMMENT 'First line beach',
  `checkbox_first_line_golf` tinyint(1) NOT NULL COMMENT 'First Line golf',
  `position` int DEFAULT NULL COMMENT 'position',
  `id_avantio` int DEFAULT NULL COMMENT 'avantio',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_locations_tmp
CREATE TABLE IF NOT EXISTS `avantio_accomodations_locations_tmp` (
  `avantio_accomodations` int unsigned NOT NULL AUTO_INCREMENT,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo',
  `text_loc_where` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'where',
  `text_loc_howto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'howto',
  `text_loc_desc1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 1',
  `text_loc_desc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 2',
  `text_beach_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Beach name',
  `number_beach_dist` int unsigned NOT NULL COMMENT 'Beach distance',
  `text_beach_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance beach unit',
  `text_golf_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Golf name',
  `number_golf_dist` int unsigned NOT NULL COMMENT 'Golf distance',
  `text_golf_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance golf unit',
  `text_city_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'City Name',
  `number_city_dist` int unsigned NOT NULL COMMENT 'City Distance',
  `text_city_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance city unit',
  `text_super_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Super name',
  `number_super_dist` int unsigned NOT NULL COMMENT 'Super Distance',
  `text_super_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance super unit',
  `text_airport_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Airport Name',
  `number_airport_dist` int unsigned NOT NULL COMMENT 'Airport Distance',
  `text_airport_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance airport unit',
  `text_train_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Train Name',
  `number_train_dist` int unsigned NOT NULL COMMENT 'Train Distance',
  `text_train_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance train unit',
  `text_bus_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bus name',
  `number_bus_dist` int unsigned NOT NULL COMMENT 'Bus Distance',
  `text_bus_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance bus unit',
  `checkbox_view_to_beach` tinyint(1) NOT NULL COMMENT 'View To Beach',
  `checkbox_view_to_swimming_pool` tinyint(1) NOT NULL COMMENT 'View to swimming pool',
  `checkbox_view_to_golf` tinyint(1) NOT NULL COMMENT 'View To golf',
  `checkbox_view_to_garden` tinyint(1) NOT NULL COMMENT 'View to garden',
  `checkbox_view_to_river` tinyint(1) NOT NULL COMMENT 'View to river',
  `checkbox_view_to_mountain` tinyint(1) NOT NULL COMMENT 'View to mountain',
  `checkbox_view_to_lake` tinyint(1) NOT NULL COMMENT 'View to lake',
  `checkbox_first_line_beach` tinyint(1) NOT NULL COMMENT 'First line beach',
  `checkbox_first_line_golf` tinyint(1) NOT NULL COMMENT 'First Line golf',
  `position` int DEFAULT NULL COMMENT 'position',
  `id_avantio` int DEFAULT NULL COMMENT 'avantio',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_nearest_places
CREATE TABLE IF NOT EXISTS `avantio_accomodations_nearest_places` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avantio_accomodations` int unsigned NOT NULL,
  `place_type` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` int unsigned NOT NULL COMMENT 'metros',
  `dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance unit',
  PRIMARY KEY (`id`),
  KEY `accomodation` (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_nearest_places_tmp
CREATE TABLE IF NOT EXISTS `avantio_accomodations_nearest_places_tmp` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avantio_accomodations` int unsigned NOT NULL,
  `place_type` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` int unsigned NOT NULL COMMENT 'metros',
  `dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance unit',
  PRIMARY KEY (`id`),
  KEY `accomodation` (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_pictures
CREATE TABLE IF NOT EXISTS `avantio_accomodations_pictures` (
  `id` int NOT NULL COMMENT 'Id',
  `uri_900x600` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_650x450` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_99x66` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'identificador avantio',
  `id_avantio_picture` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_pictures_tmp
CREATE TABLE IF NOT EXISTS `avantio_accomodations_pictures_tmp` (
  `id` int unsigned NOT NULL,
  `avantio_accomodations` int unsigned NOT NULL,
  `uri_900x600` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_650x450` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_99x66` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'identificador avantio',
  `id_avantio_picture` int DEFAULT NULL,
  PRIMARY KEY (`id`,`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_accomodations_tmp
CREATE TABLE IF NOT EXISTS `avantio_accomodations_tmp` (
  `id` int NOT NULL COMMENT 'Identificador inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'language',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `checkbox_garantia` tinyint(1) DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `dynamic_kind_of_way` int DEFAULT NULL,
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_camas_king` int unsigned DEFAULT NULL COMMENT 'Número de camas king',
  `number_camas_queen` int unsigned DEFAULT NULL COMMENT 'Número de camas queen',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `dynamic_KitchenClass` int DEFAULT NULL,
  `dynamic_KitchenType` int DEFAULT NULL,
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'Apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'id avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_desktop
CREATE TABLE IF NOT EXISTS `avantio_availabilities_desktop` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_avantio` int DEFAULT NULL,
  `id_portvil` int DEFAULT NULL,
  `id_portvil_todos` int DEFAULT NULL,
  `color` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_nights` tinyint(1) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_desktop_agencia
CREATE TABLE IF NOT EXISTS `avantio_availabilities_desktop_agencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_avantio` int DEFAULT NULL,
  `id_portvil` int DEFAULT NULL,
  `id_portvil_todos` int DEFAULT NULL,
  `color` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_nights` tinyint(1) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_desktop_propietario
CREATE TABLE IF NOT EXISTS `avantio_availabilities_desktop_propietario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_avantio` int DEFAULT NULL,
  `id_portvil` int DEFAULT NULL,
  `id_portvil_todos` int DEFAULT NULL,
  `color` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_nights` tinyint(1) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_garantia
CREATE TABLE IF NOT EXISTS `avantio_availabilities_garantia` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  `season` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_propietario
CREATE TABLE IF NOT EXISTS `avantio_availabilities_propietario` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_propietario_tmp
CREATE TABLE IF NOT EXISTS `avantio_availabilities_propietario_tmp` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilities_tmp
CREATE TABLE IF NOT EXISTS `avantio_availabilities_tmp` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_availabilties_naranja
CREATE TABLE IF NOT EXISTS `avantio_availabilties_naranja` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_board
CREATE TABLE IF NOT EXISTS `avantio_board` (
  `id_board` tinyint(1) NOT NULL COMMENT 'id baord',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type board',
  PRIMARY KEY (`id_board`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking
CREATE TABLE IF NOT EXISTS `avantio_booking` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int DEFAULT NULL COMMENT 'codigo reserva',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `check_in_schedule` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_out_schedule` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creation_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modify_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update_option` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ultima actualización',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'estado de la reserva',
  PRIMARY KEY (`booking_code`),
  KEY `avantio_booking_booking_date_index` (`booking_date`),
  KEY `avantio_booking_code_index` (`booking_code`),
  KEY `avantio_booking_end_date_index` (`end_date`),
  KEY `avantio_booking_start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_accommodation
CREATE TABLE IF NOT EXISTS `avantio_booking_accommodation` (
  `booking_code` int NOT NULL COMMENT 'id bookig',
  `avantio_accomodations` int NOT NULL COMMENT 'identificador',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `booking_code_reservation` int DEFAULT NULL COMMENT 'ccodigo reserva',
  `cs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'codigo reserva string',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`,`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_accommodation_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_accommodation_tmp` (
  `booking_code` int NOT NULL COMMENT 'id bookig',
  `avantio_accomodations` int NOT NULL COMMENT 'identificador',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `booking_code_reservation` int DEFAULT NULL COMMENT 'ccodigo reserva',
  `cs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'codigo reserva string',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`,`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_agencia
CREATE TABLE IF NOT EXISTS `avantio_booking_agencia` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `id_agencia` int NOT NULL COMMENT 'id agencia',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  PRIMARY KEY (`booking_code`,`id_agencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_amount
CREATE TABLE IF NOT EXISTS `avantio_booking_amount` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `total_price` double NOT NULL COMMENT 'precio',
  `rental_price` double NOT NULL COMMENT 'precio restante',
  `currency` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'moneda',
  `comission` double NOT NULL COMMENT 'precio restante',
  `applied_owner_comission` double NOT NULL COMMENT 'precio restante',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_amount_services
CREATE TABLE IF NOT EXISTS `avantio_booking_amount_services` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `code` int NOT NULL COMMENT 'service code',
  `amount` int NOT NULL COMMENT 'service amount',
  `price` double NOT NULL COMMENT 'precio',
  `applied_tax_percentage` int NOT NULL COMMENT 'service tax percentage',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'categoria',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`,`code`,`amount`,`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_amount_services_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_amount_services_tmp` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `code` int NOT NULL COMMENT 'service code',
  `amount` int NOT NULL COMMENT 'service amount',
  `price` double NOT NULL COMMENT 'precio',
  `applied_tax_percentage` int NOT NULL COMMENT 'service tax percentage',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'categoria',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`,`code`,`amount`,`price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_amount_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_amount_tmp` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `total_price` double NOT NULL COMMENT 'precio',
  `rental_price` double NOT NULL COMMENT 'precio restante',
  `currency` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'moneda',
  `comission` double NOT NULL COMMENT 'precio restante',
  `applied_owner_comission` double NOT NULL COMMENT 'precio restante',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_data
CREATE TABLE IF NOT EXISTS `avantio_booking_data` (
  `id_booking_data` int NOT NULL AUTO_INCREMENT COMMENT 'identificador',
  `price` double NOT NULL COMMENT 'precio',
  `deposit` double NOT NULL COMMENT 'deposito',
  `currency` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'moneda',
  `board` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'board',
  `avantio_accomodations` int NOT NULL COMMENT 'identificador acommodation',
  `user_code` int NOT NULL COMMENT 'codigo usuario',
  `adults_number` int NOT NULL COMMENT 'numero adultos',
  `payment_method` int NOT NULL COMMENT 'metodo pago',
  `booking_type` int NOT NULL COMMENT 'booking type',
  PRIMARY KEY (`id_booking_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_desktop
CREATE TABLE IF NOT EXISTS `avantio_booking_desktop` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` tinyint(1) DEFAULT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opcion_avantio_portvil` int DEFAULT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_details
CREATE TABLE IF NOT EXISTS `avantio_booking_details` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `id_language` tinyint(1) NOT NULL COMMENT 'id language',
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'web',
  `id_booking_type` tinyint(1) NOT NULL COMMENT 'id booking type',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'log comentarios',
  `number_cama_supletoria` tinyint(1) DEFAULT NULL COMMENT 'cama supletoria',
  `number_cuna` tinyint(1) DEFAULT NULL COMMENT 'cuna',
  `number_sillita` tinyint(1) DEFAULT NULL COMMENT 'sillita',
  `number_limpieza` tinyint(1) DEFAULT NULL COMMENT 'limpieza',
  `number_hunter` tinyint(1) DEFAULT NULL COMMENT 'hunter',
  `booking_code_reservation` int DEFAULT NULL,
  `last_read_datetime` datetime DEFAULT NULL,
  `id_booking_type_booking` tinyint(1) DEFAULT NULL,
  `number_extra_cuna` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_details_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_details_tmp` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `id_language` tinyint(1) NOT NULL COMMENT 'id language',
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'web',
  `id_booking_type` tinyint(1) NOT NULL COMMENT 'id booking type',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'log comentarios',
  `number_cama_supletoria` tinyint(1) DEFAULT NULL COMMENT 'cama supletoria',
  `number_cuna` tinyint(1) DEFAULT NULL COMMENT 'cuna',
  `number_sillita` tinyint(1) DEFAULT NULL COMMENT 'sillita',
  `number_limpieza` tinyint(1) DEFAULT NULL COMMENT 'limpieza',
  `number_hunter` tinyint(1) DEFAULT NULL COMMENT 'hunter',
  `booking_code_reservation` int DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_estados
CREATE TABLE IF NOT EXISTS `avantio_booking_estados` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `id_booking_type` tinyint(1) NOT NULL COMMENT 'id booking type',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'log comentarios',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_gobernanta
CREATE TABLE IF NOT EXISTS `avantio_booking_gobernanta` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_gobernanta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_limpiadora
CREATE TABLE IF NOT EXISTS `avantio_booking_limpiadora` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_limpiadora` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_limpiadora_extra
CREATE TABLE IF NOT EXISTS `avantio_booking_limpiadora_extra` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_limpiadora` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `start_date_index` (`start_date`),
  KEY `start_date_limpiadora_extra_index` (`start_date`),
  KEY `booking_date_index` (`booking_date`),
  KEY `booking_date_limpiadora_extra_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `end_date_limpiadora_extra_index` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_limpiadora_order_accommodation
CREATE TABLE IF NOT EXISTS `avantio_booking_limpiadora_order_accommodation` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_rooms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `start_date_index` (`start_date`),
  KEY `start_date_order_accommodation` (`start_date`),
  KEY `booking_date_index` (`booking_date`),
  KEY `booking_date_order_accommodation` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `end_date_order_accommodation` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_localizer
CREATE TABLE IF NOT EXISTS `avantio_booking_localizer` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id bookig',
  `id_avantio_booking_localizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'id localizer',
  `agent_localizator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'agent localizer',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_localizer_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_localizer_tmp` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id bookig',
  `id_avantio_booking_localizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'id localizer',
  `agent_localizator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'agent localizer',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_naranja
CREATE TABLE IF NOT EXISTS `avantio_booking_naranja` (
  `id` int NOT NULL COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `avantio_accomodations` int NOT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`,`start_date`,`end_date`,`avantio_accomodations`),
  KEY `booking_code` (`id`,`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_observaciones
CREATE TABLE IF NOT EXISTS `avantio_booking_observaciones` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_observaciones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `start_date_index` (`start_date`),
  KEY `start_date_limpiadora_extra_index` (`start_date`),
  KEY `booking_date_index` (`booking_date`),
  KEY `booking_date_limpiadora_extra_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `end_date_limpiadora_extra_index` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_occupants
CREATE TABLE IF NOT EXISTS `avantio_booking_occupants` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int DEFAULT NULL COMMENT 'codigo reserva',
  `adults_number` int NOT NULL COMMENT 'number adults',
  `child1_age` int NOT NULL COMMENT 'age child 1',
  `child2_age` int NOT NULL COMMENT 'age child 2',
  `child3_age` int NOT NULL COMMENT 'age child 3',
  `child4_age` int NOT NULL COMMENT 'age child 4',
  `child5_age` int NOT NULL COMMENT 'age child 5',
  `child6_age` int NOT NULL COMMENT 'age child 6',
  `child_number` int DEFAULT NULL COMMENT 'Niños',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_occupants_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_occupants_tmp` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int DEFAULT NULL COMMENT 'codigo reserva',
  `adults_number` int NOT NULL COMMENT 'number adults',
  `child1_age` int NOT NULL COMMENT 'age child 1',
  `child2_age` int NOT NULL COMMENT 'age child 2',
  `child3_age` int NOT NULL COMMENT 'age child 3',
  `child4_age` int NOT NULL COMMENT 'age child 4',
  `child5_age` int NOT NULL COMMENT 'age child 5',
  `child6_age` int NOT NULL COMMENT 'age child 6',
  `child_number` int DEFAULT NULL COMMENT 'Niños',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_payment
CREATE TABLE IF NOT EXISTS `avantio_booking_payment` (
  `id` int NOT NULL COMMENT 'id payment',
  `payment_id` int NOT NULL COMMENT 'id payment',
  `booking_code` int NOT NULL COMMENT 'id booking',
  `payment_date` date NOT NULL COMMENT 'payment date',
  `amount` double NOT NULL COMMENT 'payment amount',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'metodo de pago',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'status de pago',
  `security_deposit` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'seguro deposito',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_payment_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_payment_tmp` (
  `id` int NOT NULL COMMENT 'id payment',
  `payment_id` int NOT NULL COMMENT 'id payment',
  `booking_code` int NOT NULL COMMENT 'id booking',
  `payment_date` date NOT NULL COMMENT 'payment date',
  `amount` int NOT NULL COMMENT 'payment amount',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'metodo de pago',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'status de pago',
  `security_deposit` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'seguro deposito',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_tarea
CREATE TABLE IF NOT EXISTS `avantio_booking_tarea` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_tarea` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_tmp
CREATE TABLE IF NOT EXISTS `avantio_booking_tmp` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int DEFAULT NULL COMMENT 'codigo reserva',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `check_in_schedule` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `check_out_schedule` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creation_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modify_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update_option` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'ultima actualización',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'estado de la reserva',
  PRIMARY KEY (`booking_code`),
  KEY `avantio_booking_booking_date_index` (`booking_date`),
  KEY `avantio_booking_code_index` (`booking_code`),
  KEY `avantio_booking_end_date_index` (`end_date`),
  KEY `avantio_booking_start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_type
CREATE TABLE IF NOT EXISTS `avantio_booking_type` (
  `id_booking_type` tinyint(1) NOT NULL COMMENT 'id booking type',
  `booking_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'type booking',
  PRIMARY KEY (`id_booking_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_booking_usuario
CREATE TABLE IF NOT EXISTS `avantio_booking_usuario` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `id_usuario` int NOT NULL COMMENT 'id agencia',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  PRIMARY KEY (`booking_code`,`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_calendario
CREATE TABLE IF NOT EXISTS `avantio_calendario` (
  `id` int NOT NULL COMMENT 'id',
  `id_avantio` int NOT NULL COMMENT 'id avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `id_portvil_todos` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `contador` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_avantio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_caracteristicas
CREATE TABLE IF NOT EXISTS `avantio_caracteristicas` (
  `id` int NOT NULL,
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguage',
  `text_checkbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'grupos',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Automátic slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'Status',
  `position` int DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_client
CREATE TABLE IF NOT EXISTS `avantio_client` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'client name',
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'surname name',
  `dni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dni',
  `id` int NOT NULL COMMENT 'id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dirección',
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'localidad',
  `postal_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'codigo postal',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ciudad',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pais',
  `iso_country_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'codigo pais',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'teléfono',
  `phone2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'teléfono 2',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Comentarios del cliente',
  `secondsurname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Segundo apellido',
  `birthday` date DEFAULT NULL COMMENT 'Fecha nacimiento',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Fecha nacimiento',
  `nacionality` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nacionalidad',
  `street` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `number_street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número Calle',
  `number_door` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número puerta Calle',
  `email_dos` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text email',
  `mobile` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mobile',
  `clase_client` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Clase cliente',
  `tipo_client` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo cliente',
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Cuenta bancaria',
  `codigo_fiscal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Codigo fiscal',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'no',
  `cuenta_bancaria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cuenta bancaria',
  `region` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Region',
  `fecha_alta` date DEFAULT NULL COMMENT 'Fecha alta',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`,`name`,`surname`,`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_client_tmp
CREATE TABLE IF NOT EXISTS `avantio_client_tmp` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'client name',
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'surname name',
  `dni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dni',
  `id` int NOT NULL COMMENT 'id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dirección',
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'localidad',
  `postal_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'codigo postal',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ciudad',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pais',
  `iso_country_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'codigo pais',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'teléfono',
  `phone2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'teléfono 2',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Comentarios del cliente',
  `secondsurname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Segundo apellido',
  `birthday` date DEFAULT NULL COMMENT 'Fecha nacimiento',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Fecha nacimiento',
  `nacionality` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nacionalidad',
  `street` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `number_street` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número Calle',
  `number_door` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número puerta Calle',
  `email_dos` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text email',
  `mobile` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mobile',
  `clase_client` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Clase cliente',
  `tipo_client` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo cliente',
  `bank_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Cuenta bancaria',
  `codigo_fiscal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Codigo fiscal',
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'no',
  `cuenta_bancaria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cuenta bancaria',
  `region` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Region',
  `fecha_alta` date DEFAULT NULL COMMENT 'Fecha alta',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`,`name`,`surname`,`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_ical
CREATE TABLE IF NOT EXISTS `avantio_ical` (
  `avantio_accomodations` int NOT NULL COMMENT 'identificador acommodation',
  `id_ical` int NOT NULL COMMENT 'identificador ical',
  `ical_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección ical',
  PRIMARY KEY (`avantio_accomodations`,`id_ical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_ical_address
CREATE TABLE IF NOT EXISTS `avantio_ical_address` (
  `id` int NOT NULL COMMENT 'id',
  `id_avantio` int NOT NULL COMMENT 'id avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `id_portvil_todos` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ical_address_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ical_address_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ical_address_avantio_custoomize` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ical_address_portvil_custoomize` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `update_avantio_ical_at` datetime DEFAULT NULL,
  `update_portvil_ical_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`id_avantio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_ical_events
CREATE TABLE IF NOT EXISTS `avantio_ical_events` (
  `id_event` int NOT NULL AUTO_INCREMENT COMMENT 'identificador evento',
  `id_ical` int NOT NULL COMMENT 'identificador ical',
  `date_start` date NOT NULL COMMENT 'start date',
  `date_end` date NOT NULL COMMENT 'end date',
  `summary` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'summary',
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_ical_events_tmp
CREATE TABLE IF NOT EXISTS `avantio_ical_events_tmp` (
  `id_event` int NOT NULL AUTO_INCREMENT COMMENT 'identificador evento',
  `id_ical` int NOT NULL COMMENT 'identificador ical',
  `date_start` date NOT NULL COMMENT 'start date',
  `date_end` date NOT NULL COMMENT 'end date',
  `summary` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'summary',
  PRIMARY KEY (`id_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_ical_tmp
CREATE TABLE IF NOT EXISTS `avantio_ical_tmp` (
  `avantio_accomodations` int NOT NULL COMMENT 'identificador acommodation',
  `id_ical` int NOT NULL COMMENT 'identificador ical',
  `ical_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección ical',
  PRIMARY KEY (`avantio_accomodations`,`id_ical`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_inmovilla
CREATE TABLE IF NOT EXISTS `avantio_inmovilla` (
  `id` int NOT NULL COMMENT 'Identificador inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'language',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `checkbox_garantia` tinyint(1) DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `dynamic_kind_of_way` int DEFAULT NULL,
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_camas_king` int unsigned DEFAULT NULL COMMENT 'Número de camas king',
  `number_camas_queen` int unsigned DEFAULT NULL COMMENT 'Número de camas queen',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `dynamic_KitchenClass` int DEFAULT NULL,
  `dynamic_KitchenType` int DEFAULT NULL,
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'Apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'id avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `season` tinyint(1) NOT NULL COMMENT 'temporadas',
  `min_nights` smallint unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(1) NOT NULL DEFAULT '1',
  `checkout` tinyint(1) NOT NULL DEFAULT '1',
  `opcion_dias_meses_todos_dias_checkin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'todosPermitidos',
  `opcion_dias_meses_todos_dias_checkout` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'todosPermitidos',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`fecha`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_checkin_days
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_checkin_days` (
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT '1',
  `tuesday` tinyint(1) NOT NULL DEFAULT '1',
  `wednesday` tinyint(1) NOT NULL DEFAULT '1',
  `thursday` tinyint(1) NOT NULL DEFAULT '1',
  `friday` tinyint(1) NOT NULL DEFAULT '1',
  `saturday` tinyint(1) NOT NULL DEFAULT '1',
  `sunday` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_checkin_days_tmp
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_checkin_days_tmp` (
  `id` int NOT NULL,
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `monday` tinyint(1) NOT NULL DEFAULT '1',
  `tuesday` tinyint(1) NOT NULL DEFAULT '1',
  `wednesday` tinyint(1) NOT NULL DEFAULT '1',
  `thursday` tinyint(1) NOT NULL DEFAULT '1',
  `friday` tinyint(1) NOT NULL DEFAULT '1',
  `saturday` tinyint(1) NOT NULL DEFAULT '1',
  `sunday` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`avantio_occupation_rules`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_checkin_month_days
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_checkin_month_days` (
  `avantio_occupation_rules` int NOT NULL DEFAULT '1',
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_dias` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_checkout_days
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_checkout_days` (
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT '1',
  `tuesday` tinyint(1) NOT NULL DEFAULT '1',
  `wednesday` tinyint(1) NOT NULL DEFAULT '1',
  `thursday` tinyint(1) NOT NULL DEFAULT '1',
  `friday` tinyint(1) NOT NULL DEFAULT '1',
  `saturday` tinyint(1) NOT NULL DEFAULT '1',
  `sunday` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_checkout_days_tmp
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_checkout_days_tmp` (
  `id` int NOT NULL,
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `monday` tinyint(1) NOT NULL DEFAULT '1',
  `tuesday` tinyint(1) NOT NULL DEFAULT '1',
  `wednesday` tinyint(1) NOT NULL DEFAULT '1',
  `thursday` tinyint(1) NOT NULL DEFAULT '1',
  `friday` tinyint(1) NOT NULL DEFAULT '1',
  `saturday` tinyint(1) NOT NULL DEFAULT '1',
  `sunday` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`avantio_occupation_rules`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_checkout_month_days
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_checkout_month_days` (
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_dias` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_names
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_occupation_rules_tmp
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules_tmp` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `season` tinyint(1) NOT NULL COMMENT 'temporadas',
  `min_nights` smallint unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(1) NOT NULL DEFAULT '1',
  `checkout` tinyint(1) NOT NULL DEFAULT '1',
  `opcion_dias_meses_todos_dias_checkin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'todosPermitidos',
  `opcion_dias_meses_todos_dias_checkout` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'todosPermitidos',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`fecha`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_portals
CREATE TABLE IF NOT EXISTS `avantio_portals` (
  `fecha_alta` date NOT NULL COMMENT 'Fecha alta portal',
  `nombre` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre',
  `comision` decimal(5,2) DEFAULT NULL COMMENT 'Comision',
  PRIMARY KEY (`fecha_alta`,`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_portvil
CREATE TABLE IF NOT EXISTS `avantio_portvil` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador tabla',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'título de la propiedad',
  `number_avantio` int DEFAULT NULL COMMENT 'id avantio',
  `number_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_pricemodifiers_tmp
CREATE TABLE IF NOT EXISTS `avantio_pricemodifiers_tmp` (
  `id` int unsigned NOT NULL,
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `min_nights` int unsigned NOT NULL,
  `max_nights` int unsigned NOT NULL,
  `id_incremental` int DEFAULT NULL,
  `season` tinyint(1) DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `acumulative` tinyint(1) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`,`name`,`fecha`,`min_nights`,`max_nights`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_pricemodifiers_tmp_vlad
CREATE TABLE IF NOT EXISTS `avantio_pricemodifiers_tmp_vlad` (
  `id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `min_nights` int unsigned NOT NULL,
  `max_nights` int unsigned NOT NULL,
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `acumulative` tinyint(1) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tpc',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`,`fecha`,`min_nights`,`max_nights`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates
CREATE TABLE IF NOT EXISTS `avantio_rates` (
  `accommodation_id` int unsigned NOT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates_acommodation
CREATE TABLE IF NOT EXISTS `avantio_rates_acommodation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_avantio_acommodation` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates_acommodation_tmp
CREATE TABLE IF NOT EXISTS `avantio_rates_acommodation_tmp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_avantio_acommodation` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates_garantia
CREATE TABLE IF NOT EXISTS `avantio_rates_garantia` (
  `accommodation_id` int unsigned NOT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates_names
CREATE TABLE IF NOT EXISTS `avantio_rates_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates_names_tmp
CREATE TABLE IF NOT EXISTS `avantio_rates_names_tmp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_rates_tmp
CREATE TABLE IF NOT EXISTS `avantio_rates_tmp` (
  `accommodation_id` int unsigned NOT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_report
CREATE TABLE IF NOT EXISTS `avantio_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parametro_report` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_report_historico
CREATE TABLE IF NOT EXISTS `avantio_report_historico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_avantio_report` int DEFAULT NULL,
  `fichero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'fichero',
  PRIMARY KEY (`id`),
  KEY `fk_avantio_report_historico_y_avantio_report_constraint` (`id_avantio_report`),
  CONSTRAINT `FK_1202FCC8F0927BED` FOREIGN KEY (`id_avantio_report`) REFERENCES `avantio_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.avantio_vista_previa
CREATE TABLE IF NOT EXISTS `avantio_vista_previa` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la vista previa',
  `text_street_view` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'nombre cliente' COMMENT 'Nombre del cliente',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL,
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int unsigned NOT NULL,
  `data` longblob NOT NULL,
  `session_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int unsigned NOT NULL,
  `user_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Información de contacto',
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Nombre' COMMENT 'Nombre',
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `phone` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telf',
  `subject` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `form_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mensaje',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_agencia_avantio
CREATE TABLE IF NOT EXISTS `desktop_booking_agencia_avantio` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_agencia_avantio_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_agencia_avantio_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_agencia_avantio_portvil_no_duplicadas
CREATE TABLE IF NOT EXISTS `desktop_booking_agencia_avantio_portvil_no_duplicadas` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_agencia_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_agencia_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_agencia_portvil_avantio_no_duplicadas
CREATE TABLE IF NOT EXISTS `desktop_booking_agencia_portvil_avantio_no_duplicadas` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_dgestor_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_dgestor_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_gestor_avantio
CREATE TABLE IF NOT EXISTS `desktop_booking_gestor_avantio` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `cantidad_payment` double DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_gestor_avantio_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_gestor_avantio_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `cantidad_payment` double DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_gestor_avantio_portvil_no_duplicadas
CREATE TABLE IF NOT EXISTS `desktop_booking_gestor_avantio_portvil_no_duplicadas` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `cantidad_payment` double DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_gestor_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_gestor_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `cantidad_payment` double DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_gestor_portvil_avantio_no_duplicadas
CREATE TABLE IF NOT EXISTS `desktop_booking_gestor_portvil_avantio_no_duplicadas` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `cantidad_payment` double DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_propietario_avantio
CREATE TABLE IF NOT EXISTS `desktop_booking_propietario_avantio` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_propietario_avantio_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_propietario_avantio_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_propietario_avantio_portvil_no_duplicadas
CREATE TABLE IF NOT EXISTS `desktop_booking_propietario_avantio_portvil_no_duplicadas` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_propietario_portvil
CREATE TABLE IF NOT EXISTS `desktop_booking_propietario_portvil` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.desktop_booking_propietario_portvil_avantio_no_duplicadas
CREATE TABLE IF NOT EXISTS `desktop_booking_propietario_portvil_avantio_no_duplicadas` (
  `booking_code` int NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `id_booking_type` date NOT NULL,
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_avantio` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `propiedad_portvil` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `cs` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opcion_avantio_portvil` int NOT NULL,
  `text_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_slug` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `number_comision` double DEFAULT NULL,
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.devices
CREATE TABLE IF NOT EXISTS `devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_accion
CREATE TABLE IF NOT EXISTS `dynamic_accion` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_title_plural` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'título plural',
  `text_title_url` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_body_title_no_res` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página cuando NO se encuentran resultados',
  `textarea_description_no_res` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página cuando NO se encuentran resultados',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_advantages
CREATE TABLE IF NOT EXISTS `dynamic_advantages` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_icon` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Icon: ‘wifi’, ‘reloj’, ‘teleoperadora’, ‘dinero’, ‘bienvenido’, ‘llave’',
  `checkbox_destacada_home` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la home (si/no)',
  `checkbox_destacada_alojamiento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la página de alojamiento',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_agencia
CREATE TABLE IF NOT EXISTS `dynamic_agencia` (
  `id` int NOT NULL,
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `user_users` int DEFAULT NULL COMMENT 'Identificador del usuario',
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_title_comercial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Codigo Agencia',
  `number_descuento` double DEFAULT NULL COMMENT 'Descuento',
  `text_tipo_descuento` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo descuento porcentual | numero',
  `dynamic_tarifas` int DEFAULT NULL,
  `text_ver_precio_neto_o_precio_bruto` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_tarifa_agencia` int DEFAULT NULL,
  `dynamic_comision_agencia` int DEFAULT NULL,
  `number_dias_opciones` int DEFAULT NULL,
  `checkbox_cancelaciones_automaticas` tinyint(1) DEFAULT NULL COMMENT 'cancelar automáticamente',
  `text_web_avantio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'canal avantio',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_contacto` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_licencia` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_gallery_agencia_principal` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `text_cif` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `text_codigo_postal` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `multiple_garantia_rooms` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_poblacion` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `dynamic_georegion` int DEFAULT NULL,
  `dynamic_geocity` int DEFAULT NULL,
  `dynamic_geolocality` int DEFAULT NULL,
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_correo_notificaciones` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkbox_reserva_y_anulacion_enviar_correo` tinyint(1) DEFAULT NULL,
  `checkbox_opcion_y_anulacion_enviar_correo` tinyint(1) DEFAULT NULL,
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3510C582D4DB71B5` (`language`),
  KEY `IDX_3510C582F6415EB1` (`user_users`),
  CONSTRAINT `FK_3510C582D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`),
  CONSTRAINT `FK_3510C582F6415EB1` FOREIGN KEY (`user_users`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_agencia_empleado
CREATE TABLE IF NOT EXISTS `dynamic_agencia_empleado` (
  `id` int NOT NULL COMMENT 'Identificador empleado',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `dynamic_agencia` int DEFAULT NULL COMMENT 'Identificador de agencia',
  `user_users` int DEFAULT NULL COMMENT 'agencia empleado',
  `dynamic_gallery_agencia_empleado` int DEFAULT NULL COMMENT 'Galeria Empleado',
  `text_email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `number_telf` int DEFAULT NULL COMMENT 'Telefono Agente inmobiliario',
  `number_mobile` int DEFAULT NULL COMMENT 'Telefono movil',
  `number_fax` int DEFAULT NULL COMMENT 'Fax',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_aplicacion
CREATE TABLE IF NOT EXISTS `dynamic_aplicacion` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'idioma',
  `text_aplicacion` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Identificador aplicación',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_aplicacion_roles
CREATE TABLE IF NOT EXISTS `dynamic_aplicacion_roles` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'idioma',
  `number_id_role` int DEFAULT NULL COMMENT 'rol usuario',
  `text_id_aplicacion` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Identificador aplicación',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_bar
CREATE TABLE IF NOT EXISTS `dynamic_bar` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_tipo_negocio` int DEFAULT NULL COMMENT 'tipo de negocio',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `checkbox_destacado` tinyint(1) DEFAULT NULL COMMENT 'Destacado Home',
  `dynamic_gallery_bar` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección del restaurante',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_blog
CREATE TABLE IF NOT EXISTS `dynamic_blog` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_aplicacion` int DEFAULT NULL COMMENT 'Aplicacion blog',
  `dynamic_blog_categoria` int DEFAULT NULL COMMENT 'Categoria  blog',
  `dynamic_tipo_blog` int DEFAULT NULL COMMENT 'tipo de negocio',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  `checkbox_destacado` tinyint(1) DEFAULT NULL COMMENT 'Destacado Home',
  `dynamic_gallery_blog` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `text_color` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Color cuadro, ciculo etc',
  `text_icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Icono',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_blog_categoria
CREATE TABLE IF NOT EXISTS `dynamic_blog_categoria` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_bloque_footer
CREATE TABLE IF NOT EXISTS `dynamic_bloque_footer` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `text_nombre_bloque` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Fichero',
  `multiple_pages` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paginas dinámicas',
  `checkbox_activado` tinyint(1) DEFAULT NULL COMMENT 'activar bloque',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_bloque_header
CREATE TABLE IF NOT EXISTS `dynamic_bloque_header` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_nombre_bloque` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_pages` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paginas dinámicas',
  `checkbox_activado` tinyint(1) DEFAULT NULL COMMENT 'activar bloque',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_colecciones_home
CREATE TABLE IF NOT EXISTS `dynamic_colecciones_home` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguaje',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Colección',
  `text_subtitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo Colección',
  `dynamic_gallery_coleccion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `dynamic_taxonomy_geographic_language_extra` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url',
  `checkbox_menu` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacado menu',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_contacto
CREATE TABLE IF NOT EXISTS `dynamic_contacto` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Idioma',
  `user_users` int NOT NULL COMMENT 'identificador usuario',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text title',
  `text_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre usuario',
  `text_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telefono usuario',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email usuario',
  `text_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url',
  `textarea_form_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Textarea dudas',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`,`user_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_contacto_app
CREATE TABLE IF NOT EXISTS `dynamic_contacto_app` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Idioma',
  `user_users` int NOT NULL COMMENT 'identificador usuario',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text title',
  `text_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre usuario',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email usuario',
  `textarea_form_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Textarea dudas',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`,`user_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_destinos
CREATE TABLE IF NOT EXISTS `dynamic_destinos` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguaje',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Destino',
  `text_subtitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo Destino',
  `dynamic_gallery_destinos` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `dynamic_taxonomy_geographic_language_fields_customitzation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url',
  `checkbox_menu` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacado menu',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_discoteca
CREATE TABLE IF NOT EXISTS `dynamic_discoteca` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_tipo_negocio` int DEFAULT NULL COMMENT 'tipo de negocio',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `checkbox_destacado` tinyint(1) DEFAULT NULL COMMENT 'Destacado Home',
  `dynamic_gallery_discoteca` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la discoteca',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_document
CREATE TABLE IF NOT EXISTS `dynamic_document` (
  `id` int NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `document_documento1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Documento 1',
  `text_titulo1` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 1',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `id_avantio` tinyint(1) DEFAULT '1' COMMENT 'avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_document_hshv
CREATE TABLE IF NOT EXISTS `dynamic_document_hshv` (
  `id` int NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `document_documento1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Documento 1',
  `text_titulo1` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 1',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_empresa
CREATE TABLE IF NOT EXISTS `dynamic_empresa` (
  `id` int NOT NULL COMMENT 'Identificador de la empresa',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo',
  `number_telf` int DEFAULT NULL COMMENT 'telf',
  `number_mobile` int DEFAULT NULL COMMENT 'mobile',
  `number_fax` int DEFAULT NULL COMMENT 'fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dirección',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'website',
  `dynamic_taxonomy_group` int unsigned NOT NULL COMMENT 'Grupo tipo de inmueble piso, casa',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Población',
  `dynamic_accion` int DEFAULT NULL COMMENT 'Comprar | Alquilar | Compartir',
  `dynamic_gallery_empresa` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Galería Fotos',
  `textarea_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `textarea_description_2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción secundaria',
  `textarea_interior` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción opcional (No visible)',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'latitud',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'longitud',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'text_body_title',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'text_google_plus',
  `google_place_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id google places',
  `google_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url google maps',
  `checkbox_destacado_provincia` tinyint(1) DEFAULT NULL COMMENT 'Destacado página población',
  `checkbox_destacado_listado_inmobiliarias` tinyint(1) DEFAULT NULL COMMENT 'Destacado página listado inmobiliarias',
  `checkbox_destacado_detalle_inmobiliaria` tinyint(1) DEFAULT NULL COMMENT 'Destacado página detalle inmobiliaria',
  `checkbox_destacado_detalle_propiedad` tinyint(1) DEFAULT NULL COMMENT 'Destacado página detalle propiedad',
  `checkbox_destacado_buscador` int DEFAULT NULL COMMENT 'checkbox destacado buscador',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_experiencia
CREATE TABLE IF NOT EXISTS `dynamic_experiencia` (
  `id` int NOT NULL,
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'título Cabecera',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo Cabecera',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_experiencias
CREATE TABLE IF NOT EXISTS `dynamic_experiencias` (
  `id` int NOT NULL,
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_title_image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo imagen 1',
  `text_alt_image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo imagen 1',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsagencias
CREATE TABLE IF NOT EXISTS `dynamic_faqsagencias` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `dynamic_faqsagencias_type` int DEFAULT NULL COMMENT 'faq agencias',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsagencias_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsagencias_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsagentes
CREATE TABLE IF NOT EXISTS `dynamic_faqsagentes` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsagentes_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsagentes_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsclientes
CREATE TABLE IF NOT EXISTS `dynamic_faqsclientes` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `dynamic_faqsclientes_type` int DEFAULT NULL COMMENT 'faq tipo clientes',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsclientes_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsclientes_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsinmobiliarias
CREATE TABLE IF NOT EXISTS `dynamic_faqsinmobiliarias` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqsinmobiliarias_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsinmobiliarias_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqspropietarios
CREATE TABLE IF NOT EXISTS `dynamic_faqspropietarios` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_faqspropietarios_type
CREATE TABLE IF NOT EXISTS `dynamic_faqspropietarios_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywordds',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL COMMENT 'Position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_franquicia
CREATE TABLE IF NOT EXISTS `dynamic_franquicia` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguaje',
  `dynamic_gallery_franquicia_principal` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Galeria Franquicia',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `text_firstname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre',
  `text_lastname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Apellido',
  `number_telf` int DEFAULT NULL COMMENT 'Telefono',
  `number_telf_mobil` int DEFAULT NULL COMMENT 'Telefono mobil',
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_direccion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Page Title',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text slug',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text Meta Keywords',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Text Meta Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Text Meta Scripts body',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text Meta Keywords',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Auto slug',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text Meta Robots',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_agencia_principal
CREATE TABLE IF NOT EXISTS `dynamic_gallery_agencia_principal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_coleccion
CREATE TABLE IF NOT EXISTS `dynamic_gallery_coleccion` (
  `id` int NOT NULL COMMENT 'identificador de las imágenes',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguaje',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_destinos
CREATE TABLE IF NOT EXISTS `dynamic_gallery_destinos` (
  `id` int NOT NULL COMMENT 'identificador de las imágenes',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'lenguaje',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_gobernanta_principal
CREATE TABLE IF NOT EXISTS `dynamic_gallery_gobernanta_principal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_inmo
CREATE TABLE IF NOT EXISTS `dynamic_gallery_inmo` (
  `id` int NOT NULL COMMENT 'identificador de las imágenes',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'language',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_inmo_principal
CREATE TABLE IF NOT EXISTS `dynamic_gallery_inmo_principal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipstatus` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_importada` int DEFAULT NULL,
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_agencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Agencia',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_lavanderia_principal
CREATE TABLE IF NOT EXISTS `dynamic_gallery_lavanderia_principal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_limpiadora_principal
CREATE TABLE IF NOT EXISTS `dynamic_gallery_limpiadora_principal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_partner_principal
CREATE TABLE IF NOT EXISTS `dynamic_gallery_partner_principal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_regiones_menu
CREATE TABLE IF NOT EXISTS `dynamic_gallery_regiones_menu` (
  `id` int NOT NULL COMMENT 'identificador de las imágenes',
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_tareas_limpieza
CREATE TABLE IF NOT EXISTS `dynamic_gallery_tareas_limpieza` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `zip_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Alt imagen',
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal',
  `text_importada` int DEFAULT NULL COMMENT 'Text Importada',
  `imagethn_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen principal oculta',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gallery_usuario
CREATE TABLE IF NOT EXISTS `dynamic_gallery_usuario` (
  `id` int NOT NULL COMMENT 'identificador de las imágenes',
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_geoarea
CREATE TABLE IF NOT EXISTS `dynamic_geoarea` (
  `id` int NOT NULL,
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `multiple_georegion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_geocity
CREATE TABLE IF NOT EXISTS `dynamic_geocity` (
  `id` int NOT NULL,
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `dynamic_georegion` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4245E053D4DB71B5` (`language`),
  KEY `IDX_4245E0536BDAE05C` (`dynamic_georegion`),
  CONSTRAINT `FK_4245E0536BDAE05C` FOREIGN KEY (`dynamic_georegion`) REFERENCES `dynamic_georegion` (`id`),
  CONSTRAINT `FK_4245E053D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_geocountry
CREATE TABLE IF NOT EXISTS `dynamic_geocountry` (
  `id` int NOT NULL,
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_88ACB8A1D4DB71B5` (`language`),
  CONSTRAINT `FK_88ACB8A1D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_geodistrict
CREATE TABLE IF NOT EXISTS `dynamic_geodistrict` (
  `id` int NOT NULL,
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `dynamic_geolocality` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_postalcode` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Código Postal',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_341ADCE5D4DB71B5` (`language`),
  KEY `IDX_341ADCE5E40D3084` (`dynamic_geolocality`),
  CONSTRAINT `FK_341ADCE5D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`),
  CONSTRAINT `FK_341ADCE5E40D3084` FOREIGN KEY (`dynamic_geolocality`) REFERENCES `dynamic_geolocality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_geolocality
CREATE TABLE IF NOT EXISTS `dynamic_geolocality` (
  `id` int NOT NULL,
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `dynamic_geocity` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E40D3084D4DB71B5` (`language`),
  KEY `IDX_E40D30844245E053` (`dynamic_geocity`),
  CONSTRAINT `FK_E40D30844245E053` FOREIGN KEY (`dynamic_geocity`) REFERENCES `dynamic_geocity` (`id`),
  CONSTRAINT `FK_E40D3084D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_georegion
CREATE TABLE IF NOT EXISTS `dynamic_georegion` (
  `id` int NOT NULL,
  `language_id` int DEFAULT NULL COMMENT 'Identificador',
  `dynamic_geocountry` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6BDAE05C82F1BAF4` (`language_id`),
  KEY `IDX_6BDAE05C88ACB8A1` (`dynamic_geocountry`),
  CONSTRAINT `FK_6BDAE05C82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `FK_6BDAE05C88ACB8A1` FOREIGN KEY (`dynamic_geocountry`) REFERENCES `dynamic_geocountry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_gobernanta
CREATE TABLE IF NOT EXISTS `dynamic_gobernanta` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `user_users` int NOT NULL COMMENT 'User',
  `dynamic_gallery_gobernanta_principal` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_kind_of_way
CREATE TABLE IF NOT EXISTS `dynamic_kind_of_way` (
  `id` tinyint(1) NOT NULL COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'language',
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'titulo way',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_kitchenclass
CREATE TABLE IF NOT EXISTS `dynamic_kitchenclass` (
  `id` tinyint(1) NOT NULL COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'titulo way',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_kitchentype
CREATE TABLE IF NOT EXISTS `dynamic_kitchentype` (
  `id` tinyint(1) NOT NULL COMMENT 'id',
  `language` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'titulo way',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_lavanderia
CREATE TABLE IF NOT EXISTS `dynamic_lavanderia` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `user_users` int NOT NULL COMMENT 'User',
  `dynamic_gallery_lavanderia_principal` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_limpiadora
CREATE TABLE IF NOT EXISTS `dynamic_limpiadora` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'propiedaedes',
  `checkbox_todas` tinyint(1) DEFAULT NULL COMMENT 'Todas propiedades',
  `user_users` int NOT NULL COMMENT 'User',
  `dynamic_gallery_limpiadora_principal` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_limpiadora_geolocation
CREATE TABLE IF NOT EXISTS `dynamic_limpiadora_geolocation` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_limpiadora` int DEFAULT NULL COMMENT 'Limpiadora',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_fecha` datetime DEFAULT NULL COMMENT 'Fecha Actual',
  `text_latitude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Latitud google maps',
  `text_longitude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Longitud google maps',
  `text_altitude` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Altitude',
  `text_accuracy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Accuracy',
  `text_altitude_accuracy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Accuracy',
  `text_speed` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Speed',
  `text_timestamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Timestamp',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_mail_empresa
CREATE TABLE IF NOT EXISTS `dynamic_mail_empresa` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_mail_tipo_portal` int NOT NULL COMMENT 'Dynamic tipo portal',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Empresa',
  `text_nombre_empresa` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre Empresa',
  `text_nombre_empresa_comercial` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre Empresa Comercial',
  `text_direccion` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre Dirección',
  `dynamic_geolocality` smallint DEFAULT NULL COMMENT 'Nombre Localidad',
  `dynamic_geodistrict` smallint DEFAULT NULL COMMENT 'Nombre código postal',
  `text_phone` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telf',
  `text_web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_actividad` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre Actividad',
  `text_producto` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre Producto',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_mail_tipo_portal
CREATE TABLE IF NOT EXISTS `dynamic_mail_tipo_portal` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Tipo Empresa',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_body_title_no_res` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página cuando NO se encuentran resultados',
  `textarea_description_no_res` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página cuando NO se encuentran resultados',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_monumento
CREATE TABLE IF NOT EXISTS `dynamic_monumento` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `checkbox_destacado` tinyint(1) DEFAULT NULL COMMENT 'Destacado Home',
  `dynamic_gallery_monumento` int DEFAULT NULL COMMENT 'Galeria Monumento',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `dynamic_tipo_cultura` int DEFAULT NULL COMMENT 'tipo de cultura',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_offers
CREATE TABLE IF NOT EXISTS `dynamic_offers` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo Sobre Imagen',
  `dynamic_gallery` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la oferta (en descripción)',
  `dynamic_offers_taxonomy` int unsigned NOT NULL COMMENT 'Landing oferta',
  `textarea_summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Resumen de la oferta para el home',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_mensaje_home` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Info a destacar en el menú actividades',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `position_copy1` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_offers_taxonomy
CREATE TABLE IF NOT EXISTS `dynamic_offers_taxonomy` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `dynamic_accion` int DEFAULT NULL COMMENT 'Identificador de accion | venta | alquiler | compra',
  `dynamic_taxonomy_group` int DEFAULT NULL COMMENT 'Tipo propiedad | piso | casa | local',
  `dynamic_gallery` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `dynamic_gallery_home` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Galeria home',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_pages
CREATE TABLE IF NOT EXISTS `dynamic_pages` (
  `id` int NOT NULL,
  `language` int NOT NULL COMMENT 'Identificador',
  `gallery_franquicia_principal` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo Cabecera (máx 100 carácteres)',
  `text_dtitle_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 1',
  `text_dsubtitle_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo 1',
  `textarea_ddescription_1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción 1',
  `text_dtitle_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 2',
  `text_dsubtitle_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo 2',
  `textarea_ddescription_2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción 2',
  `text_dtitle_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 3',
  `text_dsubtitle_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo 3',
  `textarea_ddescription_3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción 3',
  `textarea_description_inferior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página Inferior',
  `textarea_description_home` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción 2',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  KEY `IDX_8702BC0ED4DB71B5` (`language`),
  KEY `IDX_8702BC0EC8B2F110` (`gallery_franquicia_principal`),
  CONSTRAINT `FK_8702BC0EC8B2F110` FOREIGN KEY (`gallery_franquicia_principal`) REFERENCES `gallery_franquicia_principal` (`id`),
  CONSTRAINT `FK_8702BC0ED4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_partner
CREATE TABLE IF NOT EXISTS `dynamic_partner` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `image_1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_plano
CREATE TABLE IF NOT EXISTS `dynamic_plano` (
  `id` int NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `document_documento1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Documento 1',
  `text_titulo1` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 1',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `id_avantio` tinyint(1) DEFAULT '1' COMMENT 'avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_plano_hshv
CREATE TABLE IF NOT EXISTS `dynamic_plano_hshv` (
  `id` int NOT NULL,
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `document_documento1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Documento 1',
  `text_titulo1` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título 1',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_prereserva
CREATE TABLE IF NOT EXISTS `dynamic_prereserva` (
  `id` int NOT NULL COMMENT 'Identificador de la pre reserva',
  `language` int NOT NULL DEFAULT '1' COMMENT 'Lenguagje pre reserva',
  `text_nombre_propiedad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre propiedad',
  `number_id_propiedad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Identificador propiedad',
  `text_url_propiedad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url propiedad',
  `number_precio_reserva` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Precio pre reserva',
  `text_nombre_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre cliente',
  `text_apellido_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Apellido cliente',
  `text_email_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email cliente',
  `number_telf_cliente` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telf cliente',
  `textarea_mensaje_cliente` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Mensaje cliente',
  `number_metodo_envio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Método envío',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_propiedades_destacadas
CREATE TABLE IF NOT EXISTS `dynamic_propiedades_destacadas` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `multiple_rooms` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paginas dinámicas',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_propietario
CREATE TABLE IF NOT EXISTS `dynamic_propietario` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_gallery_propietario` int DEFAULT NULL COMMENT 'Galeria Propietario',
  `number_id_propietario_portvil` int DEFAULT NULL COMMENT 'id propietario portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  `user_users` int NOT NULL COMMENT 'Usuario',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección del propietario',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_propietario_empleado
CREATE TABLE IF NOT EXISTS `dynamic_propietario_empleado` (
  `id` int NOT NULL COMMENT 'Identificador empleado',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `user_users` int DEFAULT NULL COMMENT 'Usuario',
  `dynamic_propietario` int DEFAULT NULL COMMENT 'propietario',
  `dynamic_gallery_propietario_empleado` int DEFAULT NULL COMMENT 'Galeria Empleado',
  `text_email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `number_telf` int DEFAULT NULL COMMENT 'Telefono Agente inmobiliario',
  `number_mobile` int DEFAULT NULL COMMENT 'Telefono movil',
  `number_fax` int DEFAULT NULL COMMENT 'Fax',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`),
  UNIQUE KEY `dynamic_gallery_propietario_empleado` (`dynamic_gallery_propietario_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_propietario_reservas
CREATE TABLE IF NOT EXISTS `dynamic_propietario_reservas` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_gallery_propietario` int DEFAULT NULL COMMENT 'Galeria Propietario',
  `number_id_propietario_portvil` int DEFAULT NULL COMMENT 'id propietario portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  `user_users` int NOT NULL COMMENT 'Usuario',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección del propietario',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_regiones_menu
CREATE TABLE IF NOT EXISTS `dynamic_regiones_menu` (
  `id` int NOT NULL COMMENT 'Identificador',
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguage',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo',
  `dynamic_gallery_regiones_menu` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy_geographic_language_fields_customitzation` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Automátic slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'Status',
  `position` int DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_restaurante
CREATE TABLE IF NOT EXISTS `dynamic_restaurante` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `dynamic_tipo_negocio` int DEFAULT NULL COMMENT 'tipo de negocio',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `checkbox_destacado` tinyint(1) DEFAULT NULL COMMENT 'Destacado Home',
  `dynamic_gallery_restaurante` int DEFAULT NULL COMMENT 'Galeria Franquicia',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección del restaurante',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Web',
  `text_facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Facebook',
  `text_twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Twitter',
  `text_instagram` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Instagram',
  `text_pinterest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Pinterest',
  `text_google_plus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Google Plus',
  `text_body_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la página',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_latitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Latitud google maps',
  `text_longitud` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Longitud google maps',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_roles
CREATE TABLE IF NOT EXISTS `dynamic_roles` (
  `id` int NOT NULL,
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `text_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rol usuariio',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`),
  KEY `IDX_114877BCD4DB71B5` (`language`),
  CONSTRAINT `FK_114877BCD4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_rooms
CREATE TABLE IF NOT EXISTS `dynamic_rooms` (
  `id` int NOT NULL COMMENT 'Identificador del inmueble',
  `language` int DEFAULT NULL COMMENT 'Identificador',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'id avantio',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `update_status_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DBD743EDD4DB71B5` (`language`),
  CONSTRAINT `FK_DBD743EDD4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_services
CREATE TABLE IF NOT EXISTS `dynamic_services` (
  `id` int NOT NULL COMMENT 'Identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguage',
  `text_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 45 caracteres)',
  `image_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen icono (extensión .svg)',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Status',
  `position` int NOT NULL COMMENT 'Posicion',
  `text_class_icon` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Classe Icono',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_services_tmp
CREATE TABLE IF NOT EXISTS `dynamic_services_tmp` (
  `id` int NOT NULL COMMENT 'Identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguage',
  `text_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 45 caracteres)',
  `image_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen icono (extensión .svg)',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Status',
  `position` int NOT NULL COMMENT 'Posicion',
  `text_class_icon` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Classe Icono',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_soporte
CREATE TABLE IF NOT EXISTS `dynamic_soporte` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_subtitle` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `textarea_description_inferior` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_tareas_limpieza
CREATE TABLE IF NOT EXISTS `dynamic_tareas_limpieza` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Página (auto slug)',
  `dynamic_gallery_tareas_limpieza` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción 2',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_tarifas
CREATE TABLE IF NOT EXISTS `dynamic_tarifas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `number_comision` double DEFAULT NULL COMMENT 'id agencia portvil',
  `checkbox_fijo` tinyint(1) DEFAULT NULL,
  `checkbox_comision` tinyint(1) DEFAULT NULL,
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `deleted_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_taxonomy_geographic_language
CREATE TABLE IF NOT EXISTS `dynamic_taxonomy_geographic_language` (
  `id` int NOT NULL COMMENT 'identificador pagina',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'lenguage',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo',
  `text_subtitle` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subtitulo',
  `dynamic_accion` int DEFAULT NULL COMMENT 'accion',
  `dynamic_taxonomy_group` int DEFAULT NULL COMMENT 'taxonomia',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'ciudad',
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'pais',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'distrito',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'localidad',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'localidad',
  `dynamic_url_extra_parametro` int DEFAULT NULL COMMENT 'localidad',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'descripcion',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo pagina',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'keywords',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'meta descripcion',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status',
  `position` int DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_taxonomy_geographic_language_extra
CREATE TABLE IF NOT EXISTS `dynamic_taxonomy_geographic_language_extra` (
  `id` int NOT NULL,
  `language` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_avantio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'avantio',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_taxonomy_geographic_language_fields_customitzation
CREATE TABLE IF NOT EXISTS `dynamic_taxonomy_geographic_language_fields_customitzation` (
  `id` int NOT NULL COMMENT 'identificador pagina',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'lenguage',
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'pais',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'region',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'distrito',
  `dynamic_url_extra_parametro` int DEFAULT NULL COMMENT 'url extra parametro',
  `text_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'url',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo',
  `text_subtitle` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'subtitulo',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'descripcion',
  `textarea_description_2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'descripción pie de pagina',
  `text_m_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'keywords',
  `text_m_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'description',
  `text_m_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'noindex, nofollow' COMMENT 'meta robots',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'auto slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'keywords',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'meta descripcion',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'noindex, nofollow' COMMENT 'robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status',
  `position` int DEFAULT NULL COMMENT 'position',
  `dynamic_geoarea` int DEFAULT NULL COMMENT 'Area',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_taxonomy_group
CREATE TABLE IF NOT EXISTS `dynamic_taxonomy_group` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la Taxonomía (en cabecera)',
  `text_title_url` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'título url',
  `text_title_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la Taxonomía (plural, en cabecera)',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subtítulo de la Cabecera',
  `dynamic_taxonomy_group` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Grupos de taxonomias',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `status_realstate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_telefono_interes
CREATE TABLE IF NOT EXISTS `dynamic_telefono_interes` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `checkbox_destacado` tinyint(1) DEFAULT NULL COMMENT 'Destacado Home',
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_testimonials
CREATE TABLE IF NOT EXISTS `dynamic_testimonials` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_business` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `dynamic_gallery_franquicia_principal` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `checkbox_destacada_home` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la home (si/no)',
  `checkbox_destacada_alojamiento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la página de alojamiento',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_tipo_blog
CREATE TABLE IF NOT EXISTS `dynamic_tipo_blog` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_tipo_cultura
CREATE TABLE IF NOT EXISTS `dynamic_tipo_cultura` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_tipo_negocio
CREATE TABLE IF NOT EXISTS `dynamic_tipo_negocio` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_url_detalle
CREATE TABLE IF NOT EXISTS `dynamic_url_detalle` (
  `id` int NOT NULL COMMENT 'Identificador',
  `language` int NOT NULL COMMENT 'Identificador',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Manual slug',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Automátic slug',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta description',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta robots',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts header',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Scripts body',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'Status',
  `position` int DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`,`language`),
  KEY `IDX_FBCFCE71D4DB71B5` (`language`),
  CONSTRAINT `FK_FBCFCE71D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.dynamic_usuario
CREATE TABLE IF NOT EXISTS `dynamic_usuario` (
  `id` int NOT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo usuario',
  `text_firstname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Nombre',
  `text_lastname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Apellido',
  `number_telf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telf',
  `number_telf_mobil` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telf',
  `text_direccion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Contenido de la página',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.ecb_exchange
CREATE TABLE IF NOT EXISTS `ecb_exchange` (
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(11,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.ecb_exchange_tmp
CREATE TABLE IF NOT EXISTS `ecb_exchange_tmp` (
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(11,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.formulario_dudas
CREATE TABLE IF NOT EXISTS `formulario_dudas` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Idioma',
  `user_users` int NOT NULL COMMENT 'identificador usuario',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Text title',
  `text_nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre usuario',
  `text_telefono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telefono usuario',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email usuario',
  `text_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url',
  `textarea_dudas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Textarea dudas',
  `text_page_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  PRIMARY KEY (`id`,`language`,`user_users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.gallery_bar
CREATE TABLE IF NOT EXISTS `gallery_bar` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador de las imágenes',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.gallery_blog
CREATE TABLE IF NOT EXISTS `gallery_blog` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador de las imágenes',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.gallery_discoteca
CREATE TABLE IF NOT EXISTS `gallery_discoteca` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador de las imágenes',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.gallery_franquicia_principal
CREATE TABLE IF NOT EXISTS `gallery_franquicia_principal` (
  `id` int NOT NULL,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'Status',
  `position` int DEFAULT NULL COMMENT 'position',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.gallery_monumento
CREATE TABLE IF NOT EXISTS `gallery_monumento` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador de las imágenes',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.gallery_restaurante
CREATE TABLE IF NOT EXISTS `gallery_restaurante` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador de las imágenes',
  `image_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 1',
  `image_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 2',
  `image_3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 3',
  `image_4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 4',
  `image_5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 5',
  `image_6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 6',
  `image_7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 7',
  `image_8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 8',
  `image_9` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 9',
  `image_10` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 10',
  `image_11` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 11',
  `image_12` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 12',
  `image_13` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 13',
  `image_14` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 14',
  `image_15` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 15',
  `image_16` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 16',
  `image_17` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 17',
  `image_18` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 18',
  `image_19` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 19',
  `image_20` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 20',
  `image_21` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 21',
  `image_22` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 22',
  `image_23` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 23',
  `image_24` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 24',
  `image_25` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'imagen 25',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations` (
  `id` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `text_geo_tipo_calle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre de vía',
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `text_cocina_clase` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Clase de cocina',
  `text_cocina_tipo` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de cocina',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_anterior
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_anterior` (
  `id` int NOT NULL COMMENT 'Identificador inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'language',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `checkbox_garantia` tinyint(1) DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `dynamic_kind_of_way` int DEFAULT NULL,
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_camas_king` int unsigned DEFAULT NULL COMMENT 'Número de camas king',
  `number_camas_queen` int unsigned DEFAULT NULL COMMENT 'Número de camas queen',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `dynamic_KitchenClass` int DEFAULT NULL,
  `dynamic_KitchenType` int DEFAULT NULL,
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_descriptions
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_descriptions` (
  `language` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `avantio_accomodations` int unsigned NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`language`,`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_extras
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_extras` (
  `avantio_accomodations` int unsigned NOT NULL COMMENT 'id acommodations',
  `dynamic_services` int unsigned NOT NULL COMMENT 'dynamic services',
  `checkbox_included` tinyint(1) NOT NULL COMMENT 'incluido',
  `price` int unsigned NOT NULL COMMENT 'precio',
  `price_unit` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'precio unitario',
  `price_children` int unsigned NOT NULL COMMENT 'precio niños',
  `price_children_unit` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'precio niños unitario',
  `checkbox_pago_en_reserva` tinyint(1) NOT NULL COMMENT 'pago en reserva',
  `checkbox_opcional` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'opcional',
  `text_type` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'tipo',
  `text_parking_location` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ubicación parking',
  `number_limit_weight` int unsigned NOT NULL COMMENT 'limite peso',
  PRIMARY KEY (`avantio_accomodations`,`dynamic_services`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_fields
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_fields` (
  `avantio_accomodations` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador avantio',
  `textarea_notas_internas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'notas internas',
  `number_capacidad_real` int DEFAULT NULL COMMENT 'Capacidad real',
  `text_youtube` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Link youtube',
  `text_cert_energetico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cert. energético',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_fields_bullets
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_fields_bullets` (
  `avantio_accomodations` int NOT NULL COMMENT 'Identificador acommdation',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'lenguage',
  `textarea_bullet` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'bullet',
  `textarea_informacion_adicional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Información adicional',
  PRIMARY KEY (`avantio_accomodations`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_locations
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_locations` (
  `avantio_accomodations` int unsigned NOT NULL AUTO_INCREMENT,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo',
  `text_loc_where` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'where',
  `text_loc_howto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'howto',
  `text_loc_desc1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 1',
  `text_loc_desc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 2',
  `text_beach_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Beach name',
  `number_beach_dist` int unsigned NOT NULL COMMENT 'Beach distance',
  `text_beach_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance beach unit',
  `text_golf_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Golf name',
  `number_golf_dist` int unsigned NOT NULL COMMENT 'Golf distance',
  `text_golf_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance golf unit',
  `text_city_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'City Name',
  `number_city_dist` int unsigned NOT NULL COMMENT 'City Distance',
  `text_city_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance city unit',
  `text_super_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Super name',
  `number_super_dist` int unsigned NOT NULL COMMENT 'Super Distance',
  `text_super_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance super unit',
  `text_airport_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Airport Name',
  `number_airport_dist` int unsigned NOT NULL COMMENT 'Airport Distance',
  `text_airport_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance airport unit',
  `text_train_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Train Name',
  `number_train_dist` int unsigned NOT NULL COMMENT 'Train Distance',
  `text_train_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance train unit',
  `text_bus_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bus name',
  `number_bus_dist` int unsigned NOT NULL COMMENT 'Bus Distance',
  `text_bus_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance bus unit',
  `checkbox_view_to_beach` tinyint(1) NOT NULL COMMENT 'View To Beach',
  `checkbox_view_to_swimming_pool` tinyint(1) NOT NULL COMMENT 'View to swimming pool',
  `checkbox_view_to_golf` tinyint(1) NOT NULL COMMENT 'View To golf',
  `checkbox_view_to_garden` tinyint(1) NOT NULL COMMENT 'View to garden',
  `checkbox_view_to_river` tinyint(1) NOT NULL COMMENT 'View to river',
  `checkbox_view_to_mountain` tinyint(1) NOT NULL COMMENT 'View to mountain',
  `checkbox_view_to_lake` tinyint(1) NOT NULL COMMENT 'View to lake',
  `checkbox_first_line_beach` tinyint(1) NOT NULL COMMENT 'First line beach',
  `checkbox_first_line_golf` tinyint(1) NOT NULL COMMENT 'First Line golf',
  `position` int DEFAULT NULL COMMENT 'position',
  `id_avantio` int DEFAULT NULL COMMENT 'avantio',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_lost
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_lost` (
  `id` int NOT NULL COMMENT 'Identificador inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'language',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `id_avantio` int DEFAULT NULL COMMENT 'pertenece a avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `text_geo_tipo_calle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre de vía',
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `text_cocina_clase` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Clase de cocina',
  `text_cocina_tipo` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de cocina',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_nearest_places
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_nearest_places` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avantio_accomodations` int unsigned NOT NULL,
  `place_type` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` int unsigned NOT NULL COMMENT 'metros',
  `dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Distance unit',
  PRIMARY KEY (`id`),
  KEY `accomodation` (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_pictures
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_pictures` (
  `id` int unsigned NOT NULL,
  `hshv_dynamic_rooms` int unsigned NOT NULL,
  `uri_900x600` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_650x450` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_99x66` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'identificador avantio',
  `id_avantio_picture` int DEFAULT NULL,
  PRIMARY KEY (`id`,`hshv_dynamic_rooms`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_pictures_real
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_pictures_real` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `avantio_accomodations` int unsigned NOT NULL,
  `uri_900x600` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_650x450` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri_99x66` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'identificador avantio',
  `id_avantio_picture` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_real
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_real` (
  `id` int NOT NULL,
  `language` int NOT NULL COMMENT 'Identificador',
  `dynamic_taxonomy` int DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `dynamic_georegion` int DEFAULT NULL,
  `dynamic_geocity` int DEFAULT NULL,
  `dynamic_geolocality` int DEFAULT NULL,
  `dynamic_geodistrict` int DEFAULT NULL,
  `avantio_occupation_rules` int DEFAULT NULL COMMENT 'regla ocupación',
  `avantio_pricemodifiers` int NOT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `checkbox_garantia` tinyint(1) DEFAULT NULL,
  `checkbox_listado_garantia` tinyint(1) DEFAULT NULL,
  `checkbox_dashboard` tinyint(1) DEFAULT NULL,
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `dynamic_kind_of_way` int DEFAULT NULL,
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_camas_king` int unsigned DEFAULT NULL COMMENT 'Número de camas king',
  `number_camas_queen` int unsigned DEFAULT NULL COMMENT 'Número de camas queen',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `dynamic_KitchenClass` int DEFAULT NULL,
  `dynamic_KitchenType` int DEFAULT NULL,
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `update_status_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  KEY `IDX_A0D0714877A90D3F` (`dynamic_taxonomy`),
  KEY `IDX_A0D0714888ACB8A1` (`dynamic_geocountry`),
  KEY `IDX_A0D071486BDAE05C` (`dynamic_georegion`),
  KEY `IDX_A0D071484245E053` (`dynamic_geocity`),
  KEY `IDX_A0D07148E40D3084` (`dynamic_geolocality`),
  KEY `IDX_A0D07148341ADCE5` (`dynamic_geodistrict`),
  KEY `idx_hshv_language` (`language`),
  KEY `idx_hshv_avantio_pricemodifiers` (`avantio_pricemodifiers`),
  CONSTRAINT `FK_A0D07148341ADCE5` FOREIGN KEY (`dynamic_geodistrict`) REFERENCES `dynamic_geodistrict` (`id`),
  CONSTRAINT `FK_A0D071484245E053` FOREIGN KEY (`dynamic_geocity`) REFERENCES `dynamic_geocity` (`id`),
  CONSTRAINT `FK_A0D071486BDAE05C` FOREIGN KEY (`dynamic_georegion`) REFERENCES `dynamic_georegion` (`id`),
  CONSTRAINT `FK_A0D0714877A90D3F` FOREIGN KEY (`dynamic_taxonomy`) REFERENCES `dynamic_taxonomy` (`id`),
  CONSTRAINT `FK_A0D0714888ACB8A1` FOREIGN KEY (`dynamic_geocountry`) REFERENCES `dynamic_geocountry` (`id`),
  CONSTRAINT `FK_A0D07148D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`),
  CONSTRAINT `FK_A0D07148E40D3084` FOREIGN KEY (`dynamic_geolocality`) REFERENCES `dynamic_geolocality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_accomodations_tmp
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_tmp` (
  `id` int NOT NULL COMMENT 'Identificador inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'language',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `avantio_occupation_rules` int unsigned DEFAULT NULL COMMENT 'Regla de ocupación',
  `avantio_pricemodifiers` int unsigned DEFAULT NULL COMMENT 'Modificador de precio',
  `avantio_gallery` int unsigned DEFAULT NULL COMMENT 'Galería',
  `dynamic_taxonomy` int DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'Distrito',
  `text_geo_cp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Código Postal',
  `text_geo_tipo_calle` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre de vía',
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
  `number_geo_zoom` int unsigned DEFAULT NULL COMMENT 'Zoom Google Maps',
  `number_unidades` smallint unsigned DEFAULT NULL COMMENT 'Número de alojamientos',
  `number_habitaciones` int unsigned DEFAULT '1' COMMENT 'Número de habitaciones',
  `number_camas_doble` int unsigned DEFAULT NULL COMMENT 'Número de camas dobles',
  `number_camas_individual` int unsigned DEFAULT NULL COMMENT 'Número de camas individuales',
  `number_sofas_cama` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama',
  `number_sofas_cama_doble` int unsigned DEFAULT NULL COMMENT 'Número de sofás cama doble',
  `number_literas` int unsigned DEFAULT NULL COMMENT 'Número de literas',
  `number_dormitorios_personal` int DEFAULT NULL COMMENT 'Dormitorios de personal',
  `number_camas_supletorias` int DEFAULT NULL COMMENT 'Camas supletorias',
  `number_aseos` int unsigned DEFAULT NULL COMMENT 'Número de aseos',
  `number_banyos_banyera` int unsigned DEFAULT NULL COMMENT 'Número de baños con bañera',
  `number_banyos_ducha` int unsigned DEFAULT NULL COMMENT 'Número de baños con ducha',
  `number_metros_cuadrados` int unsigned DEFAULT NULL COMMENT 'Superficie parcela',
  `number_metros_cuadrados_utiles` int unsigned DEFAULT NULL COMMENT 'Superficie vivienda',
  `number_metros_cuadrados_construidos` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, superfície construida',
  `number_metros_cuadrados_terraza` int unsigned DEFAULT NULL COMMENT 'Metros cuadrados, terraza',
  `number_capacidad_maxima` int unsigned DEFAULT '1' COMMENT 'Ocupación máxima adultos con niños',
  `number_capacidad_minima` int unsigned DEFAULT '1' COMMENT 'Ocupación mínima',
  `number_capacidad_sin_suplemento` int DEFAULT NULL COMMENT 'Ocupación sin suplemento',
  `number_cocinas` int unsigned DEFAULT NULL COMMENT 'Número cocinas',
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `text_cocina_clase` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Clase de cocina',
  `text_cocina_tipo` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo de cocina',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_jardin` tinyint(1) DEFAULT NULL COMMENT 'jardín',
  `checkbox_muebles_jardin` tinyint(1) DEFAULT NULL COMMENT 'muebles de jardín',
  `checkbox_plancha` tinyint(1) DEFAULT NULL COMMENT 'plancha',
  `checkbox_chimenea` tinyint(1) DEFAULT NULL COMMENT 'chimenea',
  `checkbox_barbacoa` tinyint(1) DEFAULT NULL COMMENT 'barbacoa',
  `checkbox_radio` tinyint(1) DEFAULT NULL COMMENT 'radio',
  `checkbox_minibar` tinyint(1) DEFAULT NULL COMMENT 'mini-bar',
  `checkbox_terraza` tinyint(1) DEFAULT NULL COMMENT 'terraza',
  `checkbox_parcela_vallada` tinyint(1) DEFAULT NULL COMMENT 'parcela vallada',
  `checkbox_caja_seguridad` tinyint(1) DEFAULT NULL COMMENT 'caja fuerte',
  `checkbox_ascensor` tinyint(1) DEFAULT NULL COMMENT 'ascensor',
  `checkbox_dvd` tinyint(1) DEFAULT NULL COMMENT 'reproductor de DVD',
  `checkbox_balcon` tinyint(1) DEFAULT NULL COMMENT 'balcón',
  `checkbox_exprimidor` tinyint(1) DEFAULT NULL COMMENT 'exprimidor',
  `checkbox_hervidor_electrico` tinyint(1) DEFAULT NULL COMMENT 'hervidor electrico',
  `checkbox_secador_pelo` tinyint(1) DEFAULT NULL COMMENT 'secador de pelo',
  `checkbox_zona_ninos` tinyint(1) DEFAULT NULL COMMENT 'zona para niños',
  `checkbox_gimnasio` tinyint(1) DEFAULT NULL COMMENT 'gimnasio',
  `checkbox_alarma` tinyint(1) DEFAULT NULL COMMENT 'alarma',
  `checkbox_tennis` tinyint(1) DEFAULT NULL COMMENT 'pista de tenis',
  `checkbox_squash` tinyint(1) DEFAULT NULL COMMENT 'squash',
  `checkbox_paddel` tinyint(1) DEFAULT NULL COMMENT 'paddel',
  `checkbox_sauna` tinyint(1) DEFAULT NULL COMMENT 'sauna',
  `checkbox_jacuzzi` tinyint(1) DEFAULT NULL COMMENT 'jacuzzi',
  `checkbox_apta_discapacitados` tinyint(1) DEFAULT NULL COMMENT 'apta para discapacitados',
  `checkbox_nevera` tinyint(1) DEFAULT NULL COMMENT 'nevera',
  `checkbox_congelador` tinyint(1) DEFAULT NULL COMMENT 'congelador',
  `checkbox_lavavajillas` tinyint(1) DEFAULT NULL COMMENT 'lavavajillas',
  `checkbox_lavadora` tinyint(1) DEFAULT NULL COMMENT 'lavadora',
  `checkbox_secadora` tinyint(1) DEFAULT NULL COMMENT 'secadora',
  `checkbox_cafetera` tinyint(1) DEFAULT NULL COMMENT 'cafetera',
  `checkbox_tostadora` tinyint(1) DEFAULT NULL COMMENT 'tostadora',
  `checkbox_microondas` tinyint(1) DEFAULT NULL COMMENT 'microondas',
  `checkbox_horno` tinyint(1) DEFAULT NULL COMMENT 'horno',
  `checkbox_vajilla` tinyint(1) DEFAULT NULL COMMENT 'vajilla',
  `checkbox_utensilios_cocina` tinyint(1) DEFAULT NULL COMMENT 'utensilios de concina',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  `dynamic_taxonomy_geographic_language_fields_customitzation` int DEFAULT NULL COMMENT 'extra field',
  `checkbox_batidora` tinyint(1) DEFAULT NULL COMMENT 'batidora',
  `checkbox_extra_nevera` tinyint(1) DEFAULT NULL COMMENT 'extra nevera',
  `checkbox_vinoteca` tinyint(1) DEFAULT NULL COMMENT 'vinoteca / frigorifico vinos',
  `checkbox_hervidor_agua` tinyint(1) DEFAULT NULL COMMENT 'hervidor de agua',
  `checkbox_cafetera_nespresso` tinyint(1) DEFAULT NULL COMMENT 'cafetera nespresso',
  `checkbox_wifi` tinyint(1) DEFAULT NULL COMMENT 'wifi',
  `checkbox_aire_acondicionado` tinyint(1) DEFAULT NULL COMMENT 'aire acondicionado',
  `checkbox_ventilador` tinyint(1) DEFAULT NULL COMMENT 'ventilador',
  `checkbox_calefacion_central` tinyint(1) DEFAULT NULL COMMENT 'calefacion central',
  `checkbox_bomba_aire` tinyint(1) DEFAULT NULL COMMENT 'bomba aire frio/calor',
  `checkbox_suelo_radiante` tinyint(1) DEFAULT NULL COMMENT 'suelo radiante',
  `checkbox_cine` tinyint(1) DEFAULT NULL COMMENT 'cine',
  `checkbox_equipo_musica` tinyint(1) DEFAULT NULL COMMENT 'equipo de musica',
  `checkbox_barbacoa_gas` tinyint(1) DEFAULT NULL COMMENT 'barbacoa de gas',
  `checkbox_bano_turco` tinyint(1) DEFAULT NULL COMMENT 'baño turco',
  `checkbox_billar` tinyint(1) DEFAULT NULL COMMENT 'billar',
  `checkbox_ping_pong` tinyint(1) DEFAULT NULL COMMENT 'ping pong',
  `checkbox_seguridad_piscina` tinyint(1) DEFAULT NULL COMMENT 'seguridad piscina',
  `checkbox_accesorios_yoga` tinyint(1) DEFAULT NULL COMMENT 'accesorios yoga',
  `checkbox_hosekeeping` tinyint(1) DEFAULT NULL COMMENT 'hosekeeping on site',
  `checkbox_trona` tinyint(1) DEFAULT NULL COMMENT 'trona',
  `checkbox_mascotas` tinyint(1) DEFAULT NULL COMMENT 'mascotas',
  `checkbox_helipuerto` tinyint(1) DEFAULT NULL COMMENT 'helipuerto',
  `checkbox_zona_de_bar_exterior` tinyint(1) DEFAULT NULL COMMENT 'zona de bar exterior',
  `checkbox_discoteca_privada` tinyint(1) DEFAULT NULL COMMENT 'discoteca privada',
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_availabilities
CREATE TABLE IF NOT EXISTS `hshv_avantio_availabilities` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_availabilities_garantia
CREATE TABLE IF NOT EXISTS `hshv_avantio_availabilities_garantia` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `season` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_availabilties_naranja
CREATE TABLE IF NOT EXISTS `hshv_avantio_availabilties_naranja` (
  `accommodation_id` int unsigned NOT NULL,
  `occupation_rule_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`occupation_rule_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT 'start date',
  `end_date` date DEFAULT NULL COMMENT 'end date',
  `booking_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `check_in_schedule` datetime DEFAULT CURRENT_TIMESTAMP,
  `check_out_schedule` datetime DEFAULT CURRENT_TIMESTAMP,
  `creation_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_modify_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_opcion` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`booking_code`),
  KEY `booking_code` (`booking_code`,`booking_code_reservation`,`start_date`,`end_date`,`booking_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_accommodation
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_accommodation` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id bookig',
  `booking_code_reservation` int NOT NULL COMMENT 'Identificador reserva',
  `avantio_accomodations` int NOT NULL COMMENT 'identificador',
  `text_userid` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `cs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'código cs',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_agencia
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_agencia` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int NOT NULL,
  `id_agencia` int NOT NULL COMMENT 'id agencia',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_amount
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_amount` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int NOT NULL,
  `total_price` double NOT NULL COMMENT 'precio',
  `rental_price` double NOT NULL COMMENT 'precio restante',
  `currency` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'moneda',
  `comission` double NOT NULL COMMENT 'precio restante',
  `applied_owner_comission` double NOT NULL COMMENT 'precio restante',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_amount_services
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_amount_services` (
  `id` int NOT NULL COMMENT 'id booking',
  `booking_code` int NOT NULL COMMENT 'id booking',
  `code` int NOT NULL COMMENT 'service code',
  `amount` int NOT NULL COMMENT 'service amount',
  `price` double NOT NULL COMMENT 'precio',
  `applied_tax_percentage` int NOT NULL COMMENT 'service tax percentage',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'categoria',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_details
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_details` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int NOT NULL,
  `id_language` tinyint(1) NOT NULL COMMENT 'id language',
  `web` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'web',
  `id_booking_type` tinyint(1) NOT NULL COMMENT 'id booking type',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'log comentarios',
  `number_cama_supletoria` tinyint(1) DEFAULT NULL COMMENT 'cama supletoria',
  `number_cuna` tinyint(1) DEFAULT NULL COMMENT 'cuna',
  `number_sillita` tinyint(1) DEFAULT NULL COMMENT 'sillita',
  `number_limpieza` tinyint(1) DEFAULT NULL COMMENT 'limpieza',
  `number_hunter` tinyint(1) DEFAULT NULL COMMENT 'hunter',
  `last_read_datetime` datetime DEFAULT NULL,
  `id_booking_type_booking` tinyint(1) DEFAULT NULL,
  `number_extra_cuna` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_estados
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_estados` (
  `booking_code` int NOT NULL COMMENT 'id booking',
  `id_booking_type` tinyint(1) NOT NULL COMMENT 'id booking type',
  `fecha` datetime NOT NULL,
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'log comentarios',
  PRIMARY KEY (`booking_code`,`id_booking_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_gobernanta
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_gobernanta` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_gobernanta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_limpiadora
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_limpiadora` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_limpiadora` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `start_date_index` (`start_date`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_index` (`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_limpiadora_extra
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_limpiadora_extra` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_limpiadora` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `start_date_index` (`start_date`),
  KEY `booking_date_hshv_limpiadora_extra_index` (`booking_date`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_hshv_limpiadora_extra_index` (`end_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_hshv_limpiadora_extra_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_limpiadora_order_accommodation
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_limpiadora_order_accommodation` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_rooms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_hshv_order_accommodation` (`booking_date`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_hshv_order_accommodation` (`end_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_hshv_order_accommodation` (`start_date`),
  KEY `start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_localizer
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_localizer` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id bookig',
  `id_avantio_booking_localizer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'id localizer',
  `agent_localizator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'agent localizer',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_naranja
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_naranja` (
  `id` int NOT NULL COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `avantio_accomodations` int NOT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'status',
  PRIMARY KEY (`id`,`start_date`,`end_date`,`avantio_accomodations`),
  KEY `booking_code` (`id`,`start_date`,`end_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_observaciones
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_observaciones` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_observaciones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_index` (`booking_date`),
  KEY `booking_date_limpiadora_extra_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `end_date_limpiadora_extra_index` (`end_date`),
  KEY `start_date_index` (`start_date`),
  KEY `start_date_limpiadora_extra_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_occupants
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_occupants` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int NOT NULL,
  `adults_number` int NOT NULL COMMENT 'number adults',
  `child1_age` int NOT NULL COMMENT 'age child 1',
  `child2_age` int NOT NULL COMMENT 'age child 2',
  `child3_age` int NOT NULL COMMENT 'age child 3',
  `child4_age` int NOT NULL COMMENT 'age child 4',
  `child5_age` int NOT NULL COMMENT 'age child 5',
  `child6_age` int NOT NULL COMMENT 'age child 6',
  `child_number` int DEFAULT NULL COMMENT 'Niños',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_payment
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_payment` (
  `id` int NOT NULL COMMENT 'id payment',
  `payment_id` int NOT NULL COMMENT 'id payment',
  `booking_code` int NOT NULL COMMENT 'id booking',
  `payment_date` date NOT NULL COMMENT 'payment date',
  `amount` int NOT NULL COMMENT 'payment amount',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'metodo de pago',
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'status de pago',
  `security_deposit` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'seguro deposito',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`payment_id`,`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_tarea
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_tarea` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_tarea` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`),
  KEY `booking_date_index` (`booking_date`),
  KEY `end_date_index` (`end_date`),
  KEY `start_date_index` (`start_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_booking_usuario
CREATE TABLE IF NOT EXISTS `hshv_avantio_booking_usuario` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `booking_code_reservation` int NOT NULL,
  `id_usuario` int NOT NULL COMMENT 'id agencia',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_calendario
CREATE TABLE IF NOT EXISTS `hshv_avantio_calendario` (
  `id` int NOT NULL COMMENT 'id',
  `id_avantio` int NOT NULL COMMENT 'id avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `id_portvil_todos` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `contador` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_avantio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_client
CREATE TABLE IF NOT EXISTS `hshv_avantio_client` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `id` int NOT NULL COMMENT 'id',
  `booking_code_reservation` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'client name',
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'surname name',
  `dni` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dni',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'dirección',
  `locality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'localidad',
  `postal_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'codigo postal',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ciudad',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'pais',
  `iso_country_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'codigo pais',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'teléfono',
  `phone2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'teléfono 2',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Comentarios del cliente',
  `observations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'observaciones',
  `last_modify_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_code`),
  UNIQUE KEY `booking_code_reservation` (`booking_code_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_lavanderia_availabilities
CREATE TABLE IF NOT EXISTS `hshv_avantio_lavanderia_availabilities` (
  `accommodation_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_limpiadora_availabilities
CREATE TABLE IF NOT EXISTS `hshv_avantio_limpiadora_availabilities` (
  `accommodation_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_limpieza_availabilities
CREATE TABLE IF NOT EXISTS `hshv_avantio_limpieza_availabilities` (
  `accommodation_id` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`accommodation_id`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `season` tinyint(1) NOT NULL COMMENT 'temporadas',
  `min_nights` smallint unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(1) NOT NULL DEFAULT '1',
  `checkout` tinyint(1) NOT NULL DEFAULT '1',
  `opcion_dias_meses_todos_dias_checkin` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'todosPermitidos',
  `opcion_dias_meses_todos_dias_checkout` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'todosPermitidos',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`fecha`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules_checkin_days
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules_checkin_days` (
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT '1',
  `tuesday` tinyint(1) NOT NULL DEFAULT '1',
  `wednesday` tinyint(1) NOT NULL DEFAULT '1',
  `thursday` tinyint(1) NOT NULL DEFAULT '1',
  `friday` tinyint(1) NOT NULL DEFAULT '1',
  `saturday` tinyint(1) NOT NULL DEFAULT '1',
  `sunday` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules_checkin_month_days
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules_checkin_month_days` (
  `avantio_occupation_rules` int NOT NULL DEFAULT '1',
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_dias` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules_checkout_days
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules_checkout_days` (
  `avantio_occupation_rules` int NOT NULL,
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monday` tinyint(1) NOT NULL DEFAULT '1',
  `tuesday` tinyint(1) NOT NULL DEFAULT '1',
  `wednesday` tinyint(1) NOT NULL DEFAULT '1',
  `thursday` tinyint(1) NOT NULL DEFAULT '1',
  `friday` tinyint(1) NOT NULL DEFAULT '1',
  `saturday` tinyint(1) NOT NULL DEFAULT '1',
  `sunday` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules_checkout_month_days
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules_checkout_month_days` (
  `avantio_occupation_rules` int NOT NULL DEFAULT '1',
  `season` tinyint(1) NOT NULL DEFAULT '1',
  `fecha` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_dias` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`avantio_occupation_rules`,`season`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules_names
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_occupation_rules_partials
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules_partials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_hshv_avantio_occupation_rules_names` int DEFAULT NULL,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_rates
CREATE TABLE IF NOT EXISTS `hshv_avantio_rates` (
  `accommodation_id` int unsigned NOT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_rates_acommodation
CREATE TABLE IF NOT EXISTS `hshv_avantio_rates_acommodation` (
  `id` int NOT NULL,
  `id_avantio_acommodation` int NOT NULL,
  PRIMARY KEY (`id`,`id_avantio_acommodation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_rates_garantia
CREATE TABLE IF NOT EXISTS `hshv_avantio_rates_garantia` (
  `accommodation_id` int unsigned NOT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`accommodation_id`,`capacity`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avantio_rates_names
CREATE TABLE IF NOT EXISTS `hshv_avantio_rates_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_avavantio_accomodations_locations
CREATE TABLE IF NOT EXISTS `hshv_avavantio_accomodations_locations` (
  `avantio_accomodations` int unsigned NOT NULL AUTO_INCREMENT,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'titulo',
  `loc_where` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'where',
  `loc_howto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'howto',
  `loc_desc1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 1',
  `loc_desc2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'descripción 2',
  `beach_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'Beach name',
  `beach_dist` int unsigned NOT NULL COMMENT 'Beach distance',
  `beach_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance beach unit',
  `golf_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'Golf name',
  `golf_dist` int unsigned NOT NULL COMMENT 'Golf distance',
  `golf_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance golf unit',
  `city_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'City Name',
  `city_dist` int unsigned NOT NULL COMMENT 'City Distance',
  `city_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance city unit',
  `super_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'Super name',
  `super_dist` int unsigned NOT NULL COMMENT 'Super Distance',
  `super_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance super unit',
  `airport_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'Airport Name',
  `airport_dist` int unsigned NOT NULL COMMENT 'Airport Distance',
  `airport_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance airport unit',
  `train_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'Train Name',
  `train_dist` int unsigned NOT NULL COMMENT 'Train Distance',
  `train_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance train unit',
  `bus_name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVA' COMMENT 'Bus name',
  `bus_dist` int unsigned NOT NULL COMMENT 'Bus Distance',
  `bus_dist_unit` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Distance bus unit',
  `view_to_beach` tinyint(1) NOT NULL COMMENT 'View To Beach',
  `view_to_swimming_pool` tinyint(1) NOT NULL COMMENT 'View to swimming pool',
  `view_to_golf` tinyint(1) NOT NULL COMMENT 'View To golf',
  `view_to_garden` tinyint(1) NOT NULL COMMENT 'View to garden',
  `view_to_river` tinyint(1) NOT NULL COMMENT 'View to river',
  `view_to_mountain` tinyint(1) NOT NULL COMMENT 'View to mountain',
  `view_to_lake` tinyint(1) NOT NULL COMMENT 'View to lake',
  `first_line_beach` tinyint(1) NOT NULL COMMENT 'First line beach',
  `first_line_golf` tinyint(1) NOT NULL COMMENT 'First Line golf',
  `position` int DEFAULT NULL COMMENT 'position',
  `id_avantio` int DEFAULT NULL COMMENT 'avantio',
  PRIMARY KEY (`avantio_accomodations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_dynamic_rooms
CREATE TABLE IF NOT EXISTS `hshv_dynamic_rooms` (
  `id` int NOT NULL,
  `language` int NOT NULL COMMENT 'Identificador',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  PRIMARY KEY (`id`,`language`),
  KEY `IDX_6B675A74D4DB71B5` (`language`),
  CONSTRAINT `FK_6B675A74D4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_dynamic_rooms_anterior
CREATE TABLE IF NOT EXISTS `hshv_dynamic_rooms_anterior` (
  `id` int NOT NULL COMMENT 'Identificador del inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_dynamic_rooms_lost
CREATE TABLE IF NOT EXISTS `hshv_dynamic_rooms_lost` (
  `id` int NOT NULL COMMENT 'Identificador del inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  `id_portvil` int DEFAULT NULL COMMENT 'id portvil',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_dynamic_rooms_real
CREATE TABLE IF NOT EXISTS `hshv_dynamic_rooms_real` (
  `id` int NOT NULL,
  `language` int NOT NULL COMMENT 'Identificador',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `update_status_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`language`),
  KEY `IDX_A8DA7F4ED4DB71B5` (`language`),
  CONSTRAINT `FK_A8DA7F4ED4DB71B5` FOREIGN KEY (`language`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_dynamic_rooms_tmp
CREATE TABLE IF NOT EXISTS `hshv_dynamic_rooms_tmp` (
  `id` int NOT NULL COMMENT 'Identificador del inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'pertenece a avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_dynamic_services
CREATE TABLE IF NOT EXISTS `hshv_dynamic_services` (
  `id` int NOT NULL COMMENT 'Título',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es',
  `text_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 45 caracteres)',
  `image_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen icono (extensión .svg)',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVED',
  `position` int NOT NULL,
  `text_class_icon` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Classe Icono',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.hshv_ecb_exchange
CREATE TABLE IF NOT EXISTS `hshv_ecb_exchange` (
  `currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(11,4) NOT NULL DEFAULT '1.0000',
  PRIMARY KEY (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.kind_of_way
CREATE TABLE IF NOT EXISTS `kind_of_way` (
  `id` tinyint(1) NOT NULL COMMENT 'id',
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'titulo way',
  `STATUS` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `language` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Identificador lenguaje',
  `text_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Idioma',
  `number_actived` tinyint(1) NOT NULL COMMENT 'Activado',
  `number_default` tinyint(1) NOT NULL COMMENT 'Defecto',
  `text_locale` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Local',
  `text_lang` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Texto Idioma',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.message
CREATE TABLE IF NOT EXISTS `message` (
  `id_indice` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `id` bigint NOT NULL,
  `id2` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user1` bigint NOT NULL,
  `user2` bigint NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int NOT NULL,
  `user1read` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user2read` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_indice`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.messenger_messages
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.newsletter
CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'identificador del registro usuario de la newsletter',
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'email del usuario',
  `language` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'lenguage',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.partner
CREATE TABLE IF NOT EXISTS `partner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_0` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `tag` int DEFAULT NULL COMMENT 'Identificador',
  PRIMARY KEY (`id`),
  KEY `IDX_312B3E16389B783` (`tag`),
  CONSTRAINT `FK_312B3E16389B783` FOREIGN KEY (`tag`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.password_reset
CREATE TABLE IF NOT EXISTS `password_reset` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria',
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Texto descriptivo',
  `dynamic_url_slug` int DEFAULT NULL COMMENT 'url slug',
  `dynamic_url_detalle` int DEFAULT NULL COMMENT 'url detalle',
  `dynamic_pages` int DEFAULT NULL COMMENT 'paginas',
  `checkbox_gestor_contenidos` tinyint(1) DEFAULT NULL COMMENT 'gestor contenidos',
  `checkbox_agencia` tinyint(1) DEFAULT NULL COMMENT 'gestor contenidos',
  `checkbox_propietario` tinyint(1) DEFAULT NULL COMMENT 'propietario',
  `checkbox_usuario` tinyint(1) DEFAULT NULL COMMENT 'usuario',
  `checkbox_gobernanta` tinyint(1) DEFAULT NULL COMMENT 'gobernanta',
  `checkbox_limpiadora` tinyint(1) DEFAULT NULL COMMENT 'limpiadora',
  `checkbox_lavanderia` tinyint(1) DEFAULT NULL COMMENT 'limpiadora',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.preferences
CREATE TABLE IF NOT EXISTS `preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `booking_agencia` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `booking_propietario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`),
  CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int NOT NULL COMMENT 'Identificador',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre',
  `message` int DEFAULT NULL COMMENT 'Clave primaria',
  PRIMARY KEY (`id`),
  KEY `IDX_389B783B6BD307F` (`message`),
  CONSTRAINT `FK_389B783B6BD307F` FOREIGN KEY (`message`) REFERENCES `message` (`id_indice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int NOT NULL COMMENT 'Identificador',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.tmp_dynamic_rooms
CREATE TABLE IF NOT EXISTS `tmp_dynamic_rooms` (
  `id` int NOT NULL COMMENT 'Identificador del inmueble',
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'es' COMMENT 'Lenguagje aplicación',
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `number_minprecio` int DEFAULT NULL COMMENT 'min precio',
  `number_precio` bigint DEFAULT NULL COMMENT 'precio',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción principal',
  `text_page_title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Título sobre el alojamiento',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `text_meta_keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Keywords (máx 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `text_meta_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Meta Description (max 255 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'id avantio',
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL COMMENT 'Identificador del usuario',
  `dynamic_roles` int DEFAULT NULL,
  `text_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nombre del usuario',
  `text_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Password del usuario',
  `text_password_interficie` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Password Interficie',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email del usuario',
  `text_grupo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Grupo del usuario',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'ACTIVED' COMMENT 'Grupo del usuario',
  `created_at` datetime DEFAULT NULL COMMENT 'Fecha de creación',
  `updated_at` datetime DEFAULT NULL COMMENT 'Fecha de actualización',
  `deleted_at` datetime DEFAULT NULL COMMENT 'Fecha de eliminación',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1483A5E9114877BC` (`dynamic_roles`),
  CONSTRAINT `FK_1483A5E9114877BC` FOREIGN KEY (`dynamic_roles`) REFERENCES `dynamic_roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla portvil_symfony_template_language.vantio_booking_limpiadora
CREATE TABLE IF NOT EXISTS `vantio_booking_limpiadora` (
  `booking_code` int NOT NULL AUTO_INCREMENT COMMENT 'id booking',
  `start_date` date NOT NULL COMMENT 'start date',
  `end_date` date NOT NULL COMMENT 'end date',
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'booking date',
  `multiple_limpiadora` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Limpiadora',
  `last_modify_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
