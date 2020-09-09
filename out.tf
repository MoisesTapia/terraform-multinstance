output "Availability_Zones" {
  value = data.aws_availability_zones.available.names
}

########        PUBLIC         #########

output "public_sg" {
  value = aws_security_group.public_sg_server.id
}

output "public_aws_instance" {
    value = aws_instance.public_servers.*.id
}

output "public_ec2_instance_ami" {
    value = aws_instance.public_servers.*.ami
}

output "public_vpc" {
  value = aws_vpc.public_net.id
}

output "Public_ip" {
    value = aws_instance.public_servers.*.public_ip
}

########        PRIVATE         #########

output "private_aws_instance" {
    value = aws_instance.private_servers.*.id
}

output "private_ec2_instance" {
    value = aws_instance.private_servers.*.ami
}

output "private_sg" {
  value = aws_security_group.private_sg_server.id
}

output "private_vpc" {
  value = aws_vpc.private_net.id
}

output "Private_ip" {
    value = aws_instance.private_servers.*.public_ip
}




