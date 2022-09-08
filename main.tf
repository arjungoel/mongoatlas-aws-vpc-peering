terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
  default_tags {
    tags = var.default_tags
  }
}

# Configure the Atlas Provider
provider "mongodbatlas" {
  #  alias       = "mongodbatlas"
  public_key  = var.mongodbatlas_public_key
  private_key = var.mongodbatlas_private_key
}