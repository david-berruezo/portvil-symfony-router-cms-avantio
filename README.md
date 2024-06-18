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
http://localhosth/portvil-symfony-router-cms-avantio/public/admin23111978/login
or
http://localhosth/portvil-symfony-router-cms-avantio/public/admin23111978/
```

![Screenshot](/screens/login.jpg)<br>


#### 06.- Import sql Insert file

```console
import sql/insert.sql file into MySQL
```

#### 07.- List countries and others

![Screenshot](/screens/pais.jpg)<br>

#### 08.- Detaiil countries and others

![Screenshot](/screens/pais_detalle.jpg)<br>

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
##### 12.- Twig templates
##### 13.- Datatables
##### 14.- cKeditor
##### 15.- Small Integration 
##### 16.- PhpUnit Unit Testing
