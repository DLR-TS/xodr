SHELL:=/bin/bash

.DEFAULT_GOAL := all

.PHONY: build build_xodr clean

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

MAKEFLAGS += --no-print-directory
.EXPORT_ALL_VARIABLES:
DOCKER_BUILDKIT?=1
DOCKER_CONFIG?=

XODR_PROJECT="xodr"
XODR_VERSION="latest"
XODR_TAG="${XODR_PROJECT}:${XODR_VERSION}"

build_xodr: set_xodr_env build
set_xodr_env: 
	$(eval PROJECT := ${XODR_PROJECT}) 
	$(eval TAG := ${XODR_TAG})


all: build_xodr

build:
	rm -rf ${ROOT_DIR}/build
	set -x && \
    docker build --network host --tag $(shell echo ${TAG} | tr A-Z a-z) --build-arg PROJECT=${PROJECT} .
	docker cp $$(docker create --rm $(shell echo ${TAG} | tr A-Z a-z)):/tmp/${PROJECT}/build ${ROOT_DIR}

clean: set_xodr_env
	rm -rf "${ROOT_DIR}/build"
	docker rm $$(docker ps -a -q --filter "ancestor=${TAG}") 2> /dev/null || true
	docker rmi $$(docker images -q ${PROJECT}) 2> /dev/null || true
