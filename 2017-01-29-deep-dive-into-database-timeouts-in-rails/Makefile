# Copyright 2018 Grabtaxi Holdings PTE LTE (GRAB), All rights reserved.
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file

up: docker rails db db_other db_other_proxy
	@echo "ready"

docker:
	docker-compose up -d

rails:
	docker-compose exec web bundle

db: rails
	docker-compose exec web ./wait-for-it db_main:3306 -t 0
	docker-compose exec web bundle exec rake db:setup

db_other: db
	docker-compose exec db_other sh -c 'mysql < /seed/setup.sql'

db_other_proxy:
	toxiproxy-cli create db_other_proxy -l 0.0.0.0:3306 -u db_other:3306

enable_db:
	toxiproxy-cli toxic remove db_other_proxy --toxicName timeout

disable_db:
	toxiproxy-cli toxic add db_other_proxy --toxicName timeout --type timeout --attribute=timeout=100000

down:
	docker-compose down

ssh:
	docker-compose exec web bash

.PHONY: docker db db_other db_other_proxy enable_db disable_db down rails ssh
