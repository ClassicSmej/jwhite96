terraform {
    
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

resource "aws_instance" "east_server" {
    ami = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"


    /* lifecycle example
    lifecycle {
        prevent_destroy = true
    }
    */


    /* for_each example
    for_each = {
        nano = "t2.nano"
        micro = "t2.micro"
    }

    instance_type = each.value

    tags = {
        Name = "TF-Server-${each.key}"
    }
    */


    /* count example
    count = 2

    tags = {
        Name = "TF-Server-${count.index}"
    }
    */
}


/* depends_on example
resource "aws_s3_bucket" "bucket" {
    bucket = "tf-test-bucket5896"
    acl    = "private"

    tags = {
        Name        = "TF test bucket"
        Environment = "Dev"
    }

    depends_on = [
        aws_instance.east_server
    ]
}
*/


/* provider alias example
provider "aws" {
    alias = "us-west"
    region = "us-west-1"
    profile = "default"
}

resource "aws_instance" "west_server" {
    ami = data.aws_ami.ubuntu.id
    instance_type = "t2.micro"

    provider = aws.us-west
}

# West instance AMI image
data "aws_ami" "ubuntu" {
    most_recent = true
    
    # Must specify the provider
    provider = aws.us-west

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/*-amd64-server-*"]
    }

    owners = ["099720109477"]
}
*/

output "public_ip" {
    value = aws_instance.east_server.public_ip
}
