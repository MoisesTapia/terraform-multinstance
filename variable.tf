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

variable "server_names" {
    type        = list(string)
}


# Security Groups


variable "aws_sec1_ingress" {
    description = ""
    type = list(number)
}

variable "aws_sec1_egress" {
    description = ""
    type = list(number)
}

variable "aws_sec2_ingress" {
    description = ""
    type = list(number)
}

variable "aws_sec2_egress" {
    description = ""
    type = list(number)
}

variable "aws_sec3_ingress" {
    description = ""
    type = number
}

variable "aws_sec3_egress" {
    description = ""
    type = number
}

variable "protocol_net"{
    description = ""
    type = string
}

# Asig Security Group
variable "sec_groups" {
    type        = list(string)
    description = ""
}

variable "sg_names" {
    type        = list(string)
    description = ""
}