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

all: hello

.PHONY: hello
hello: ## Builds hello image at debeshmandal/md8s-hello
	docker build -t ${DOCKER_PREFIX}$@:${VERSION} $@
