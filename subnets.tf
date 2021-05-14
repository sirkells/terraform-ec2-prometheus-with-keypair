resource "aws_subnet" "subnet-uno" {
  cidr_block        = cidrsubnet(aws_vpc.prometheus-server.cidr_block, 3, 1)
  vpc_id            = aws_vpc.prometheus-server.id
  availability_zone = "eu-central-1a"
}

resource "aws_route_table" "route-table-prometheus-server" {
  vpc_id = aws_vpc.prometheus-server.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prometheus-server-gw.id
  }
  tags = {
    Name = "prometheus-server-route-table"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.subnet-uno.id
  route_table_id = aws_route_table.route-table-prometheus-server.id
}
