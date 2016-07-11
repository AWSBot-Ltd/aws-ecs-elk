NAME = dcrbsltd
VERSION = $(shell cat VERSION)
KEY_NAME = elasticsearch
DOMAIN_NAME = awsbot.com
DATE = $(shell date)
.PHONY: all build clean test tag_latest release run install

all: docker install

docker: build push

build:
	$(MAKE) -C elasticsearch 
	$(MAKE) -C logstash
	$(MAKE) -C kibana 

push:
	docker push $(NAME)/elasticsearch:$(VERSION)
	docker push $(NAME)/logstash:$(VERSION)
	docker push $(NAME)/kibana:$(VERSION)

install:
	@bash ./install

clean:
	-docker kill $(shell docker ps -a -q) 
	-docker rm $(shell docker ps -a -q) 
	-docker rmi --force $(shell docker images -q)
	#@bash ./clean

test:
	@bash ./test

release:
	@echo "Enter commit message:"
	@read REPLY; \
	echo "${DATE} - $$REPLY" >> CHANGELOG; \
	git add --all; \
	git commit -m "$$REPLY"; \
	git push
run:
	docker-compose -p elk up -d --force-recreate
