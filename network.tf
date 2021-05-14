resource "aws_vpc" "prometheus-server" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "prometheus-server-vpc"
  }
}
resource "aws_eip" "ip-prometheus-server" {
  instance = aws_instance.prometheus-server.id
  vpc      = true
}