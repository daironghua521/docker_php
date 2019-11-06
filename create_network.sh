#!/bin/sh
subnet="172.25.0.0/16"
gateway="172.25.0.1"
docker network create default_newwork --subnet=$subnet --gateway=$gateway
echo "network $subnet created"