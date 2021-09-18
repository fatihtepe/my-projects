terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.59.0"
    }
    github = {
      source  = "integrations/github"
      version = "4.14.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Configuration options
}

provider "github" {
  token = "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"
  # Configuration options
}