resource "aws_security_group" "public_security_group" {
  name        = "allow_public_traffic"
  description = "Allow traffic on public VM"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description = "TLS from Internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Http from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
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
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description = "TLS from Internet"
    from_port   = 20
    to_port     = 20
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr_block]
  }

  ingress {
    description = "Http from Internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr_block]
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
