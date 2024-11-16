# Project: C2W API2 Application
# Maintaner: David H Tekwie <yamis.spiriteagle@gmail.com>
# Date: November 2024
# Caution: Speak to maintainer before executing these commands.
up:
	docker-compose up -d --build
down:
	docker-compose down --volumes
restart:
	@make down
	@make up
clean-up:
	docker-compose build --no-cache
	docker-compose up -d
migrate:
	docker-compose exec app python manage.py migrate