docker-deploy: docker-login docker-upload

docker-login:
	docker login --username=$(DOCKER_USERNAME) --password=$(DOCKER_PASSWORD)

docker-upload:
	docker push poldrack/statsthinking21

docker-build:
	DOCKER_BUILDKIT=1  docker build --platform linux/x86_64 -t $(DOCKER_USERNAME)/statsthinking21 .

shell:
	docker run -it -v $(shell pwd):/book -w /book --platform linux/x86_64 --entrypoint=bash $(DOCKER_USERNAME)/statsthinking21


