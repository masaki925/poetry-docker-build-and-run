.PHONY: help

.DEFAULT_GOAL := help

build: ## build
	docker compose build

server: build ## start server
	docker compose up $(shell basename $(PWD))

test: build ## test
	docker compose run --rm $(shell basename $(PWD)) \
		pytest -v tests

help: ## help lists
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

