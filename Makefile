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

wp-install:
	docker-compose exec wpcli sh -c "cd /var/www/html/wp-content/themes/gemini-theme && npm install"

wp-dev:
	docker-compose exec wpcli sh -c "cd /var/www/html/wp-content/themes/gemini-theme && npm run dev"

dev:
	$(MAKE) build
	$(MAKE) up
	$(MAKE) wp-install
	$(MAKE) wp-dev

.PHONY: up down build logs wp wp-install wp-dev dev
