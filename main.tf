terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
      Project     = "fullcycle"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
  environment = var.environment
  aws_region  = var.aws_region
}

