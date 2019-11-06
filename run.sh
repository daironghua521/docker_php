#!/bin/sh

docker-compose build && docker-compose -f docker-compose.yml up -d && service docker restart && docker-compose -f docker-compose.yml up -d