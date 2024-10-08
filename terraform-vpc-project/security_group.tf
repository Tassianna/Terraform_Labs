resource "aws_security_group" "public_security_group" {
  name        = "allow_public_traffic"
  description = "Allow traffic on public VM"
  vpc_id      = aws_vpc.myVpc.id

  dynamic "ingress" {
    for_each = var.inbound_rule
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Allow all trafic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_public_traffic"
  }
}

resource "aws_security_group" "private_security_group" {
  name        = "allow_private_traffic"
  description = "Allow traffic on private VM"
  vpc_id      = aws_vpc.myVpc.id

  dynamic "ingress" {
    for_each = var.inbound_rule
    content {
      description = ingress.key
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = [var.public_subnet_cidr_block]
    }
  }

  egress {
    description = "Allow all trafic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_private_traffic"
  }
}
