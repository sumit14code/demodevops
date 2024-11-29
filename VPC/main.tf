provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "sumit" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "sumit" {
    vpc_id = aws_vpc.sumit.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"  
}

resource "aws_internet_gateway" "sumit" {
    vpc_id = aws_vpc.sumit.id
}

resource "aws_route_table" "sumit" {
    vpc_id = aws_vpc.sumit.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.sumit.id
    }   
}

resource "aws_route_table_association" "sumit" {
    subnet_id = aws_subnet.sumit.id
    route_table_id = aws_route_table.sumit.id
}