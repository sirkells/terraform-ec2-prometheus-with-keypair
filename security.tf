resource "aws_security_group" "prometheus-sg" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.prometheus-server.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    description = "prometheus-server"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    description = "prometheus-alert-mgr"
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    description = "prometheus-node-exporter"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}