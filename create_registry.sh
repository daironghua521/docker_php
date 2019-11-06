#!/bin/sh
#本地注册中心（浏览器打开：http://192.168.0.111:5000/v2/）
docker run -d -p 5000:5000 -v ~/registry:/var/lib/registry --restart=always --name registry --net default_newwork --ip 172.25.0.5 registry