all:
	mkdir -p /home/jgoikoet/data/mariadb
	mkdir -p /home/jgoikoet/data/wordpress
	docker-compose -f srcs/docker-compose.yml  up -d --build
down:
	docker-compose -f srcs/docker-compose.yml  down
clean: down
	sudo rm -rf /home/jgoikoet/data/mariadb
	sudo rm -rf /home/jgoikoet/data/wordpress
	yes | docker system prune -a
.PHONY: all down clean