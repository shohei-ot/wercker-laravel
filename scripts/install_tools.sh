#!/bin/bash
apt-get -o Acquire::Check-Valid-Until=false update \
&& apt-get install -y libpng-dev libtool pngquant autoconf automake sysstat openssl ca-certificates