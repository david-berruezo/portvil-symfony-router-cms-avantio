# Portvil CMS — Symfony + Avantio Integration

CMS personalizado construido con **Symfony** para la gestión de propiedades de alquiler vacacional integrado con **[Avantio](https://www.avantio.com/es/)**. La aplicación incluye un panel de administración completo con CRUD multiidioma, gestión geográfica jerárquica (País → Región → Ciudad → Localidad → Distrito), sistema de propiedades Avantio, API REST propia, **API Platform**, autenticación contra MySQL y templates Twig dinámicos.

[![Symfony](https://img.shields.io/badge/Symfony-6.x-000000?logo=symfony&logoColor=white)](https://symfony.com/)
[![PHP](https://img.shields.io/badge/PHP-8.x-777BB4?logo=php&logoColor=white)](https://www.php.net/)
[![Doctrine](https://img.shields.io/badge/Doctrine-ORM-FC6A31)](https://www.doctrine-project.org/)
[![API Platform](https://img.shields.io/badge/API%20Platform-REST-38A89D)](https://api-platform.com/)
[![MySQL](https://img.shields.io/badge/MySQL-8.x-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Docker](https://img.shields.io/badge/Docker-Compose-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![PHPUnit](https://img.shields.io/badge/PHPUnit-Tests-3C9CD7)](https://phpunit.de/)

> ⚠️ **Proyecto en desarrollo** — Algunas funcionalidades pueden estar incompletas.

---

## Tabla de Contenidos

- [Sobre el Proyecto](#sobre-el-proyecto)
- [Características](#características)
- [Capturas de Pantalla](#capturas-de-pantalla)
- [Arquitectura](#arquitectura)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Modelo de Datos](#modelo-de-datos)
- [API REST y API Platform](#api-rest-y-api-platform)
- [Rutas del Sistema](#rutas-del-sistema)
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Testing](#testing)
- [Tecnologías](#tecnologías)
- [Recursos](#recursos)
- [Autor](#autor)

---

## Sobre el Proyecto

Este CMS está diseñado para gestionar propiedades de alquiler vacacional sincronizadas con el PMS de **Avantio**. A diferencia de soluciones basadas en WordPress, este proyecto utiliza **Symfony** como framework, lo que permite un control total sobre la arquitectura, el rendimiento y la escalabilidad.

El sistema implementa una estructura geográfica jerárquica completa (País → Región → Ciudad → Localidad → Distrito) con soporte multiidioma (Español e Inglés), y expone los datos tanto a través de un panel de administración con Twig como a través de APIs REST para consumo externo.

---

## Características

### Panel de Administración (Backend)

- **CRUD completo** para todas las entidades (países, regiones, ciudades, localidades, distritos, propiedades)
- **Multiidioma** — Rutas y contenido en Español (`/admin23111978/pais/listar`) e Inglés (`/en/admin23111978/country/list`)
- **DataTables** — Listados interactivos con ordenación, búsqueda y paginación
- **CKEditor** — Editor WYSIWYG para campos de texto enriquecido
- **Formularios Symfony** — Validación server-side con constraints
- **Autenticación** — Login/registro de usuarios admin con validación contra MySQL

### Frontend Público

- Listados y fichas de propiedades accesibles públicamente
- Rutas multiidioma para el front-office
- Templates Twig con lectura dinámica de propiedades mediante Reflection

### APIs

- **API Platform** — API REST automática con documentación Swagger/OpenAPI
- **API REST custom** — Endpoints propios para listados y operaciones CRUD
- Operaciones **GET / POST / PUT / DELETE** completas

### Integración Avantio

- Importación de propiedades desde el PMS de Avantio
- Mapeo de datos de propiedades a entidades Doctrine
- Gestión de disponibilidad, precios y características

### Arquitectura y Código

- **Doctrine ORM** — Entidades, relaciones (OneToOne, OneToMany, ManyToMany), repositorios y migraciones
- **Design Patterns** — Herencia, interfaces, inyección de dependencias
- **Collections** — Uso de Doctrine Collections para relaciones complejas
- **PHPUnit** — Tests unitarios

---

## Capturas de Pantalla

### Login del Panel de Administración

![Login](screens/login.jpg)

### Gestión Geográfica — Listado de Países

Listado con DataTables, búsqueda y acciones CRUD:

![Listado de países](screens/pais.jpg)

### Gestión Geográfica — Detalle / Edición de País

Formulario de edición multiidioma con CKEditor:

![Detalle de país](screens/pais_detalle.jpg)

### Propiedades Avantio — Listado

Listado de propiedades importadas desde Avantio:

![Listado de propiedades](screens/propiedades.jpg)

### Propiedades Avantio — Detalle / Edición

Ficha completa de propiedad con todos los campos sincronizados:

![Detalle de propiedad](screens/propiedades_detalle.jpg)

### API Platform — Documentación Swagger

Documentación automática de la API generada por API Platform:

![API Platform](screens/api_platform.jpg)

### API Platform — Endpoint GET

Respuesta JSON de un endpoint REST:

![API Platform GET](screens/api_platform_get.jpg)

### API REST — Postman

Testing de endpoints con Postman:

![Postman API GET](screens/postman-api-get-list.jpg)

---

## Arquitectura

```
┌──────────────────────────────────────────────────────────────────┐
│                         Cliente                                   │
│  ├── Navegador (Backend admin + Frontend público)                │
│  ├── API Platform (Swagger UI)                                   │
│  └── Postman / Apps externas (API REST)                          │
├──────────────────────────────────────────────────────────────────┤
│                      Symfony Application                          │
│                                                                   │
│  Controllers/          → Lógica de rutas (admin, front, API)     │
│  src/Entity/           → Entidades Doctrine (modelos de datos)   │
│  src/Repository/       → Repositorios (queries personalizadas)   │
│  src/Form/             → Formularios Symfony (validación)        │
│  helpers/              → Funciones auxiliares                     │
│  templates/            → Vistas Twig (admin + front)             │
│  translations/         → Archivos de traducción (ES, EN)         │
├──────────────────────────────────────────────────────────────────┤
│                      Doctrine ORM                                 │
│  ├── Entidades con relaciones (1:1, 1:N, N:M)                   │
│  ├── Migraciones (versionado de esquema)                         │
│  └── Collections                                                 │
├──────────────────────────────────────────────────────────────────┤
│                      Base de Datos                                │
│  └── MySQL 8 (avantio_cms)                                       │
└──────────────────────────────────────────────────────────────────┘
```

---

## Estructura del Proyecto

```
portvil-symfony-router-cms-avantio/
│
├── assets/                  # Assets frontend (JS, CSS — Webpack Encore)
├── bin/
│   └── console              # CLI de Symfony
├── config/
│   ├── packages/            # Configuración de bundles (doctrine, security, twig, api_platform...)
│   ├── routes/              # Definición de rutas
│   └── services.yaml        # Inyección de dependencias
│
├── helpers/                 # Funciones auxiliares / utilidades
│
├── migrations/              # Migraciones de Doctrine (versionado de schema)
│
├── public/
│   └── index.php            # Front controller de Symfony
│
├── screens/                 # Capturas de pantalla del proyecto
│   ├── login.jpg
│   ├── pais.jpg
│   ├── pais_detalle.jpg
│   ├── propiedades.jpg
│   ├── propiedades_detalle.jpg
│   ├── api_platform.jpg
│   ├── api_platform_get.jpg
│   └── postman-api-get-list.jpg
│
├── sql/
│   └── insert.sql           # Datos iniciales (países, regiones, etc.)
│
├── src/
│   ├── Controller/          # Controladores (Admin, Front, API)
│   ├── Entity/              # Entidades Doctrine
│   ├── Repository/          # Repositorios personalizados
│   ├── Form/                # Form Types de Symfony
│   └── ...                  # Servicios, Event Listeners, etc.
│
├── templates/               # Templates Twig
│   ├── admin/               # Vistas del panel de administración
│   ├── front/               # Vistas del frontend público
│   └── base.html.twig       # Layout base
│
├── tests/                   # Tests PHPUnit
├── translations/            # Archivos de traducción (messages.es.yaml, messages.en.yaml)
│
├── .env                     # Variables de entorno (DB, APP_SECRET, etc.)
├── .env.test                # Variables de entorno para testing
├── compose.yaml             # Docker Compose
├── compose.override.yaml    # Docker Compose overrides (desarrollo local)
├── composer.json             # Dependencias PHP
├── phpunit.xml.dist         # Configuración PHPUnit
└── symfony.lock             # Lock de recetas Symfony
```

---

## Modelo de Datos

### Jerarquía Geográfica

```
País (GeoCountry)
 └── Región (GeoRegion)
      └── Ciudad (GeoCity)
           └── Localidad (GeoLocality)
                └── Distrito (GeoDistrict)
```

### Relaciones entre Entidades

| Relación | Tipo | Descripción |
|---|---|---|
| País → Regiones | `OneToMany` | Un país tiene muchas regiones |
| Región → Ciudades | `OneToMany` | Una región tiene muchas ciudades |
| Ciudad → Localidades | `OneToMany` | Una ciudad tiene muchas localidades |
| Localidad → Distritos | `OneToMany` | Una localidad tiene muchos distritos |
| Propiedad → País | `ManyToOne` | Una propiedad pertenece a un país |
| Propiedad → Ciudad | `ManyToOne` | Una propiedad pertenece a una ciudad |
| Propiedad → Características | `ManyToMany` | Una propiedad tiene muchas características |

### Entidades Principales

| Entidad | Descripción | Campos clave |
|---|---|---|
| `GeoCountry` | País | nombre, código ISO, idioma, activo |
| `GeoRegion` | Región / Comunidad | nombre, país (FK), activo |
| `GeoCity` | Ciudad | nombre, región (FK), latitud, longitud |
| `GeoLocality` | Localidad | nombre, ciudad (FK) |
| `GeoDistrict` | Distrito / Barrio | nombre, localidad (FK) |
| `AvantioProperty` | Propiedad de alquiler | título, descripción, precio, huéspedes, habitaciones, baños, coordenadas, imágenes |
| `User` | Usuario administrador | email, password, roles |

---

## API REST y API Platform

### API Platform (Automática)

API Platform genera automáticamente endpoints REST con documentación Swagger para todas las entidades expuestas:

```
GET    /api/v1                              → Documentación Swagger UI
GET    /api/v1/dynamic_geocountries          → Listar países
POST   /api/v1/dynamic_geocountries          → Crear país
GET    /api/v1/dynamic_geocountries/{id}     → Detalle de país
PUT    /api/v1/dynamic_geocountries/{id}     → Actualizar país
DELETE /api/v1/dynamic_geocountries/{id}     → Eliminar país
```

### API REST Custom

Endpoints REST propios implementados en controladores Symfony:

```
GET    /api/pais/listar                      → Listar países (ES)
GET    /en/api/country/list                  → List countries (EN)

GET    /api/region/listar                    → Listar regiones
GET    /en/api/region/list                   → List regions

GET    /api/ciudad/listar                    → Listar ciudades
GET    /en/api/city/list                     → List cities

GET    /api/localidad/listar                 → Listar localidades
GET    /en/api/locality/list                 → List localities

GET    /api/distrito/listar                  → Listar distritos
GET    /en/api/district/list                 → List districts
```

---

## Rutas del Sistema

### Backend (Panel de Administración)

| Ruta (ES) | Ruta (EN) | Descripción |
|---|---|---|
| `/admin23111978/register` | — | Registro de usuario admin |
| `/admin23111978/login` | — | Login del panel |
| `/admin23111978/pais/listar` | `/en/admin23111978/country/list` | Listado de países |
| `/admin23111978/pais/editar/{id}?lang=es` | `/en/admin23111978/country/edit/{id}?lang=en` | Editar país |
| `/admin23111978/region/listar` | `/en/admin23111978/region/list` | Listado de regiones |
| `/admin23111978/ciudad/listar` | `/en/admin23111978/city/list` | Listado de ciudades |
| `/admin23111978/localidad/listar` | `/en/admin23111978/locality/list` | Listado de localidades |
| `/admin23111978/distrito/listar` | `/en/admin23111978/district/list` | Listado de distritos |
| `/admin23111978/propiedades-avantio/listar` | `/en/admin23111978/avantio-properties/list` | Listado de propiedades |
| `/admin23111978/propiedades-avantio/editar/{id}?lang=es` | `/en/admin23111978/avantio-properties/edit/{id}?lang=en` | Editar propiedad |

### Frontend (Público)

| Ruta (ES) | Ruta (EN) | Descripción |
|---|---|---|
| `/pais/listar` | `/en/country/list` | Listado público de países |

---

## Requisitos

- **PHP** >= 8.1 (con extensiones: `intl`, `pdo_mysql`, `soap`, `mbstring`)
- **Composer** >= 2.x
- **MySQL** 8.x o MariaDB 10.x
- **Symfony CLI** (recomendado para desarrollo)
- **Node.js** + npm (para compilar assets con Webpack Encore)
- **Docker** y Docker Compose (opcional)

---

## Instalación

### 1. Clonar el Repositorio

```bash
git clone git@github.com:david-berruezo/portvil-symfony-router-cms-avantio.git
cd portvil-symfony-router-cms-avantio
```

### 2. Instalar Dependencias PHP

```bash
composer install
```

### 3. Crear la Base de Datos

```sql
CREATE DATABASE avantio_cms CHARACTER SET utf8 COLLATE utf8_general_ci;
```

### 4. Configurar Conexión a MySQL

Editar el archivo `.env` con las credenciales de tu base de datos:

```env
DATABASE_URL="mysql://usuario:password@127.0.0.1:3306/avantio_cms?serverVersion=8&charset=utf8"
```

### 5. Generar el Schema con Doctrine

```bash
php bin/console doctrine:schema:update --force --dump-sql
```

### 6. Importar Datos Iniciales

```bash
mysql -u usuario -p avantio_cms < sql/insert.sql
```

### 7. Registrar un Usuario Admin

Acceder a la URL de registro:

```
http://localhost/public/admin23111978/register
```

### 8. Iniciar la Aplicación

```bash
# Con Symfony CLI (recomendado)
symfony server:start

# O con Docker Compose
docker compose up -d
```

### 9. Acceder al Panel

```
http://localhost/public/admin23111978/login
```

---

## Testing

El proyecto incluye tests unitarios con PHPUnit:

```bash
# Ejecutar todos los tests
php bin/phpunit

# Ejecutar un test específico
php bin/phpunit tests/NombreDelTest.php

# Con cobertura de código
php bin/phpunit --coverage-html var/coverage
```

---

## Tecnologías

| Tecnología | Uso | Porcentaje |
|---|---|---|
| **JavaScript** | Frontend interactivo (DataTables, CKEditor, validaciones) | 68.1% |
| **CSS** | Estilos del panel admin y frontend | 13.3% |
| **PHP** | Backend Symfony (controllers, entities, repositories, API) | 11.5% |
| **HTML** | Estructura base | 5.2% |
| **SCSS** | Preprocesador de estilos | 1.1% |
| **Twig** | Motor de plantillas Symfony | 0.6% |

### Stack Técnico

| Componente | Tecnología |
|---|---|
| **Framework** | Symfony 6.x |
| **ORM** | Doctrine ORM |
| **Base de datos** | MySQL 8 |
| **API** | API Platform + API REST custom |
| **Templates** | Twig |
| **Formularios** | Symfony Forms + Validations |
| **Autenticación** | Symfony Security (contra MySQL) |
| **Editor WYSIWYG** | CKEditor |
| **Tablas** | DataTables |
| **Testing** | PHPUnit |
| **Contenedores** | Docker Compose |
| **Assets** | Webpack Encore |
| **Internacionalización** | Symfony Translation (ES / EN) |

---

## Recursos

### Symfony

- [Symfony — Documentación oficial](https://symfony.com/doc/current/index.html)
- [Doctrine ORM](https://www.doctrine-project.org/projects/orm.html)
- [Symfony Forms](https://symfony.com/doc/current/forms.html)
- [Symfony Security](https://symfony.com/doc/current/security.html)
- [Symfony Translation](https://symfony.com/doc/current/translation.html)

### API

- [API Platform — Documentación](https://api-platform.com/docs/)
- [Symfony REST API](https://symfony.com/doc/current/the-fast-track/en/26-api.html)

### Avantio

- [Avantio — Sitio oficial](https://www.avantio.com/es/)
- [Avantio — API Integrations](https://www.avantio.com/api-integrations/)

### Herramientas

- [DataTables](https://datatables.net/)
- [CKEditor](https://ckeditor.com/)
- [PHPUnit](https://phpunit.de/)
- [Docker Compose](https://docs.docker.com/compose/)

### Repositorios Relacionados

- [wprentals-ws-avantio](https://github.com/david-berruezo/wprentals-ws-avantio) — Plugin WordPress para sincronización con Avantio
- [llafranc-villas](https://github.com/david-berruezo/llafranc-villas) — Child-theme WP Rentals para [llvillas.com](https://www.llvillas.com/)
- [wp-rentals-theme-modified](https://github.com/david-berruezo/wp-rentals-theme-modified) — Tema WP Rentals modificado

---

## Autor

**David Berruezo** — Software Engineer | Fullstack Developer

- GitHub: [@david-berruezo](https://github.com/david-berruezo)
- Website: [davidberruezo.com](https://www.davidberruezo.com)
