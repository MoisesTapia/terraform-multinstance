resource "aws_vpc" "public_net" {
  cidr_block = var.public_networking

  tags = {
    Name = "public_net"
  }
}

resource "aws_vpc" "private_net" {
  cidr_block = var.private_networking
    tags = {
    Name = "private_net"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.public_net.id
  map_public_ip_on_launch = false
  cidr_block = var.aws_cidrblocks[0]

  tags = {
    Name = var.aws_subnet_name[0]
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.private_net.id
  map_public_ip_on_launch = false
  cidr_block = var.aws_cidrblocks[1]

  tags = {
    Name = var.aws_subnet_name[1]
  }
}
