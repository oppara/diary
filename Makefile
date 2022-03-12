SHELL := /bin/bash
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
CWD := $(patsubst %/,%,$(dir $(mkfile_path)))
SERVER_OPTS := -D -F --forceSyncStatic

all: create ## create new post

.PHONY: create
create: ## create new post
	@${CWD}/bin/hugo-new.sh

.PHONY: edit
edit: ## edit post
	@${CWD}/bin/hugo-edit.sh

.PHONY: up
up: ## start hugo server
	@hugo server $(SERVER_OPTS)

.PHONY: down
down: ## stop hugo server
	@pkill hugo

.PHONY: open
open: ## open browser
	@open http://localhost:1313

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
