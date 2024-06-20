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

#### 07.- List countries and others (Regions, Cities, Localities, Districts)

![Screenshot](/screens/pais.jpg)<br>

#### 08.- Detail countries and others (Regions, Cities, Localities, Districts)

![Screenshot](/screens/pais_detalle.jpg)<br>


#### 07.- List properties

![Screenshot](/screens/propiedades.jpg)<br>

#### 08.- Detail property

![Screenshot](/screens/propiedades_detalle.jpg)<br>

#### 08.- Api Platform
```console
http://localhost/public/api
```
![Screenshot](/screens/api_platform.jpg)<br>

#### 08.- Api Platform | Rest (Get | Post | Put | Delete)
```console
http://localhost/public/api/dynamic_geocountries
```
![Screenshot](/screens/api_platform_get.jpg)<br>


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
