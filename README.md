# docker_php
快速构建单机版php7+nginx+mysql+redis+mongo环境

## docker_php简介

1.  PHP集成常用的mongodb redis swoole amqp rdkafka stomp hprose mcrypt inotify timezonedb decimal event zookeeper sockets imagick libsodium扩展
2.  不使用pecl进行初始化扩展，这个实在太慢了；直接使用本地扩展安装
3.  环境集成nginx、mysql、redis、mongo、cadvisor
4.  加入常用的脚本

## 安装使用（Linux环境下）

1.  创建网卡
sh create_network.sh

2. 构建容器
docker-compose up 或 docker-compose up -d

3. 关闭容器
docker-compose down

## docker_php交流群
QQ群： [![加入QQ群](https://img.shields.io/badge/860141333-blue.svg)](https://jq.qq.com/?_wv=1027&k=5LnVfBr)  点击按钮入群。
