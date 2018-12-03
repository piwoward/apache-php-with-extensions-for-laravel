FROM php:7.2-apache
RUN apt-get update 
RUN apt-get install -y gnupg && apt-key update -y && apt-get upgrade -y
RUN apt-get install -y automake bash git mc ca-certificates curl zip zlib1g-dev libtool libpng-dev libjpeg-dev libfreetype6-dev software-properties-common mysql-client mc htop
RUN a2enmod proxy proxy_ajp proxy_http rewrite deflate headers proxy_balancer proxy_connect proxy_html substitute expires vhost_alias
RUN docker-php-ext-install pdo pdo_mysql zip mysqli gd opcache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    composer global require "hirak/prestissimo:^0.3" 

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash
RUN apt-get install -y nodejs
# ssh-dss
RUN export GIT_SSH_COMMAND='ssh -oHostKeyAlgorithms=+ssh-dss'
