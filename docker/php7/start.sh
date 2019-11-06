#/bin/bash

echo 'Start the command'

#----------------------------------------------------
#
#*PHP重载
#kill -USR2 $(ps -aux | grep php-fpm|awk '{print $2}')

docker-php-ext-enable mongodb redis swoole amqp rdkafka stomp hprose mcrypt inotify timezonedb decimal event zookeeper sockets imagick
docker-php-ext-enable libsodium
service rsyslog start && service cron start