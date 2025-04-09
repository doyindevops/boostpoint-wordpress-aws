variable "project" {}
variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}
variable "ec2_instance_id" {}
variable "ec2_target_port" {
  default = 80
}
variable "alb_sg_id" {}
