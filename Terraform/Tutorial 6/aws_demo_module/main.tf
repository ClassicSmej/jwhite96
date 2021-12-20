data "aws_vpc" "main" {
    id = var.vpc_id
}

resource "aws_instance" "server" {
    ami = "ami-0ed9277fb7eb570c9"
    instance_type = var.instance_type
}

resource "aws_security_group" "SG-Server" {
    name        = "SG-Server"
    description = "Test SG"
    vpc_id      = var.vpc_id

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

