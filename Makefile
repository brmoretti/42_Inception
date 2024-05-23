all: host up

host:
	@if ! grep -qFx "127.0.0.1 ${USER}.42.fr" /etc/hosts; then \
		sudo sed -i '2i\127.0.0.1\t${USER}.42.fr' /etc/hosts; \
	fi

	export DOMAIN=bmoretti.42.fr

DOCKER_COMPOSE_FILE=./srcs/docker-compose.yml
DOCKER_COMPOSE_COMMAND=docker-compose -f $(DOCKER_COMPOSE_FILE)

up: build
	$(DOCKER_COMPOSE_COMMAND) up -d

build:
	$(DOCKER_COMPOSE_COMMAND) build

build-no-cache:
	$(DOCKER_COMPOSE_COMMAND) build --no-cache

down:
	$(DOCKER_COMPOSE_COMMAND) down

ps:
	$(DOCKER_COMPOSE_COMMAND) ps

ls:
	docker volume ls

clean:
	$(DOCKER_COMPOSE_COMMAND) down --rmi all --volumes

fclean: clean
	docker system prune --force --all --volumes


