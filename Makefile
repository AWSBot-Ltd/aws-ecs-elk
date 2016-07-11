NAME = dcrbsltd
VERSION = $(shell cat VERSION)
KEY_NAME = elasticsearch
DOMAIN_NAME = awsbot.com
DATE = $(shell date)
.PHONY: all build clean test tag_latest release run install

all: docker install

docker: build tag_latest push

build:
	docker build -f elasticsearch/Dockerfile -t $(NAME)/elasticsearch:$(VERSION) .
	docker build -f logstash/Dockerfile -t $(NAME)/logstash:$(VERSION) .
	docker build -f kibana/Dockerfile -t $(NAME)/kibana:$(VERSION) .

tag_latest:
	docker tag -f $(NAME)/elasticsearch:$(VERSION) $(NAME):latest
	docker tag -f $(NAME)/logstash:$(VERSION) $(NAME):latest
	docker tag -f $(NAME)/kibana:$(VERSION) $(NAME):latest

push:
	docker push $(NAME)/elasticsearch:$(VERSION)
	docker push $(NAME)/logstash:$(VERSION)
	docker push $(NAME)/kibana:$(VERSION)

install:
	@bash ./install

clean:
	@bash ./clean

test:
	@bash ./test

release:
	@echo "Enter commit message:"
	@read REPLY; \
	echo "${DATE} - $$REPLY" >> CHANGELOG; \
	git add --all; \
	git commit -m "$$REPLY"; \
	git push
