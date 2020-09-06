variable "aws_region" {
    type    = string
}

variable "aws_ami" {
    type    = string
    description = "This var set the ami in the instances"
}

variable "aws_intatype" {
    type        = string
    description = ""
}

variable "public_server_names" {
    type        = list(string)
}

variable "private_server_names" {
    type        = list(string)
}


# Security Groups


variable "aws_public_sec_ingress" {
    description = ""
    type = list(number)
}

variable "aws_public_sec_egress" {
    description = ""
    type = list(number)
}

variable "aws_privat_sec_ingress" {
    description = ""
    type = list(number)
}

variable "aws_privat_sec_egress" {
    description = ""
    type = list(number)
}

variable "protocol_net"{
    description = ""
    type = string
}

# Asig Security Group
variable "public_sec_groups" {
    type        = list(string)
    description = ""
}

variable "privat_sec_groups" {
    type        = list(string)
    description = ""
}

variable "sg_names" {
    type        = list(string)
    description = ""
}

# Networking

variable "public_networking" {
    type    = string
}

variable "public_networking" {
    type    = string
}