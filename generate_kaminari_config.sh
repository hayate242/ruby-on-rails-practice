#!/bin/sh
docker-compose exec web bundle exec rails g kaminari:config
docker-compose exec web bundle exec rails g kaminari:views bootstrap4