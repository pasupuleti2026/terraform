resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pub-rt"
  }
}

resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT-GW.id
  }

  tags = {
    Name = "pri-rt"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.pub-subnet-1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.pub-subnet-2.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.pub-subnet-3.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "e" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "f" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "g" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "h" {
  subnet_id      = aws_subnet.private-subnet-5.id
  route_table_id = aws_route_table.pri-rt.id
}

resource "aws_route_table_association" "i" {
  subnet_id      = aws_subnet.private-subnet-6.id
  route_table_id = aws_route_table.pri-rt.id
}