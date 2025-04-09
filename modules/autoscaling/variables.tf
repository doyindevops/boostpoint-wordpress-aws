variable "project" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "asg_subnet_ids" {}
variable "launch_template_sg_id" {}
variable "user_data" {
  description = "Base64-encoded EC2 launch script"
}

