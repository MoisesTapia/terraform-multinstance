resource "aws_security_group" "public_sg_server" {
    # 80,443,445,444,8080
    name    = var.sg_names[0]

    dynamic "ingress" {
        iterator        = port
        for_each        = var.aws_public_sec_ingress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator        = port
        for_each        = var.aws_public_sec_egress
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

}

resource "aws_security_group" "private_sg_server" {
    # 3306,22
    name    = var.sg_names[1]
    
    dynamic "ingress" {
        iterator        = port
        for_each        = var.aws_privat_sec_ingress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator        = port
        for_each        = var.aws_privat_sec_egress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
      "Name" = "privare_sg_server"
    }

}