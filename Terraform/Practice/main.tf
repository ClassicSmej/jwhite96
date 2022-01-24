provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

module "network_module" {
  source = ".//network_module"
  azs    = ["us-east-1a", "us-east-1b"]
}

data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "server" {
  count = 2

  ami           = data.aws_ami.linux.id
  instance_type = var.instance_type
  subnet_id     = module.network_module.subnets[count.index]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

  tags = {
    "Name" = "TF-Server-${count.index + 1}"
  }
}