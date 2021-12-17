terraform {

    /*
    backend "remote" {
        organization = "Smej"

        workspaces {
            name = "provisioners"
            }
    }
    */
    
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

resource "aws_instance" "server" {
    ami = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"

    vpc_security_group_ids = [aws_security_group.SG-Server.id]
    key_name = "TestKey"

    user_data = data.template_file.userdata.rendered

    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ips.txt"
    }
}

data "aws_vpc" "main" {
    id = "vpc-04ccb4c357b6c7638"
}

resource "aws_security_group" "SG-Server" {
    name        = "SG-Server"
    description = "Allow HTTP inbound traffic"
    vpc_id      = data.aws_vpc.main.id

    ingress = [
        {
            description      = "HTTP"
            from_port        = 80
            to_port          = 80
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        },
        {
            description      = "SSH"
            from_port        = 22
            to_port          = 22
            protocol         = "tcp"
            cidr_blocks      = ["82.21.167.209/32"]
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "SG-Server"
    }
}

data "template_file" "userdata" {
    template = file("./userdata.yaml")
}

output "public_ip" {
    value = aws_instance.server.public_ip
}