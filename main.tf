provider "aws" {
  
}

resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "Name" = "dev-vpc"
  }
}

resource "aws_subnet" "dev-public-subnet" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
      "Name" = "dev-public-subnet"
    }
}
