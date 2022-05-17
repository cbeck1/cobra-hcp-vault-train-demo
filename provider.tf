#Declare required providers and connect to TFCB workspace
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
    hcp = {
        source = "hashicorp/hcp"
        version = "~> 0.28.0"
    }
  }
  #cloud {
  #    organization = "chrisbeck"
  #    workspace = "hcp-vault-train-demo"
  #}
}

#Configure AWS provider
provider "aws" {
    region = "us-east-1"
}

#Configure HCP provider
provider "hcp" {

}
