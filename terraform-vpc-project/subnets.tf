############# defining public and private subnets separetly##############

/**resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myVpc.id


  cidr_block = var.public_subnet_cidr_block


  map_public_ip_on_launch = true


  availability_zone = var.availability_zone["public_subnet_az"]


  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.myVpc.id


  map_public_ip_on_launch = false


  availability_zone = var.availability_zone["private_subnet_az"]


  cidr_block = var.private_subnet_cidr_block


  tags = {
    Name = "private_subnet"
  }
}*/

################ defining all subnets in a main resource #################


resource "aws_subnet" "subnet" {

  vpc_id = aws_vpc.myVpc.id
  cidr_block = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone = each.value.availability_zone
  
  tags = {
    Name = each.key
  }

  for_each = var.subnets
}

