#
# Requirement
# oppara/blog
# https://github.com/oppara/blog/tree/specify-timezone
#
# build & drop it in $PATH
#

SHELL := /bin/bash

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
CWD := $(patsubst %/,%,$(dir $(mkfile_path)))
export BLOG_ROOT := $(CWD)
export BLOG_POST_DIR := $(shell date +"content/posts/%Y/%m")

SERVER_OPTS := -D -F --forceSyncStatic

all: new ## create new post

.PHONY: new
new: ## create new post
	@blog new

.PHONY: edit
edit: ## edit post
	@blog edit

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
