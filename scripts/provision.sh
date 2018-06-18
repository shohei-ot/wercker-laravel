#!/bin/bash
apt-get -o Acquire::Check-Valid-Until=false update \
&& apt-get install -y \
wget \
curl \
lsb-release \
apt-transport-https \
gnupg2 \
vim \
sudo \
git \
libpng-dev \
libfreetype6-dev \
libtool \
pngquant \
autoconf \
automake \
sysstat \
openssl \
ca-certificates \
&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
&& apt-get -o Acquire::Check-Valid-Until=false update \
&& bash -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list' \
&& apt-get -o Acquire::Check-Valid-Until=false update \
&& apt-get -f install -y php7.2 php7.2-zip php7.2-curl php7.2-mbstring php7.2-xml php7.2-pgsql \
&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
&& bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt stretch-pgdg main" >> /etc/apt/sources.list' \
&& wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add - \
&& apt-get -o Acquire::Check-Valid-Until=false update \
&& apt-get -f install -y postgresql-9.6 postgresql-contrib-9.6 postgresql-client-9.6 postgresql-9.6-postgis-2.3 \
&& sudo -u postgres /etc/init.d/postgresql start \
&& sudo -u postgres psql --command "CREATE USER homestead WITH SUPERUSER PASSWORD 'secret';" \
&& sudo -u postgres psql --command "CREATE DATABASE homestead WITH OWNER homestead;" \
&& sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" homestead \
&& curl -sL https://deb.nodesource.com/setup_8.x | bash - \
&& apt-get install -y --no-install-recommends nodejs \
&& npm i -g npm@6 \
&& npm i -g yarn
