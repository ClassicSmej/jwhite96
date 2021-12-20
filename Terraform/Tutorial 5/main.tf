terraform {
    
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }

    required_version = "~> 1.0.0"
}

provider "aws" {
    region = "us-east-1"
    profile = "default"
}

variable "test" {
    type = list
}

variable "test_map" {
    type = map
}

variable "test_splat" {
    type = list
}

data "aws_vpc" "main" {
    id = "vpc-04ccb4c357b6c7638"
}

locals {
    ingress = [
        {
            port = 80
            description = "http"
            protocol = "tcp"
        },
        {
            port = 22
            description = "ssh"
            protocol = "tcp"
        }
    ]
}

resource "aws_security_group" "sg" {
    name        = "test"
    description = "Test SG"
    vpc_id      = data.aws_vpc.main.id

    dynamic "ingress" {
        for_each = local.ingress
        content {
            description      = ingress.value.description
            from_port        = ingress.value.port
            to_port          = ingress.value.port
            protocol         = ingress.value.protocol
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            self = false
        }
    } 

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        self = false
    }

    tags = {
        Name = "TF-SG"
    }
}