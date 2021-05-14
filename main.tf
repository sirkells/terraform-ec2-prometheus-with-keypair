provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

# resource "aws_key_pair" "prometheus-server-kp" {
#   key_name   = "prometheus"
#   public_key = file("key.pub")
# }

# resource "aws_security_group" "prometheus-server-sg" {
#   name        = "ubuntu-security-group"
#   description = "Allow HTTP, HTTPS and SSH traffic"

#   ingress {
#     description = "SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTPS"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "terraform"
#   }
# }


# resource "aws_instance" "prometheus-server" {
#   key_name      = aws_key_pair.prometheus-server-kp.key_name
#   ami           = "ami-05f7491af5eef733a"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "prometheus-server"
#   }

#   vpc_security_group_ids = [
#     aws_security_group.prometheus-server-sg.id
#   ]

#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = file("key")
#     host        = self.public_ip
#   }

#   ebs_block_device {
#     device_name = "/dev/sda1"
#     volume_type = "gp2"
#     volume_size = 30
#   }
# }

# resource "aws_eip" "prometheus-server-eip" {
#   vpc      = true
#   instance = aws_instance.prometheus-server.id
# }