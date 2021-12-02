resource "google_cloudbuild_trigger" "poetry-docker-build-and-run-pr" {
  name        = "poetry-docker-build-and-run-pr"
  description = "Poetry Docker Build and Run: pr"

  github {
    owner = "masaki925"
    name  = "poetry-docker-build-and-run"

    pull_request {
      branch = "^main$"
    }
  }

  filename = "cloudbuild-pr.yaml"

  substitutions = {
    _ENV = "pr-"
  }
}

resource "google_cloudbuild_trigger" "poetry-docker-build-and-run-dev" {
  name        = "poetry-docker-build-and-run-dev"
  description = "Poetry Docker Build and Run: dev"

  github {
    owner = "masaki925"
    name  = "poetry-docker-build-and-run"

    push {
      branch = "^main$"
    }
  }

  filename = "cloudbuild-main.yaml"

  substitutions = {
    _ENV = "dev"
  }
}

