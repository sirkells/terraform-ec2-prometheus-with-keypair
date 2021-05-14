resource "aws_key_pair" "prometheus" {
  key_name   = "prometheus"
  public_key = file("key.pub")
}