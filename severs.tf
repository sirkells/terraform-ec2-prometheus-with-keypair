resource "aws_instance" "prometheus-server" {
  ami             = var.ami_id
  instance_type   = "t2.micro"
  key_name        = var.ami_key_pair_name
  security_groups = ["${aws_security_group.prometheus-sg.id}"]
  user_data       = file("install_prometheus.sh")
  tags = {
    Name = var.server_name
  }
  subnet_id = aws_subnet.subnet-uno.id
}