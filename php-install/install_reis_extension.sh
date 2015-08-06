#!/bin/bash

if [ `uname -m` == "x86_64" ];then
machine=x86_64
else
machine=i686
fi

#mongo
tar -xzvf redis-2.2.5.tgz
cd redis-2.2.5
/alidata/server/php/bin/phpize
./configure --enable-redis --with-php-config=/alidata/server/php/bin/php-config
CPU_NUM=$(cat /proc/cpuinfo | grep processor | wc -l)
if [ $CPU_NUM -gt 1 ];then
    make -j$CPU_NUM
else
    make
fi
make install
cd ..
echo "extension=redis.so" >> /alidata/server/php/etc/php.ini

