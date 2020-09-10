resource "aws_vpc" "public_net" {

    cidr_block              = var.public_networking
    instance_tenancy        = var.instance_tenancy
    enable_dns_hostnames    = var.enable_dns_hostnames
    enable_dns_support      = var.enable_dns_support
    enable_classiclink      = var.enable_classiclink

    tags = {
      Name                  = var.aws_tags_network[0]
    }
}

resource "aws_vpc" "private_net" {

    cidr_block              = var.private_networking

    tags = {
    Name                    = var.aws_tags_network[1]
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.public_net.id

  tags = {
    Name = var.aws_tags_network[2]
  }

  depends_on = [aws_vpc.public_net]
}

resource "aws_subnet" "public_subnet" {
    availability_zone       = data.aws_availability_zones.available.names[0]
    vpc_id                  = aws_vpc.public_net.id
    map_public_ip_on_launch = true
    cidr_block              = var.aws_cidrblocks[0]

    tags = {
      Name                  = var.aws_tags_network[3]
    }
    depends_on = [aws_vpc.public_net]
}

resource "aws_subnet" "private_subnet" {
    availability_zone       = data.aws_availability_zones.available.names[1]
    vpc_id                  = aws_vpc.private_net.id
    map_public_ip_on_launch = false
    cidr_block              = var.aws_cidrblocks[1]

    tags = {
      Name                  = var.aws_tags_network[4]
    }
    depends_on = [aws_vpc.private_net]
}

resource "aws_route_table" "route_public" {
  vpc_id = aws_vpc.public_net.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = var.aws_tags_network[5]
  }
}

resource "aws_route_table_association" "public_subnet_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_public.id

  depends_on = [aws_route_table.route_public]
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.private_net.id

  tags = {
    Name = var.aws_tags_network[6]
  }
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private.id
}