FROM php:7.3.6-fpm
MAINTAINER dairh "342751099@qq.com"

ENV TIMEZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone


RUN mkdir -p /var/log/php /var/www/html
RUN cp /etc/apt/sources.list /etc/apt/sources.list_back
ADD ./sources.list /etc/apt/sources.list

RUN echo "nameserver 8.8.8.8" >> /etc/resolv.conf && echo "nameserver 8.8.4.4" >> /etc/resolv.conf && echo "nameserver 114.114.114.114" >> /etc/resolv.conf 

RUN apt-get clean && apt-get update -y && apt-get install -y wget curl git vim tar bzip2 unzip gcc g++ make procps autoconf cmake net-tools hostname man automake iputils-ping iproute2
RUN apt-get install -y libfreetype6-dev libjpeg-dev libjpeg62-turbo-dev libpng-dev
RUN apt-get install -y openssl libevent-dev libssh-dev libnghttp2-dev
RUN apt-get install -y libhiredis-dev libxml2 libxml2-dev bzip2
RUN apt-get install -y libzip-dev libmcrypt-dev
RUN apt-get install -y supervisor
RUN apt-get install cron rsyslog -y && service cron start && service rsyslog start && cd /usr/lib/ssl/ && wget -c http://curl.haxx.se/ca/cacert.pem

ADD ./etc/php/php.ini /usr/local/etc/php/php.ini
COPY ./ext /tmp/

RUN docker-php-ext-install sockets && docker-php-ext-enable sockets

#sed -i '$a\extension=sodium.so' /usr/local/etc/php/php.ini
RUN apt-get install -y libsodium-dev
RUN cd /tmp && mkdir libsodium \
    && tar -xf libsodium-2.0.21.tgz -C libsodium --strip-components=1 \
    && ( cd libsodium && phpize && ./configure && make ${MC} && make install )

RUN apt-get install -y libmpdec-dev 
RUN cd /tmp && mkdir decimal \
    && tar -xf decimal-1.3.0.tgz -C decimal --strip-components=1 \
    && ( cd decimal && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable decimal
	
RUN cd /tmp && mkdir timezonedb \
    && tar -xf timezonedb-2019.1.tgz -C timezonedb --strip-components=1 \
    && ( cd timezonedb && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable timezonedb
	
RUN cd /tmp && mkdir inotify \
    && tar -xf inotify-2.0.0.tgz -C inotify --strip-components=1 \
    && ( cd inotify && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable inotify

RUN cd /tmp && tar zxvf ImageMagick.tar.gz \
	&& ( cd ImageMagick-7.0.8-61 && ./configure --prefix=/usr/local/imagemagick && make ${MC} && make install ) \
	&& export PKG_CONFIG_PATH=/usr/local/imagemagick/lib/pkgconfig/
	
RUN cd /tmp && mkdir imagick && tar -xf imagick-3.4.4.tgz -C imagick --strip-components=1 \ 
	&& ( cd imagick && phpize && ./configure --with-php-config=/usr/local/bin/php-config --with-imagick=/usr/local/imagemagick && make ${MC} && make install ) \
	&& docker-php-ext-enable imagick

RUN cd /tmp && mkdir mongodb \
    && tar -xf mongodb-1.5.5.tgz -C mongodb --strip-components=1 \
    && ( cd mongodb && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable mongodb
	
RUN cd /tmp && mkdir redis \
    && tar -xf redis-4.3.0.tgz -C redis --strip-components=1 \
    && ( cd redis && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable redis

#look swoole info：php --ri swoole
RUN cd /tmp && mkdir swoole \
    && tar -xf swoole-4.4.4.tgz -C swoole --strip-components=1 \
    && ( cd swoole && phpize && ./configure --enable-coroutine --enable-openssl --enable-http2 --enable-async-redis --enable-sockets --enable-mysqlnd && make ${MC} && make install ) \
	&& docker-php-ext-enable swoole

RUN apt-get install -y librabbitmq-dev
RUN cd /tmp && mkdir amqp \
    && tar -xf amqp-1.9.4.tgz -C amqp --strip-components=1 \
    && ( cd amqp && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable amqp

RUN apt-get install -y librdkafka-dev
RUN cd /tmp && mkdir rdkafka \
    && tar -xf rdkafka-3.1.0.tgz -C rdkafka --strip-components=1 \
    && ( cd rdkafka && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable rdkafka

RUN cd /tmp && mkdir stomp \
    && tar -xf stomp-2.0.2.tgz -C stomp --strip-components=1 \
    && ( cd stomp && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable stomp
	
RUN cd /tmp && mkdir hprose \
    && tar -xf hprose-1.6.8.tgz -C hprose --strip-components=1 \
    && ( cd hprose && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable hprose

RUN apt-get install -y libtool
RUN cd /tmp && tar -xf apache-zookeeper-3.5.5.tar.gz \
    && ( cd apache-zookeeper-3.5.5/zookeeper-client/zookeeper-client-c/ && autoreconf -if && ACLOCAL="aclocal -I /usr/local/share/aclocal" autoreconf -if && ./configure --prefix=/usr/local/libzookeeper/ --without-cppunit && make ${MC} && make install )
	
RUN cd /tmp && mkdir zookeeper \
    && tar -xf zookeeper-0.6.4.tgz -C zookeeper --strip-components=1 \
    && ( cd zookeeper && phpize && ./configure --with-libzookeeper-dir=/usr/local/libzookeeper/ && make ${MC} && make install ) \
	&& docker-php-ext-enable zookeeper
	
RUN cd /tmp && mkdir mcrypt \
    && tar -xf mcrypt-1.0.2.tgz -C mcrypt --strip-components=1 \
    && ( cd mcrypt && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable mcrypt
	
RUN cd /tmp && mkdir event \
    && tar -xf event-2.5.3.tgz -C event --strip-components=1 \
    && ( cd event && phpize && ./configure && make ${MC} && make install ) \
	&& docker-php-ext-enable event
	
RUN cd /tmp && rm -rf *.tgz && rm -rf *.tar.gz	

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
	&& docker-php-ext-install posix \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install pcntl
	
ENV COMPOSER_HOME /opt/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com


ADD ./supervisord/supervisord.conf /etc/supervisor/
ADD ./supervisord/conf.d/php-fpm.ini /etc/supervisor/conf.d/
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

WORKDIR /var/www/html
RUN usermod -u 1000 www-data

RUN docker-php-ext-enable gd zip posix pdo_mysql opcache mysqli bcmath pcntl

COPY ./start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]