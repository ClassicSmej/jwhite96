terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = var.regions[0]
    profile = "default"
}

resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr_block

    tags = {
      "Name" = "TF-VPC"
    }
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr[0]
    availability_zone = var.azs[0]

    tags = {
        "Name" = "TF-Subnet-1"
    }
}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.subnet_cidr[1]
    availability_zone = var.azs[1]

    tags = {
        "Name" = "TF-Subnet-2"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        "Name" = "TF-IGW"
    }
}

resource "aws_route_table" "routetable" {
    vpc_id = aws_vpc.vpc.id

    route = []

    tags = {
        "Name" = "TF-RT"
    }
}

resource "aws_route" "route" {
    route_table_id = aws_route_table.routetable.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    depends_on = [ aws_route_table.routetable ]
}

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.routetable.id
}

resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.subnet2.id
    route_table_id = aws_route_table.routetable.id
}

resource "aws_instance" "instance1" {
    ami = var.ami["Linux4"]
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet1.id

    tags = {
        "Name" = "TF-Instance-1"
    }
}

resource "aws_instance" "instance2" {
    ami = var.ami["Linux5"]
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet2.id

    tags = {
        "Name" = "TF-Instance-2"
    }
}