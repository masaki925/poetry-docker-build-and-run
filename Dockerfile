FROM python:3.9-slim as base

RUN pip install poetry==1.1.12
RUN poetry config virtualenvs.create false

WORKDIR /app

# to cache dependencies
COPY poetry.lock pyproject.toml ./
RUN poetry install --no-dev

COPY src ./src

#######################################
FROM base as development

# to install dev packages
RUN poetry install

#######################################
FROM base as production

# to install own project
RUN poetry install --no-dev

EXPOSE 8080
CMD ["gunicorn", "-k", "uvicorn.workers.UvicornWorker", "-b", ":8080", "--workers", "1", "--threads", "8", "--timeout", "0", "poetry_docker_build_and_run.main:app"]

