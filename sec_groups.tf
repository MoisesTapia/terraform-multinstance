resource "aws_security_group" "public_sg_server" {
  # 80,443,445,444,8080
  name   = var.sg_names[0]
  vpc_id = aws_vpc.public_net.id

  dynamic "ingress" {
    iterator = port
    for_each = var.aws_public_sec_ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol_net
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.aws_public_sec_egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol_net
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Name" = "public_sg_server"
  }
  #depends_on = [aws_instance.public_servers]

}

resource "aws_security_group" "private_sg_server" {
  # 3306,22
  name   = var.sg_names[1]
  vpc_id = aws_vpc.private_net.id
  
  dynamic "ingress" {
    iterator = port
    for_each = var.aws_privat_sec_ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol_net
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.aws_privat_sec_egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = var.protocol_net
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    "Name" = "private_sg_server"
  }

  #depends_on = [aws_instance.private_servers]

}