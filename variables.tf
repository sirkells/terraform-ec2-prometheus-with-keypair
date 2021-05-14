variable "server_name" {
  description = "Server Name"
  type        = string
  default     = "Prometheus Server"

}
variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-05f7491af5eef733a"
}
variable "ami_key_pair_name" {
  description = "Key name"
  type        = string
  default     = "prometheus"
}
