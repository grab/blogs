up: docker rails db db_other
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

down:
	docker-compose down

ssh:
	docker-compose exec web bash

.PHONY: docker db db_other down rails ssh
