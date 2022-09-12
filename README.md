An article of this repo: https://blog.studysapuri.jp/entry/Poetry-Docker-Build-and-Run

This is a sample project using:

- [Poetry](https://python-poetry.org/)
- [Docker](https://www.docker.com/)
- [Cloud Build](https://cloud.google.com/build)
- [Cloud Run](https://cloud.google.com/run)

also, [pytest](https://docs.pytest.org/), [FastAPI](https://fastapi.tiangolo.com/), [Terraform](https://www.terraform.io/) are used.

## Features

- containerized environment and live updates
  - Poetry works fine with Docker volume mount
- infinite PR (Pull Request) environments
  - by Cloud Build Trigger
- tuned build process for Cloud Build
  - separated configurations of Dockerfile, cloudbuild.yaml

## Commands

```
$ make
build                          build
curl_to_cloud_run              curl to Cloud Run (hint: ENV=pr-xxx)
format                         pysen run format
help                           help lists
init                           poetry install
lint                           pysen run lint
server                         start server
test                           test
```

## How this project is generated

```
$ docker run -it -v `pwd`:/work -w /work acidrain/python-poetry poetry new poetry-docker-build-and-run --src
$ cd poetry-docker-build-and-run
$ docker run -it -v `pwd`:/work -w /work acidrain/python-poetry poetry install
```

## Cookiecutter

see https://github.com/masaki925/cookiecutter--poetry-docker-build-run/tree/main

