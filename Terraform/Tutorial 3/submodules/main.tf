resource "aws_instance" "server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type

    tags = {
        Name = "${local.name}-server" 
    }
}

locals {
    name = "TF"
}

data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*-amd64-server-*"]
    }

    owners = ["099720109477"]
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

output "public_ip" {
    value = aws_instance.server.public_ip
}