#!/bin/sh

if [ -z "$1" ];then
	echo "please input param"
	exit
else
	docker logs -tf --tail 10 $1
fi