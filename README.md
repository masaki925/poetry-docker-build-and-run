
## How this project is generated

```
$ docker run -it -v `pwd`:/work -w /work acidrain/python-poetry poetry new poetry-docker-build-and-run --src
$ cd poetry-docker-build-and-run
$ docker run -it -v `pwd`:/work -w /work acidrain/python-poetry poetry install
```

