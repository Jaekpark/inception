
COMMAND = cd ./srcs && docker-compose
SETUP_SH = ./srcs/requirements/tools/setup.sh
WP_PATH = /home/jaekpark/data/wp
DB_PATH = /home/jaekpark/data/db

all: host volume up

re: fclean all

host:
	@./srcs/requirements/tools/setup.sh append

volume:
	@mkdir -p /home/jaekpark/data/db
	@mkdir -p /home/jaekpark/data/wp

host_del:
	@./srcs/requirements/tools/setup.sh delete

up:
	$(COMMAND) up --build -d

down:
	$(COMMAND) down

rmi:
	$(COMMAND) down --rmi all

start:
	$(COMMAND) start

stop:
	$(COMMAND) stop

ps:
	$(COMMAND) ps

restart: stop start

clean: down rmi

fclean: clean
	docker volume prune --force
	$(SETUP_SH) delete

.PHONNY: all re host volume up down rmi start stop ps restart clean fclean

