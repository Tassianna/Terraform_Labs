resource "aws_instance" "vm" {

  ami = var.ami

  instance_type = var.instance_type

  tags = {
  "Name" = each.value
  "env"  = "dev"
  }

  for_each = var.ec2_name

}

