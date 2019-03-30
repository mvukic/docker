# Docker cheatsheet

# List

## List images
```sh
docker image ls
docker images
```

## List containers
```sh
docker container ls
docker ps
docker container ls --all
```
* **--all** -> list all container (running and stopped)

# Images
## Build image with tag
```sh
docker build --tag=<image_name> <Dockerfile_path>
```
* **--tag=<image_name>** -> Image name for future reference
* **<Dockerfile_path>** -> path to Dockerfile directory

## Run image
```sh
docker run -d -p <port:host>:<port_container> -p <port:host>:<port_container> <image_name>
```
* **-d** -> run in detached mode
* **-p <port_host>:<port_container>** -> maps port container to host port for external access
* **<image_name>** -> name of existing image

## Remove image
```sh
docker rmi <image_id>
docker rmi <image_tag>
```
Image will only be removed if there are no associated containers or other images.

```sh
docker image prune
```
Remove images that are named **\<none>** (intermediate results of docker build command)

```sh
docker image prune -a
```
Removes images that don't have at least one associated container

## Image history
```sh
docker history <image_name>
```
View layers that make up the image.

# Containers

## Stop container
```sh
docker container stop <container_name>
docker container stop <container_id>
```

## Remove container
```sh
docker container rm <container_name>
docker container rm <container_id>
```

# Docker Compose

# Compose

```sh
docker-compose up -d
```
Run docker compose for docker-compose.yml in current directory in dispatched mode.
```sh
docker-compose up --build
```
Run docker compose and rebuild used images.
```sh
docker-compose down
```
Stops services defined in doker-compose.yml in current directory.

# Enter bash in container

```sh
docker exec -ti <container_name> <command>
```
```sh
docker exec -ti <container_name> bash
```
* **\<container_name>** -> container name as seen when listing containers

```sh
docker-compose exec <container_name> bash
```
* **\<container_name>** -> container name as defined in docker-compose.yml (service name)

# Environemnt variables
```sh
docker run --env="<key> = <value>" --env="<key> = <value>"
docker run -e <key>=<value> -e <key>=<value>
docker run --env-file <file_path>
```
