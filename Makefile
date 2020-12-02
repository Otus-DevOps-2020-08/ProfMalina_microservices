include ${PWD}/docker/.env

init: down docker-pull up

build-all: build-reddit build-prometheus

push-all: login push-comment push-post push-ui

login:
	docker login

push-comment:
	docker push ${USER_NAME}/comment:${COMMENT_VERSION}

push-post:
	docker push ${USER_NAME}/post:${POST_VERSION}

push-ui:
	docker push ${USER_NAME}/ui:${UI_VERSION}

push-prometheus:
	docker push ${USER_NAME}/prometheus:${PROMETHEUS_VERSION}

build-reddit: build-comment build-post build-ui

build-comment:
	cd ./src/comment && bash ./docker_build.sh

build-post:
	cd ./src/post-py && bash ./docker_build.sh

build-ui:
	cd ./src/ui && bash ./docker_build.sh

build-prometheus:
	docker build -t ${USER_NAME}/prometheus ${PWD}/monitoring/prometheus

up:
	cd ./docker && docker-compose up -d

down:
	cd ./docker && docker-compose down --remove-orphans

docker-pull:
	cd ./docker && docker-compose pull
