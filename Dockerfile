FROM php:7.0-apache
RUN apt-get update && \
apt-get upgrade && \
apt-get --no-cache add \
    bash \
    git \
    ca-certificates \
    curl \
    openssh \
    tzdata \
    gnu-libiconv@testing
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html substitute expires
RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "hirak/prestissimo:^0.3" 
