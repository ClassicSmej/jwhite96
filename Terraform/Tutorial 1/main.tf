terraform {

    backend "remote" {
        organization = "Smej"

        workspaces {
            name = "terraform-example"
            }
    }
    
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

locals {
    name = "TF"
}