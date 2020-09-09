variable "aws_region" {
  type = string
}

variable "aws_ami" {
  type        = string
  description = "This var set the ami in the instances"
}

variable "aws_intatype" {
  type        = string
  description = ""
}

variable "public_server_names" {
  type = list(string)
}

variable "private_server_names" {
  type = list(string)
}


# Security Groups


variable "aws_public_sec_ingress" {
  description = ""
  type        = list(number)
}

variable "aws_public_sec_egress" {
  description = ""
  type        = list(number)
}

variable "aws_privat_sec_ingress" {
  description = ""
  type        = list(number)
}

variable "aws_privat_sec_egress" {
  description = ""
  type        = list(number)
}

variable "protocol_net" {
  description = ""
  type        = string
}

# Asig Security Group
variable "public_sec_groups" {
  type        = list(string)
  description = ""
}

variable "private_sec_groups" {
  type        = list(string)
  description = ""
}

variable "sg_names" {
  type        = list(string)
  description = ""
}

# Networking

variable "public_networking" {
  type        = string
  description = "Public VPC"
}

variable "private_networking" {
  type        = string
  description = "Private VPC"
}

variable "aws_subnet_name" {
  type        = list(string)
  description = ""
}

variable "aws_vpc_name" {
  type        = list(string)
  description = ""
}

variable "aws_cidrblocks" {
  type        = list(string)
  description = ""
}
variable "public_subnet" {}

variable "private_subnet" {}