LOGIN=bmoretti
VOLUMES_PATH=/home/${LOGIN}/data

export VOLUMES_PATH

all: setup up

host:
	@if ! grep -q "${LOGIN}.42.fr" /etc/hosts; then \
		sudo sed -i "2i\127.0.0.1\t${LOGIN}.42.fr" /etc/hosts; \
	fi

	@if [! -f ./srcs/.env ]; then \
		wget -O ./srcs/.env https://raw.githubusercontent.com/brmoretti/42_Inception/main/srcs/.env; \
	fi

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
	sudo rm -rf /home/${LOGIN}

setup: host
	sudo mkdir -p ${VOLUMES_PATH}/mariadb
	sudo mkdir -p ${VOLUMES_PATH}/wordpress

.PHONY: all up build build-no-cache down ps ls clean fclean setup host

