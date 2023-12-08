# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
}

resource "aws_internet_gateway" "my_gw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Subnets
resource "aws_subnet" "my_subnet" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 2, count.index)
  availability_zone       = "us-west-1a" # Replace with your desired availability zone
  map_public_ip_on_launch = true
}

# Route Table for Public Subnet (Internet Access)
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gw.id
  }
}

# Associate the Public Route Table with Subnet
resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.my_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
