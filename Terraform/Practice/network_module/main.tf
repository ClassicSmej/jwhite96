provider "aws" {
    region = "us-east-1"
    profile = "default"
}

resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
}

resource "aws_subnet" "subnet" {
    count = 2
    vpc_id = aws_vpc.vpc.id
    availability_zone = var.azs[count.index]
    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 8, ((count.index + 1)* 10))

    tags = {
      "Name" = "TF-Subnet-${count.index + 1}"
    }
}

locals {
    ingress = [
        {
            port = 80
            description = "HTTP"
            protocol = "tcp"
        },
        {
            port = 22
            description = "SSH"
            protocol = "tcp"
        }
    ]
}

resource "aws_security_group" "sg" {
    name        = "TF-SG"
    description = "Terraform Security Group"
    vpc_id      = aws_vpc.vpc.id

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