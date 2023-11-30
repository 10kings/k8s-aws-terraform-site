resource "aws_internet_gateway" "k8s_gateway" {
  vpc_id = aws_vpc.k8s_vpc.id

  tags = {
    Name = "my_gateway"
  }
}

resource "aws_route_table" "k8s_route_table" {
  vpc_id = aws_vpc.k8s_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s_gateway.id
  }

  tags = {
    Name = "my_route_table"
  }
}

resource "aws_route_table_association" "a_subnet_1a" {
  subnet_id      = aws_subnet.subnet_1a.id
  route_table_id = aws_route_table.k8s_route_table.id
}

resource "aws_route_table_association" "a_subnet_1b" {
  subnet_id      = aws_subnet.subnet_1b.id
  route_table_id = aws_route_table.k8s_route_table.id
}
