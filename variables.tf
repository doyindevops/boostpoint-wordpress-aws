variable "region" {
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "project" {
  description = "The project name prefix for tagging and naming"
  type        = string
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnets" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "key_name" {
  description = "Key pair name to SSH into EC2"
}

variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

variable "db_name" {
  description = "Database name for WordPress"
  type        = string
}

variable "db_user" {
  description = "Username for RDS MySQL"
  type        = string
}

variable "db_password" {
  description = "Password for RDS MySQL"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 or ASG launch template"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Example: Ubuntu 20.04 in us-east-1
}

variable "instance_type" {
  description = "Instance type for EC2 or ASG"
  type        = string
  default     = "t3.micro"
}
