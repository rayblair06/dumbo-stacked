# QoL commands

build:
	@docker-compose -f docker-compose.yml build

start:
	@docker-compose up -d --build app

migrate:
	@docker exec app php vendor/bin/phinx migrate

seed:
	@docker exec app php vendor/bin/phinx seed:run

composer:
	@docker-compose run --rm composer $(filter-out $@,$(MAKECMDGOALS))

%:
    @:
