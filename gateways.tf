resource "aws_internet_gateway" "prometheus-server-gw" {
  vpc_id = aws_vpc.prometheus-server.id
  tags = {
    Name = "prometheus-server-gw"
  }
}