SHELL=/bin/bash
VERSION=$(shell git describe --abbrev=6 --dirty --tags | sed -e "s/v//" -)
DOCKER_PREFIX=debeshmandal/md8s-

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## Print this help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

all: hello lammps oxdna

.PHONY: hello
hello: ## Builds hello image at debeshmandal/md8s-hello
	docker build -t ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: lammps
lammps: ## Builds lammps image at debeshmandal/md8s-lammps
	docker build -t ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: oxdna
oxdna: ## Builds oxdna image at debeshmandal/md8s-oxdna
	docker build -t ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: clean
clean: ## Deletes all of the images for this version
	docker image rm ${DOCKER_PREFIX}hello:${VERSION}
	docker image rm ${DOCKER_PREFIX}lammps:${VERSION}
	docker image rm ${DOCKER_PREFIX}oxdna:${VERSION}

.PHONY: version
version: ## Prints current version
	@echo ${VERSION}

.PHONY: deploy
deploy: hello-deploy lammps-deploy oxdna-deploy ## Deploys to DockerHub (assumes user is logged in as debeshmandal)

.PHONY: hello-deploy
hello: ## Builds hello image at debeshmandal/md8s-hello using buildx and deploys (assumes user is logged in as debeshmandal)
	docker buildx build --push -t ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: lammps-deploy
lammps: ## Builds lammps image at debeshmandal/md8s-lammps using buildx and deploys (assumes user is logged in as debeshmandal)
	docker buildx build --push -t ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: oxdna-deploy
oxdna: ## Builds oxdna image at debeshmandal/md8s-oxdna using buildx and deploys (assumes user is logged in as debeshmandal)
	docker buildx build --push -t ${DOCKER_PREFIX}$@:${VERSION} $@
