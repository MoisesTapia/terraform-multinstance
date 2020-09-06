resource "aws_instance" "public_servers" {
    ami             = var.aws_ami
    instance_type   = var.aws_intatype
    count           = length(var.public_server_names)
    security_groups = [element(var.public_sec_groups, count.index)]
    tags = {
        Name    = var.public_server_names[count.index]
    }
}

resource "aws_instance" "private_servers" {
    ami             = var.aws_ami
    instance_type   = var.aws_intatype
    count           = length(var.private_server_names)
    security_groups = [element(var.privat_sec_groups, count.index)]
    tags = {
        Name    = var.private_server_names[count.index]
    }
}