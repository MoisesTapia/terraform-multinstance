resource "aws_vpc" "public_net" {
    cidr_block = var.public_networking
    #  "10.0.0.0/16"
}

resource "aws_vpc" "private_net" {
    cidr_block = var.pribate_networking 
    # "10.0.0.0/16"
}
