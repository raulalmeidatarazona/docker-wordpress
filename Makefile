up:
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build

logs:
	docker-compose logs -f

wp:
	docker-compose exec wpcli wp $(filter-out $@,$(MAKECMDGOALS))

.PHONY: up down build logs wp
