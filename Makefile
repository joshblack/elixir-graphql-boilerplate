.PHONY: up
up:
	@echo "Starting Development-related services"
	docker-compose -f ci/development/docker-compose.yml up -d

.PHONY: down
down:
	@echo "Stop Development-related services"
	docker-compose -f ci/development/docker-compose.yml down --remove-orphans

.PHONY: migrate
migrate:
	mix ecto.create
	mix ecto.migrate
	mix run priv/repo/seeds.exs

.PHONY: seed-dev
seed-dev:
	mix ecto.drop
	mix ecto.create
	mix ecto.migrate
	mix run priv/repo/seeds.exs

.PHONY: seed
seed:
	docker-compose -f ci/development/docker-compose.yml exec web mix ecto.migrate --all
	docker-compose -f ci/development/docker-compose.yml exec web mix run priv/repo/seeds.exs

.PHONY: setup
setup:
	docker-compose -f ci/test/docker-compose.yml up -d

.PHONY: schema
schema:
	 mix absinthe.schema.json ${OUTPUT_DIR} --pretty
