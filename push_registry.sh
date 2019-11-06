#/bin/bash

docker tag php-fpm 172.25.0.5:5000/php73 && docker push 172.25.0.5:5000/php73
docker tag nginx 172.25.0.5:5000/nginx && docker push 172.25.0.5:5000/nginx
docker tag mysql 172.25.0.5:5000/mysql && docker push 172.25.0.5:5000/mysql
docker tag redis 172.25.0.5:5000/redis && docker push 172.25.0.5:5000/redis