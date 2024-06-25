## Symfony Cms | Not finish

### Installation 

#### 01.- Download from Github 

```console
git@github.com:david-berruezo/portvil-symfony-router-cms-avantio.git 
```

#### 02.- Install Dependencies

```console
composer install
```

#### 03.- Create database MySQL

```console
CREATE DATABASE avantio_cms CHARACTER SET utf8 COLLATE utf8_general_ci
```

#### 04.- Change credentials .env file about your MySQL connection

```console
DATABASE_URL="mysql://root:Berruezin23@127.0.0.1:3306/avantio_cms?serverVersion=8&charset=utf8"
```

#### 05.- Export database from Doctrine to your MySQL

```console
php bin/console doctrine:schema:update --force --dump-sql
```

#### 06.- Registration admin user

```console
http://localhost/public/admin23111978/register
```

#### 07.- Login admin user

```console
http://localhost/public/admin23111978/login
```

![Screenshot](/screens/login.jpg)<br>


#### 06.- Import sql Insert file

```console
import sql/insert.sql file into MySQL
```

#### 07.- List countries and others (Regions, Cities, Localities, Districts) (BACKEND)

![Screenshot](/screens/pais.jpg)<br>

```console
http://localhost/public/admin23111978/pais/listar
http://localhost/public/en/admin23111978/country/list

http://localhost/public/admin23111978/region/listar
http://localhost/public/admin23111978/en/region/list

http://localhost/public/admin23111978/ciudad/listar
http://localhost/public/en/admin23111978/city/list

http://localhost/public/admin23111978/localidad/listar
http://localhosth/public/en/admin23111978/locality/list

http://localhost/public/admin23111978/distrito/listar
http://localhost/public/en/admin23111978/district/list
```
#### 07.1.- List countries (FRONTEND)
```console
http://localhost/public/pais/listar
http://localhost/public/en/country/list
```

#### 08.- Detail countries and others (Regions, Cities, Localities, Districts)

![Screenshot](/screens/pais_detalle.jpg)<br>

```console
http://localhost/public/admin23111978/pais/editar/1111?lang=es
http://localhost/public/en/admin23111978/country/edit/1222?lang=en
```

#### 07.- List properties

![Screenshot](/screens/propiedades.jpg)<br>

```console
http://localhost/public/admin23111978/propiedades-avantio/listar
http://localhost/public/en/admin23111978/avantio-properties/list

```

#### 08.- Detail property

![Screenshot](/screens/propiedades_detalle.jpg)<br>

```console
http://localhost/public/admin23111978/propiedades-avantio/editar/371247111?lang=es
http://localhost/public/en/admin23111978/avantio-properties/edit/371247222?lang=en
```

#### 08.- Api Platform
```console
http://localhost/public/api/v1
```
![Screenshot](/screens/api_platform.jpg)<br>

#### 08.- Api Platform | Rest (Get | Post | Put | Delete)
```console
http://localhost/public/api/v1/dynamic_geocountries
```

![Screenshot](/screens/api_platform_get.jpg)<br>


#### 08.- Api Restful (Normal)
```console
http://localhost/public/api
```

#### 08.- Api Restful GET List Pais , Region , Ciudad , Localidad , Distrito
```console
http://localhost/public/api/pais/listar
http://localhost/public/en/api/country/list
```


#### 08.- Check Postman GET List Pais , Region , Ciudad , Localidad , Distrito endpoint
![Screenshot](/screens/postman-api-get-list.jpg)<br>


#### Summary 

##### 01.- Entities
##### 02.- Relationship OneToOne, OneToMany, ManyToMany
##### 03.- Collections
##### 04.- Forms
##### 05.- Validations
##### 06.- Repositories
##### 07.- Helpers
##### 08.- Design Patterns , Inheritance , Interfaces , Injection Dependency 
##### 09.- Crud
##### 10.- Api , Api Platform Rest
##### 11.- Security Validation against MySQL authentication
##### 12.- Twig templates (Reflection to read dynamic property objects)
##### 13.- Datatables
##### 14.- cKeditor
##### 15.- Small Integration 
##### 16.- PhpUnit Unit Testing
