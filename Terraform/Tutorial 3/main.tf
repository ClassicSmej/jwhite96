terraform {
    
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
    profile = "default"
}

module "aws_server" {
    source = ".//submodules"
}

output "public_ip" {
    value = module.aws_server.public_ip
}