terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "godeploylabs"

    workspaces {
      name = "lab-example-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "lab_ec2" {
    ami = "ami-01cc34ab2709337aa"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Lab EC2"
    }
}