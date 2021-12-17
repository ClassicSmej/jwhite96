variable regions {
    type = list(string)
    default = [
        "us-east-1",
        "us-west-1"
    ]
}

variable vpc_cidr_block {
    type = string
    default = "10.0.0.0/16"
}

variable subnet_cidr {
    type = list(string)
    default = [ "10.0.10.0/24", "10.0.20.0/24" ]
}

variable azs {
    type = list(string)
    default = [ "us-east-1a", "us-east-1b" ]
}

variable ami {
    type = map
    default = {
        "Linux5" = "ami-0ed9277fb7eb570c9"
        "Linux4" = "ami-061ac2e015473fbe2"
    }
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}