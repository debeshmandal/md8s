SHELL=/bin/bash
VERSION=$(shell git describe --abbrev=6 --dirty --tags | sed -e "s/v//" -)
DOCKER_PREFIX=debeshmandal/md8s-
DOCKER_BUILD=docker build -t
DOCKER_BUILDX_PUSH=docker buildx build --push -t

TARGETS := hello lammps oxdna

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help: ## Print this help message
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

all: $(TARGETS)

.PHONY: hello
hello: ## Builds hello image at debeshmandal/md8s-hello
	${DOCKER_BUILD} ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: lammps
lammps: ## Builds lammps image at debeshmandal/md8s-lammps
	${DOCKER_BUILD} ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: oxdna
oxdna: ## Builds oxdna image at debeshmandal/md8s-oxdna
	${DOCKER_BUILD} ${DOCKER_PREFIX}$@:${VERSION} $@

.PHONY: clean
clean: ## Deletes all of the images for this version
	docker image rm ${DOCKER_PREFIX}hello:${VERSION}
	docker image rm ${DOCKER_PREFIX}lammps:${VERSION}
	docker image rm ${DOCKER_PREFIX}oxdna:${VERSION}

.PHONY: version
version: ## Prints current version
	@echo ${VERSION}

.PHONY: deploy
deploy: ## Builds and pushes all targets using buildx (assumes user is logged in as debeshmandal)
	for t in ${TARGETS}; do ${DOCKER_BUILDX_PUSH} ${DOCKER_PREFIX}$$t:${VERSION} -t ${DOCKER_PREFIX}$$t:latest $$t; done

