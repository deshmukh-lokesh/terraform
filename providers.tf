#aws provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

#S3 backend
terraform {
  backend "s3" {
    bucket = "lokesh-terraform-bucket"
    key    = "statefiles"
    region = "ap-south-1"
  }
}
