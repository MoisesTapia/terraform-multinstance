resource "aws_instance" "ubuntu_server" {
    ami             = var.aws_ami
    instance_type   = var.aws_intatype
    count           = length(var.server_names)
    security_groups = [element(var.sec_groups, count.index)]
    tags = {
        Name    = var.server_names[count.index]
    }
}