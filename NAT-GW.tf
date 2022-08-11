resource "aws_eip" "elp-1"{
  #instance = aws_instance.web.id
  vpc      = true
}

resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.elp-1.id
  subnet_id     = aws_subnet.pub-subnet-1.id

  tags = {
    Name = "NAT-GW"
  }
}