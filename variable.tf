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

variable "aws_vpc_name" {
  type        = list(string)
  description = ""
}

variable "aws_cidrblocks" {
  type        = list(string)
  description = ""
}

variable "aws_tags_network" {
  type        = list(string)
  description = ""
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = false
}