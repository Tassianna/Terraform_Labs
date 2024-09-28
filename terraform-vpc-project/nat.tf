resource "aws_nat_gateway" "natg" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.subnet["public_subnet"].id
  tags = {
    Name = "natg"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}
