resource "aws_nat_gateway" "natg" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "natg"
  }
  depends_on = [aws_internet_gateway.gw]
}
