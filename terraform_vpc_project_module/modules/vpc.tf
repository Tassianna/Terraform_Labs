resource "aws_vpc" "my-vpc"{
    cidr_block = var.cidr
    tags = {
    Name = var.vpc_name
  }

}