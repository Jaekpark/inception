
COMMAND = cd ./srcs && docker-compose
SETUP_SH = ./srcs/requirements/tools/setup.sh
WP_PATH = /home/jaekpark/data/wp
DB_PATH = /home/jaekpark/data/db

all: host volume up

re: fclean all

host:
	@echo " - Make host config"
	@./srcs/requirements/tools/setup.sh append
	@echo " - OK"

volume:
	@echo " - Make volume directory : /home/jaekpark/data"
	@mkdir -p /home/jaekpark/data/db
	@mkdir -p /home/jaekpark/data/wp
	@echo " - OK"

volume_del:
	@echo " - delete volume directory"
	@sudo rm -rf /home/jaekpark/data/db
	@sudo rm -rf /home/jaekpark/data/wp
	@echo " - OK"

host_del:
	@echo " - delete host config"
	@./srcs/requirements/tools/setup.sh delete
	@echo " - OK"

up:
	@echo " - Build application"
	@$(COMMAND) up --build -d
	@echo " - OK"

down:
	@echo " - Remove application"
	@$(COMMAND) down
	@echo " - OK"

rmi:
	@echo " - Remove docker images"
	@$(COMMAND) down --rmi all
	@echo " - OK"

start:
	@echo " - start application"
	@$(COMMAND) start
	@echo " - OK"

stop:
	@echo " - stop application"
	@$(COMMAND) stop
	@echo " - OK"

ps:
	$(COMMAND) ps

restart: stop start

clean: down

fclean: rmi host_del volume_del
	docker system prune --volumes --all --force
.PHONNY: all re host volume up down rmi start stop ps restart clean fclean volume_del host_del

