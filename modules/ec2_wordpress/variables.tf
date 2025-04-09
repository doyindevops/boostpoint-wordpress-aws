variable "project" {}
variable "ami_id" {
  description = "Ubuntu AMI ID"
  default     = "ami-0c02fb55956c7d316"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "subnet_id" {}
variable "security_group_id" {}
variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

# Only one declaration each — no duplicates
variable "db_host" {}
variable "db_user" {}
variable "db_password" {}
variable "db_name" {}

