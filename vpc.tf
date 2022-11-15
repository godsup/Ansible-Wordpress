# VPC creations
resource "aws_vpc" "vpc" {
  #Cidr can be a variable
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "vpc"
  }
}

# SUBNETS

# Public
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-central-1a"
  tags = {
    Name = "subnet-public-a"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "igw"
  }
}

# ROUTE TABLE
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
#Subnet can reach anywhere, subnet here can also be a variable
    cidr_block = "0.0.0.0/0"
#IGW can reach internet
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "rt"
  }
}

# Route associations
resource "aws_route_table_association" "rt_igw" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}