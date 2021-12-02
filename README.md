TBD: a blog article will be published soon.

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
help                           help lists
server                         start server
test                           test
```

## How this project is generated

```
$ docker run -it -v `pwd`:/work -w /work acidrain/python-poetry poetry new poetry-docker-build-and-run --src
$ cd poetry-docker-build-and-run
$ docker run -it -v `pwd`:/work -w /work acidrain/python-poetry poetry install
```

