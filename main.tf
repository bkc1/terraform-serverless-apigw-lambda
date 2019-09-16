# Specify the provider and access details
provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 0.11.13"
}
