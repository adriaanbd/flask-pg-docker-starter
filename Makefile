build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

test: up
	docker-compose run --rm --no-deps --entrypoint=pytest api /tests/

dbsh:
	docker-compose exec db psql -U postgres

api:
	docker-compose exec api bash

black:
	docker-compose exec api black src

blackdiff:
	docker-compose exec api black src --diff

isortdiff:
	docker-compose exec api isort src --diff

quality:
	docker-compose exec api flake8 src
	docker-compose exec api black src --check
	docker-compose exec api isort src --check-only
