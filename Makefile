# Nombre de usuario (ajústalo con tu login real)
LOGIN = ediaz--c
PROJECT = inception

SRC_DIR = srcs
ENV_FILE = $(SRC_DIR)/.env
COMPOSE = docker-compose --env-file $(ENV_FILE) -f $(SRC_DIR)/docker-compose.yml -p $(PROJECT)

DATA_DIR = /home/$(LOGIN)/data
	
# Ejecuta docker-compose up con build
up: create_dir
	$(COMPOSE) up -d --build

create_dir:
	@mkdir -p $(DATA_DIR)/wordpress
	@mkdir -p $(DATA_DIR)/mariadb

# Detiene los contenedores
stop:
	$(COMPOSE) stop

# Elimina todo: contenedores, volúmenes, imágenes
clean:
	$(COMPOSE) down --volumes --rmi all
	rm -rf $(DATA_DIR)/db $(DATA_DIR)/wp

# Limpia y reconstruye
rebuild: clean up

# Verifica estado de los contenedores
status:
	$(COMPOSE) ps

open_wordpress:
	docker exec -it wordpress bash

open_mariadb:
	docker exec -it mariadb bash

open_nginx:
	docker exec -it nginx bash