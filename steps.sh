# build image from current folder
docker build --tag=mvukichello .

# list images
docker image ls
# list containers
docker container ls

# set proxies, set proxy server, replace host:port with values for your servers
ENV http_proxy host:port
ENV https_proxy host:port

# expose ports
docker run -p <port_host>:<port_container> -p <port_host>:<port_container> 

# run image in container and map exposed port 80 to localhost port 40000
docker run -p 4000:80 mvukichello
# stop this container
docker container stop <container_id>

# run in detached mode
docker run -d -p 4000:80 mvukichello

# stop container
docker container stop <container_id>

# remove container
docker container rm <container_id>
docker container rm <container_name>

# remove image
docker rmi <image_id>

# remove all <none> images
docker image prune
# remove images that don't have at least one associated container
docker image prune -a

#run docker compose file
docker-compose up -d

# create docker container from mysql image and set password to 'password' and create database 'spring_test'
docker run --name=mysql-db -d -p 3306:3306 --env="MYSQL_ROOT_PASSWORD=password" --env="MYSQL_DATABASE=spring_test" mysql
docker run --name=spring-server -d -p 8080:8080 --link mysql_db:mysql <server_image_name>

# add variables to run command
docker run --env="<key> = <value>" --env="<key> = <value>"
docker run -e <key>=<value> -e <key>=<value>
docker run --env-file <file_path>

# run command inside docker container
# -> -t opens pseudo tty
# -> -i keep STDIN open (interactive)
docker exec -ti <container_name> <command>
# run bash in container 'mysql-server'
docker exec -ti mysql-server bash

######
###### Advanced
######
# tag local image
docker tag <local_image_name>:<tag> <username>/<repository>:<tag>
# push iage to public repository
docker push <username>/<repository>:<tag>

# init swarm
docker swarm init

# run service defined in deploy-compose.yml file
# after changing .yml file, run this exact commant to update stack
docker stack deploy -c deploy-compose.yml <app_name>

# list all services
docker service ls
#list all services for specific stack
docker stack services <app_name>

### single container running in a service is called a task

# list services for specific task, (eg. docker service ps getstartedlab_web)
docker service ps <app_name>:<service_name>

# take down the app
docker stack rm <app_name>
#take down the swarm
docker swarm leave --force

