resource "aws_instance" "public_servers" {
  ami                    = var.aws_ami
  instance_type          = var.aws_intatype
  count                  = length(var.public_server_names)
  availability_zone = data.aws_availability_zones.available.names[0]
  # Networking
  vpc_security_group_ids = [aws_security_group.public_sg_server.id]
  subnet_id              = aws_subnet.public_subnet.id
  #vpc_security_group_ids = [element(var.public_sec_groups, count.index)]
  tags = {
    Name = var.public_server_names[count.index]
  }
}

resource "aws_instance" "private_servers" {
  ami                    = var.aws_ami
  instance_type          = var.aws_intatype
  count                  = length(var.private_server_names)
  availability_zone = data.aws_availability_zones.available.names[1]
  # Networking
  vpc_security_group_ids = [aws_security_group.private_sg_server.id]
  subnet_id              = aws_subnet.private_subnet.id
  #vpc_security_group_ids = [element(var.private_sec_groups, count.index)]
  tags = {
    Name = var.private_server_names[count.index]
  }
}