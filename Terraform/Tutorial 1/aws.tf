resource "aws_instance" "server" {
    ami = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"

    tags = {
      "Name" = "${local.name}-server"
    }
}

/*
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.name}-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  tags = {
    Name = "${local.name}-VPC"
  }
}
*/