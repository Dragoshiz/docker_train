all:
	./srcs/requirements/wordpress/tools/make_dir.sh 
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down

re:
	@docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d --build

clean: down
	@docker system prune -a

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	rm -rf /home/${USER}/data


.PHONY : all build down re clean fclean