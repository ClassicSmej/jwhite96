provider "aws" {
    region = "us-east-1"
    profile = "default"
}

module "aws_demo" {
    source = ".//aws_demo_module"

    # pass variables to module
    instance_type = "t2.micro"
    vpc_id = "vpc-04ccb4c357b6c7638"
}

output "public_ip" {
    value = module.aws_demo.public_ip
}

