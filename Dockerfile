FROM php:7.0-apache
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html substitute expires
RUN docker-php-ext-install pdo pdo_mysql
