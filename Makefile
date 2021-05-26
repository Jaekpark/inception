
PATH = /home/jaekpark/inception
COMMAND = cd ./srcs && docker-compose
SETUP_SH = ./srcs/requirements/tools/setup.sh
WP_PATH = /home/jaekpark/data/wp
DB_PATH = /home/jaekpark/data/db

all: host volume up

re: fclean all

host:
	$(SETUP_SH) append

volume:
	mkdir -p $(WP_PATH)
	mkdir -p $(DB_PATH)

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

