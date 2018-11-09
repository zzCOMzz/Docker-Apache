FROM php:7.2-apache

WORKDIR /root/composer-install

RUN ["curl","-o","composer-installer","https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer"]
RUN ["chmod","u+x","composer-installer"]
RUN ["php","composer-installer"]
RUN ["mv","composer.phar","/usr/local/bin/composer"]
RUN apt-get update
RUN apt-get install -y git


RUN ["docker-php-ext-install","pdo","pdo_mysql","mysqli","json","mbstring"]
RUN ["a2enmod","rewrite"]


WORKDIR /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]
