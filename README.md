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
