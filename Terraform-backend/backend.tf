terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>3.0"
    }
  }
  backend "s3" {
    bucket = "bootcamp-25-oyin"
    key = "terraform/backend.tfstate"
    dynamodb_table = "terraform-lock"
    region = "us-east-1"
 }
}

provider "aws" {
   region  = "us-east-1"
   profile = "default"
 }
