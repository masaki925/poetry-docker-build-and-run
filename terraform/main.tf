terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {
  credentials = file("secret.json")

  project = "iwa-lab"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-c"
}

