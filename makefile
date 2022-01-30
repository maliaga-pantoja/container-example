# syntax=docker/dockerfile:1

PWD = $(shell pwd)

go:
	@docker run --rm -v ${PWD}:/app -w /app \
		golang go ${CMD}
init:
	$(MAKE) go CMD="mod init github.com/devildeveloper/golang-example001"
try:
	$(MAKE) go CMD="run main.go"

	
build:
	@docker build -t devildeveloper/golang-example001:v1.0.0 .
run:
	@docker run --rm devildeveloper/golang-example001:v1.0.0
login:
	@echo ${DOCKER_PWD} | docker login -u ${DOCKER_USER} --password-stdin
push:
	@docker push devildeveloper/golang-example001:v1.0.0