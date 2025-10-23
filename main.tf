terraform {
  required_version = ">= 1.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

module "storage_bucket" {
  source      = "./modules/storage_bucket"
  bucket_name = "my-gcp-test-bucket"
}

module "firewall" {
  source = "./modules/firewall"
}

module "iam" {
  source = "./modules/iam"
}

module "sql" {
  source = "./modules/sql"
}

module "compute" {
  source = "./modules/compute"
}