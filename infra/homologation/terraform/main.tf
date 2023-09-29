terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.19.0"
    }
  }
  backend "s3" {
    bucket = "oobattousa-remote-state"
    key    = "maquina-ec2-docker.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Generated             = "Terraform"
      ResourcesDefinitionTo = "App autodeploy"
      Environment           = "Develop"
    }
  }
}
