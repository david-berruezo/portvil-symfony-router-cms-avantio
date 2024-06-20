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


-- Volcando estructura de base de datos para phpandfr_portvil_dos_symfony_tres
CREATE DATABASE IF NOT EXISTS `phpandfr_portvil_dos_symfony_tres` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `phpandfr_portvil_dos_symfony_tres`;

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.avantio_accomodations
CREATE TABLE IF NOT EXISTS `avantio_accomodations` (
  `id` int NOT NULL,
  `avantio_accomodations` int NOT NULL,
  `language` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `dynamic_taxonomy` int DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `dynamic_georegion` int DEFAULT NULL,
  `dynamic_geocity` int DEFAULT NULL,
  `dynamic_geolocality` int DEFAULT NULL,
  `dynamic_geodistrict` int DEFAULT NULL,
  `checkbox_garantia` tinyint(1) DEFAULT NULL,
  `checkbox_listado_garantia` tinyint(1) DEFAULT NULL,
  `checkbox_dashboard` tinyint(1) DEFAULT NULL,
  `text_geo_cp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'Código Postal',
  `dynamic_kind_of_way` int DEFAULT NULL,
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
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
  `dynamic_kitchenclass` int DEFAULT NULL,
  `dynamic_kitchentype` int DEFAULT NULL,
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
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
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'id avantio',
  `status` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `update_status_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6671DDA277A90D3F` (`dynamic_taxonomy`),
  KEY `IDX_6671DDA288ACB8A1` (`dynamic_geocountry`),
  KEY `IDX_6671DDA26BDAE05C` (`dynamic_georegion`),
  KEY `IDX_6671DDA24245E053` (`dynamic_geocity`),
  KEY `IDX_6671DDA2E40D3084` (`dynamic_geolocality`),
  KEY `IDX_6671DDA2341ADCE5` (`dynamic_geodistrict`),
  CONSTRAINT `FK_6671DDA2341ADCE5` FOREIGN KEY (`dynamic_geodistrict`) REFERENCES `dynamic_geodistrict` (`id`),
  CONSTRAINT `FK_6671DDA24245E053` FOREIGN KEY (`dynamic_geocity`) REFERENCES `dynamic_geocity` (`id`),
  CONSTRAINT `FK_6671DDA26BDAE05C` FOREIGN KEY (`dynamic_georegion`) REFERENCES `dynamic_georegion` (`id`),
  CONSTRAINT `FK_6671DDA277A90D3F` FOREIGN KEY (`dynamic_taxonomy`) REFERENCES `dynamic_taxonomy` (`id`),
  CONSTRAINT `FK_6671DDA288ACB8A1` FOREIGN KEY (`dynamic_geocountry`) REFERENCES `dynamic_geocountry` (`id`),
  CONSTRAINT `FK_6671DDA2E40D3084` FOREIGN KEY (`dynamic_geolocality`) REFERENCES `dynamic_geolocality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.avantio_accomodations_pictures
CREATE TABLE IF NOT EXISTS `avantio_accomodations_pictures` (
  `id` int unsigned NOT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `uri_900x600` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uri_650x450` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uri_99x66` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'identificador avantio',
  `id_avantio_picture` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_624494DF6671DDA2` (`avantio_accomodations`),
  CONSTRAINT `FK_624494DF6671DDA2` FOREIGN KEY (`avantio_accomodations`) REFERENCES `avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.avantio_availabilities
CREATE TABLE IF NOT EXISTS `avantio_availabilities` (
  `id` int NOT NULL,
  `accommodation_id` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2DDC39718F3692CD` (`accommodation_id`),
  CONSTRAINT `FK_2DDC39718F3692CD` FOREIGN KEY (`accommodation_id`) REFERENCES `avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.avantio_occupation_rules
CREATE TABLE IF NOT EXISTS `avantio_occupation_rules` (
  `id` int NOT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `avantio_occupation_rules` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `season` int NOT NULL COMMENT 'temporadas',
  `min_nights` smallint unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(1) NOT NULL DEFAULT '1',
  `checkout` tinyint(1) NOT NULL DEFAULT '1',
  `opcion_dias_meses_todos_dias_checkin` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'todosPermitidos',
  `opcion_dias_meses_todos_dias_checkout` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'todosPermitidos',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3478C4106671DDA2` (`avantio_accomodations`),
  CONSTRAINT `FK_3478C4106671DDA2` FOREIGN KEY (`avantio_accomodations`) REFERENCES `avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.avantio_pricemodifiers
CREATE TABLE IF NOT EXISTS `avantio_pricemodifiers` (
  `id` int NOT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `avantio_pricemodifiers` int NOT NULL,
  `name` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `min_nights` int unsigned NOT NULL,
  `max_nights` int unsigned NOT NULL,
  `season` tinyint(1) DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acumulative` tinyint(1) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'tpc',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6EFFF89A6671DDA2` (`avantio_accomodations`),
  CONSTRAINT `FK_6EFFF89A6671DDA2` FOREIGN KEY (`avantio_accomodations`) REFERENCES `avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.avantio_rates
CREATE TABLE IF NOT EXISTS `avantio_rates` (
  `id` int NOT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `avantio_rates` int NOT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2929EF306671DDA2` (`avantio_accomodations`),
  CONSTRAINT `FK_2929EF306671DDA2` FOREIGN KEY (`avantio_accomodations`) REFERENCES `avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int NOT NULL COMMENT 'Información de contacto',
  `name` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Nombre' COMMENT 'Nombre',
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `phone` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Telf',
  `subject` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Titulo',
  `form_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mensaje',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_accion
CREATE TABLE IF NOT EXISTS `dynamic_accion` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_accion` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_advantages
CREATE TABLE IF NOT EXISTS `dynamic_advantages` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_icon` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Icon: ‘wifi’, ‘reloj’, ‘teleoperadora’, ‘dinero’, ‘bienvenido’, ‘llave’',
  `checkbox_destacada_home` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la home (si/no)',
  `checkbox_destacada_alojamiento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la página de alojamiento',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_agencia
CREATE TABLE IF NOT EXISTS `dynamic_agencia` (
  `id` int NOT NULL,
  `dynamic_tarifa` int DEFAULT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `dynamic_georegion` int DEFAULT NULL,
  `dynamic_geocity` int DEFAULT NULL,
  `dynamic_geolocality` int DEFAULT NULL,
  `language` int NOT NULL,
  `dynamic_agencia` int NOT NULL,
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `text_title_comercial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Codigo Agencia',
  `number_descuento` double DEFAULT NULL COMMENT 'Descuento',
  `text_tipo_descuento` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tipo descuento porcentual | numero',
  `text_ver_precio_neto_o_precio_bruto` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dynamic_comision_agencia` int DEFAULT NULL,
  `number_dias_opciones` int DEFAULT NULL,
  `checkbox_cancelaciones_automaticas` tinyint(1) DEFAULT NULL COMMENT 'cancelar automáticamente',
  `text_web_avantio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'canal avantio',
  `text_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Email',
  `text_contacto` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_licencia` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_cif` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_telf` int DEFAULT NULL COMMENT 'Número de teléfono',
  `text_codigo_postal` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_mobile` int DEFAULT NULL COMMENT 'Número de movil',
  `multiple_garantia_rooms` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_fax` int DEFAULT NULL COMMENT 'Número de fax',
  `text_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Dirección de la agencia',
  `text_poblacion` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3510C582CD716B33` (`dynamic_tarifa`),
  KEY `IDX_3510C58288ACB8A1` (`dynamic_geocountry`),
  KEY `IDX_3510C5826BDAE05C` (`dynamic_georegion`),
  KEY `IDX_3510C5824245E053` (`dynamic_geocity`),
  KEY `IDX_3510C582E40D3084` (`dynamic_geolocality`),
  CONSTRAINT `FK_3510C5824245E053` FOREIGN KEY (`dynamic_geocity`) REFERENCES `dynamic_geocity` (`id`),
  CONSTRAINT `FK_3510C5826BDAE05C` FOREIGN KEY (`dynamic_georegion`) REFERENCES `dynamic_georegion` (`id`),
  CONSTRAINT `FK_3510C58288ACB8A1` FOREIGN KEY (`dynamic_geocountry`) REFERENCES `dynamic_geocountry` (`id`),
  CONSTRAINT `FK_3510C582CD716B33` FOREIGN KEY (`dynamic_tarifa`) REFERENCES `dynamic_tarifa` (`id`),
  CONSTRAINT `FK_3510C582E40D3084` FOREIGN KEY (`dynamic_geolocality`) REFERENCES `dynamic_geolocality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_blog
CREATE TABLE IF NOT EXISTS `dynamic_blog` (
  `id` int NOT NULL,
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_bloque_footer
CREATE TABLE IF NOT EXISTS `dynamic_bloque_footer` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Bloque',
  `text_nombre_bloque` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Fichero',
  `multiple_pages` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paginas dinámicas',
  `checkbox_activado` tinyint(1) DEFAULT NULL COMMENT 'activar bloque',
  `text_page_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_bloque_header
CREATE TABLE IF NOT EXISTS `dynamic_bloque_header` (
  `id` int NOT NULL,
  `language` int NOT NULL,
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
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsagencias
CREATE TABLE IF NOT EXISTS `dynamic_faqsagencias` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsagencias_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsagencias_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsagentes
CREATE TABLE IF NOT EXISTS `dynamic_faqsagentes` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsagentes_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsagentes_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsclientes
CREATE TABLE IF NOT EXISTS `dynamic_faqsclientes` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsclientes_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsclientes_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsinmobiliarias
CREATE TABLE IF NOT EXISTS `dynamic_faqsinmobiliarias` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqsinmobiliarias_type
CREATE TABLE IF NOT EXISTS `dynamic_faqsinmobiliarias_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqspropietarios
CREATE TABLE IF NOT EXISTS `dynamic_faqspropietarios` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_faqspropietarios_type
CREATE TABLE IF NOT EXISTS `dynamic_faqspropietarios_type` (
  `id` int NOT NULL COMMENT 'identificador',
  `language` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_geocity
CREATE TABLE IF NOT EXISTS `dynamic_geocity` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_geocity` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `dynamic_georegion` int DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4245E0536BDAE05C` (`dynamic_georegion`),
  CONSTRAINT `FK_4245E0536BDAE05C` FOREIGN KEY (`dynamic_georegion`) REFERENCES `dynamic_georegion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_geocountry
CREATE TABLE IF NOT EXISTS `dynamic_geocountry` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_geocountry` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_geodistrict
CREATE TABLE IF NOT EXISTS `dynamic_geodistrict` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_geodistrict` int DEFAULT NULL,
  `dynamic_geolocality` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `text_postalcode` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Código Postal',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_341ADCE5E40D3084` (`dynamic_geolocality`),
  CONSTRAINT `FK_341ADCE5E40D3084` FOREIGN KEY (`dynamic_geolocality`) REFERENCES `dynamic_geolocality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_geolocality
CREATE TABLE IF NOT EXISTS `dynamic_geolocality` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_geolocality` int NOT NULL,
  `dynamic_geocity` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E40D30844245E053` (`dynamic_geocity`),
  CONSTRAINT `FK_E40D30844245E053` FOREIGN KEY (`dynamic_geocity`) REFERENCES `dynamic_geocity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_georegion
CREATE TABLE IF NOT EXISTS `dynamic_georegion` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_georegion` int NOT NULL,
  `dynamic_geocountry` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6BDAE05C88ACB8A1` (`dynamic_geocountry`),
  CONSTRAINT `FK_6BDAE05C88ACB8A1` FOREIGN KEY (`dynamic_geocountry`) REFERENCES `dynamic_geocountry` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_gobernanta
CREATE TABLE IF NOT EXISTS `dynamic_gobernanta` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
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
  `dynamic_gobernanta` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_lavanderia
CREATE TABLE IF NOT EXISTS `dynamic_lavanderia` (
  `id` int NOT NULL,
  `dynamic_lavanderia` int NOT NULL,
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
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
  `language` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_limpiadora
CREATE TABLE IF NOT EXISTS `dynamic_limpiadora` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `number_id_agencia_portvil` int DEFAULT NULL COMMENT 'id agencia portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'propiedaedes',
  `checkbox_todas` tinyint(1) DEFAULT NULL COMMENT 'Todas propiedades',
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
  `dynamic_limpiadora` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_pages
CREATE TABLE IF NOT EXISTS `dynamic_pages` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_pages` int NOT NULL,
  `tabla_id` int DEFAULT NULL,
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
  PRIMARY KEY (`id`),
  KEY `IDX_8702BC0E639DBF0B` (`tabla_id`),
  CONSTRAINT `FK_8702BC0E639DBF0B` FOREIGN KEY (`tabla_id`) REFERENCES `tabla` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_partner
CREATE TABLE IF NOT EXISTS `dynamic_partner` (
  `id` int NOT NULL,
  `language` int NOT NULL,
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
  `dynamic_partner` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_propiedades_destacadas
CREATE TABLE IF NOT EXISTS `dynamic_propiedades_destacadas` (
  `id` int NOT NULL,
  `language` int NOT NULL,
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
  `dynamic_propiedades_destacadas` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_propietario
CREATE TABLE IF NOT EXISTS `dynamic_propietario` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_gallery_propietario` int DEFAULT NULL COMMENT 'Galeria Propietario',
  `number_id_propietario_portvil` int DEFAULT NULL COMMENT 'id propietario portvil',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título Cabecera',
  `multiple_rooms` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Propiedades',
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
  `dynamic_propietario` int DEFAULT NULL COMMENT 'Galeria Propietario',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_rooms
CREATE TABLE IF NOT EXISTS `dynamic_rooms` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_tarifa
CREATE TABLE IF NOT EXISTS `dynamic_tarifa` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_tarifa` int NOT NULL,
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

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_taxonomy
CREATE TABLE IF NOT EXISTS `dynamic_taxonomy` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_taxonomy` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la Taxonomía (en cabecera)',
  `text_title_url` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'título url',
  `text_title_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la Taxonomía (plural, en cabecera)',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo de la Cabecera',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_taxonomy_group
CREATE TABLE IF NOT EXISTS `dynamic_taxonomy_group` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `dynamic_taxonomy_group` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la Taxonomía (en cabecera)',
  `text_title_url` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'título url',
  `text_title_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la Taxonomía (plural, en cabecera)',
  `text_subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Subtítulo de la Cabecera',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_testimonials
CREATE TABLE IF NOT EXISTS `dynamic_testimonials` (
  `id` int NOT NULL,
  `language` int NOT NULL,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `text_business` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `dynamic_gallery_franquicia_principal` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagen Principal',
  `checkbox_destacada_home` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la home (si/no)',
  `checkbox_destacada_alojamiento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Destacar en la página de alojamiento',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL,
  `dynamic_testimonials` int NOT NULL,
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.dynamic_url_detalle
CREATE TABLE IF NOT EXISTS `dynamic_url_detalle` (
  `id` int NOT NULL COMMENT 'Identificador',
  `language` int NOT NULL,
  `dynamic_url_detalle` int NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.gallery_blog
CREATE TABLE IF NOT EXISTS `gallery_blog` (
  `id` int NOT NULL COMMENT 'identificador de las imágenes',
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (75 carácteres)',
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
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.gallery_franquicia_principal
CREATE TABLE IF NOT EXISTS `gallery_franquicia_principal` (
  `id` int NOT NULL,
  `text_title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_alt` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_principal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.group
CREATE TABLE IF NOT EXISTS `group` (
  `id` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_avantio_accomodations
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations` (
  `id` int NOT NULL,
  `hshv_avantio_accomodations` int NOT NULL,
  `language` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nombre del alojamiento',
  `text_referencia` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Referencia',
  `text_userid` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Id usuario',
  `text_company` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Nombre compañia',
  `number_companyid` int unsigned DEFAULT NULL COMMENT 'Id compañia',
  `text_numero_registro_turistico` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Número de registro turístico',
  `dynamic_taxonomy` int DEFAULT NULL COMMENT 'Taxonomía (Kinds)',
  `dynamic_geocountry` int DEFAULT NULL COMMENT 'País',
  `dynamic_georegion` int DEFAULT NULL COMMENT 'Región',
  `dynamic_geocity` int DEFAULT NULL COMMENT 'Ciudad',
  `dynamic_geolocality` int DEFAULT NULL COMMENT 'Localidad',
  `dynamic_geodistrict` int DEFAULT NULL COMMENT 'Distrito',
  `checkbox_garantia` tinyint(1) DEFAULT NULL,
  `checkbox_listado_garantia` tinyint(1) DEFAULT NULL,
  `checkbox_dashboard` tinyint(1) DEFAULT NULL,
  `text_geo_cp` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci COMMENT 'Código Postal',
  `dynamic_kind_of_way` int DEFAULT NULL,
  `text_geo_calle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Calle',
  `text_geo_numero` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Número',
  `text_geo_bloque` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Piso / Letra',
  `text_geo_puerta` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Puerta',
  `text_geo_piso` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Piso',
  `text_geo_latitud` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'GPS Latitud',
  `text_geo_longitud` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'GPS Longitud',
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
  `dynamic_kitchenclass` int DEFAULT NULL,
  `dynamic_kitchentype` int DEFAULT NULL,
  `number_fun` int DEFAULT NULL COMMENT 'ventilador',
  `text_orientacion` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Orientación',
  `text_tipo_piscina` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'Tipo piscina',
  `text_dimensiones_piscina` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'dimensiones piscina',
  `checkbox_piscina` tinyint(1) DEFAULT NULL COMMENT 'piscina',
  `number_plazas_aparcamiento` int DEFAULT NULL COMMENT 'plazas de aparcamiento',
  `checkbox_aparcamiento` tinyint(1) DEFAULT NULL COMMENT 'aparcamiento',
  `checkbox_tv` tinyint(1) DEFAULT NULL COMMENT 'tv',
  `checkbox_grups` tinyint(1) DEFAULT NULL COMMENT 'grupos',
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
  `multiple_taxonomy_geographic_language_extra` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'coleccion',
  `multiple_taxonomy_geographic_language_carac` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'carac avantio',
  `status` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'ACTIVED' COMMENT 'estado',
  `position` int DEFAULT NULL COMMENT 'posicion',
  `created_at` datetime DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `update_status_at` datetime DEFAULT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AEF5B0046671DDA2` (`avantio_accomodations`),
  CONSTRAINT `FK_AEF5B0046671DDA2` FOREIGN KEY (`avantio_accomodations`) REFERENCES `avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_avantio_accomodations_pictures
CREATE TABLE IF NOT EXISTS `hshv_avantio_accomodations_pictures` (
  `id` int unsigned NOT NULL,
  `avantio_accomodations` int DEFAULT NULL,
  `uri_900x600` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uri_650x450` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `uri_99x66` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `id_avantio` tinyint(1) DEFAULT NULL COMMENT 'identificador avantio',
  `id_avantio_picture` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3FF688EB6671DDA2` (`avantio_accomodations`),
  CONSTRAINT `FK_3FF688EB6671DDA2` FOREIGN KEY (`avantio_accomodations`) REFERENCES `hshv_avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_avantio_availabilities
CREATE TABLE IF NOT EXISTS `hshv_avantio_availabilities` (
  `id` int NOT NULL,
  `fecha` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `update_at` datetime DEFAULT NULL,
  `accommodation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_12A1BBC18F3692CD` (`accommodation_id`),
  CONSTRAINT `FK_12A1BBC18F3692CD` FOREIGN KEY (`accommodation_id`) REFERENCES `hshv_avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_avantio_occupation_rules
CREATE TABLE IF NOT EXISTS `hshv_avantio_occupation_rules` (
  `id` int NOT NULL,
  `hshv_avantio_accomodations` int DEFAULT NULL,
  `hshv_avantio_occupation_rules` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `season` int NOT NULL COMMENT 'temporadas',
  `min_nights` smallint unsigned NOT NULL DEFAULT '1',
  `min_nights_online` smallint unsigned NOT NULL DEFAULT '1',
  `checkin` tinyint(1) NOT NULL DEFAULT '1',
  `checkout` tinyint(1) NOT NULL DEFAULT '1',
  `opcion_dias_meses_todos_dias_checkin` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'todosPermitidos',
  `opcion_dias_meses_todos_dias_checkout` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'todosPermitidos',
  PRIMARY KEY (`id`),
  KEY `IDX_D30BB7D9AEF5B004` (`hshv_avantio_accomodations`),
  CONSTRAINT `FK_D30BB7D9AEF5B004` FOREIGN KEY (`hshv_avantio_accomodations`) REFERENCES `hshv_avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_avantio_pricemodifiers
CREATE TABLE IF NOT EXISTS `hshv_avantio_pricemodifiers` (
  `id` int NOT NULL,
  `hshv_avantio_accomodations` int DEFAULT NULL,
  `hshv_avantio_pricemodifiers` int NOT NULL,
  `name` varchar(75) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `min_nights` int unsigned NOT NULL,
  `max_nights` int unsigned NOT NULL,
  `season` tinyint(1) DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `acumulative` tinyint(1) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'tpc',
  `amount` decimal(7,2) NOT NULL DEFAULT '0.00',
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_51827A2AAEF5B004` (`hshv_avantio_accomodations`),
  CONSTRAINT `FK_51827A2AAEF5B004` FOREIGN KEY (`hshv_avantio_accomodations`) REFERENCES `hshv_avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_avantio_rates
CREATE TABLE IF NOT EXISTS `hshv_avantio_rates` (
  `id` int NOT NULL,
  `hshv_avantio_accomodations` int DEFAULT NULL,
  `hshv_avantio_rates` int DEFAULT NULL,
  `capacity` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `price` double NOT NULL,
  `update_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9999F6A9AEF5B004` (`hshv_avantio_accomodations`),
  CONSTRAINT `FK_9999F6A9AEF5B004` FOREIGN KEY (`hshv_avantio_accomodations`) REFERENCES `hshv_avantio_accomodations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.hshv_dynamic_rooms
CREATE TABLE IF NOT EXISTS `hshv_dynamic_rooms` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.language
CREATE TABLE IF NOT EXISTS `language` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Identificador',
  `language` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Identificador lenguaje',
  `text_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Idioma',
  `number_actived` tinyint(1) NOT NULL COMMENT 'Activado',
  `number_default` tinyint(1) NOT NULL COMMENT 'Defecto',
  `text_locale` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Local',
  `text_lang` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Texto Idioma',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `text_title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Identificador lenguaje',
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.messenger_messages
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

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.objeto
CREATE TABLE IF NOT EXISTS `objeto` (
  `id` int NOT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int NOT NULL,
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
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.preferences
CREATE TABLE IF NOT EXISTS `preferences` (
  `id` int NOT NULL,
  `booking` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `booking_agencia` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `booking_propietario` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Texto descriptivo',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.tabla
CREATE TABLE IF NOT EXISTS `tabla` (
  `id` int NOT NULL,
  `objeto_id` int DEFAULT NULL,
  `text_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `textarea_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripción',
  `text_page_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título de la pestaña de la página',
  `text_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url manual (vacío usará auto slug)',
  `auto_slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Url corta (auto slug)',
  `text_meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Keywords (máx 255 carácteres)',
  `text_meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Description (max 255 characters)',
  `text_meta_robots` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Meta Robots (max 45 characters)',
  `textarea_scripts_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional header scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `textarea_scripts_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Aditional footer scripts (Add tags &lt;script&gt;&lt;/script&gt;)',
  `status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F1444B5F76F5CD27` (`objeto_id`),
  CONSTRAINT `FK_F1444B5F76F5CD27` FOREIGN KEY (`objeto_id`) REFERENCES `objeto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  PRIMARY KEY (`id`),
  KEY `IDX_389B7838DB60186` (`task_id`),
  CONSTRAINT `FK_389B7838DB60186` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `task` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  `due_date` datetime DEFAULT NULL COMMENT 'Título (máximo 255 caracteres)',
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB2512469DE2` (`category_id`),
  CONSTRAINT `FK_527EDB2512469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla phpandfr_portvil_dos_symfony_tres.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
