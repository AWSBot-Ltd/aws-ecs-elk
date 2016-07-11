DATE = $(shell date)
NAME = dcrbsltd/elasticsearch
VERSION ?= 2
CMD ?= bash
.PHONY: test

all: build test release

build:
	@docker build -f Dockerfile -t $(NAME):$(VERSION) .

run:
	@docker run -it $(NAME):$(VERSION) ${CMD}

clean:
	-docker kill $(shell docker ps -a -q) 
	-docker rm $(shell docker ps -a -q) 
	-docker rmi $(shell docker images -q)

test:
	@env NAME=$(NAME) VERSION=$(VERSION) ./test

tag_latest:
	-docker tag $(NAME):$(VERSION) $(NAME):latest

release: test tag_latest
	@if ! docker images $(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	docker push $(NAME)
	@echo "*** Don't forget to create a tag. git tag rel-$(VERSION) && git push origin rel-$(VERSION)"

git_commit:
	@echo "Enter commit message:"
	@read REPLY; \
	echo "${DATE} - $$REPLY" >> CHANGELOG; \
	git add --all; \
	git commit -m "$$REPLY"; \
	git push

