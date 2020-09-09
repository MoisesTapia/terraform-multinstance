# Instances

aws_region   = "us-east-2"
aws_ami      = "ami-0bbe28eb2173f6167"
aws_intatype = "t2.micro"

# Security Groups

public_server_names    = ["Server1", "Server2"]
private_server_names   = ["Server3", "Server4"]
sg_names               = ["public_sg_server", "private_sg_server"]
public_sec_groups      = ["public_sg_server"]
private_sec_groups     = ["private_sg_server"]
protocol_net           = "tcp"
aws_public_sec_ingress = [22, 80, 443, 445, 4444, 8080]
aws_public_sec_egress  = [22, 80, 443, 445, 4444, 8080]
aws_privat_sec_ingress = [3306, 22]
aws_privat_sec_egress  = [3306, 22]

# Networking
public_networking      = "10.0.0.0/16"
private_networking     = "10.0.0.0/16"
aws_subnet_name        = ["public_subnet", "private_subnet"]
aws_vpc_name           = ["public_vpc", "private_vpc"]