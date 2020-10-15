DOCKER_MAINTAINER=raiponce
MUSICBOT_VERSION := $(shell curl https://api.github.com/repos/jagrosh/MusicBot/releases/latest | jq .tag_name -r)
DOCKER_TMP=${DOCKER_MAINTAINER}/temp

all:
	docker-compose up

build:
	docker build \
		--pull \
		--no-cache \
		--build-arg MVERSION=${MUSICBOT_VERSION} \
		-t ${DOCKER_TMP} \
		.
	docker tag ${DOCKER_TMP} ${DOCKER_MAINTAINER}/musicbot:latest
	docker tag ${DOCKER_TMP} ${DOCKER_MAINTAINER}/musicbot:${MUSICBOT_VERSION}
	docker push ${DOCKER_MAINTAINER}/musicbot:latest
	docker push ${DOCKER_MAINTAINER}/musicbot:${MUSICBOT_VERSION}

