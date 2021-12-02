.PHONY: help

.DEFAULT_GOAL := help

build: ## build
	docker compose build

server: build ## start server
	docker compose up $(shell basename $(PWD))

test: build ## test
	docker compose run --rm $(shell basename $(PWD)) \
		pytest -v tests

ENV=dev
CLOUD_RUN_FQDN=https://poetry-docker-build-and-run-$(ENV)-jty67w5vzq-an.a.run.app

curl_to_cloud_run: ## curl to Cloud Run (hint: ENV=pr-xxx)
	curl "$(CLOUD_RUN_FQDN)" \
		-H "accept: application/json" \
		-H "Content-Type: application/json" \
		-H "Authorization: Bearer $(shell gcloud auth print-identity-token)"

help: ## help lists
	@grep -E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

