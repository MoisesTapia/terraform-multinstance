resource "aws_security_group" "sg_server1" {
    # 80,443,445,444,8080
    name    = var.sg_names[0]

    dynamic "ingress" {
        iterator        = port
        for_each        = var.aws_sec1_ingress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator        = port
        for_each        = var.aws_sec1_egress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
      "Name" = "sg_server1"
    }

}

resource "aws_security_group" "sg_server2" {
    # 3306,22
    name    = var.sg_names[1]
    
    dynamic "ingress" {
        iterator        = port
        for_each        = var.aws_sec2_ingress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator        = port
        for_each        = var.aws_sec2_egress
        content {
            from_port   = port.value
            to_port     = port.value
            protocol    = var.protocol_net
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    tags = {
      "Name" = "sg_server2"
    }

}

resource "aws_security_group" "sg_server3" {
    # 22
    name    = var.sg_names[2]
    
    
    ingress {
    
        from_port   = var.aws_sec3_ingress
        to_port     = var.aws_sec3_ingress
        protocol    = var.protocol_net
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
    
        from_port   = var.aws_sec3_egress
        to_port     = var.aws_sec3_egress
        protocol    = var.protocol_net
        cidr_blocks = ["0.0.0.0/0"]
    
    }

    tags = {
      "Name" = "sg_server3"
    }

}