#!/bin/sh
rm ./tmp/pids/server.pid
docker-compose build
docker-compose up -d