variable "project" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "sg_rds" {}
variable "db_name" {
  default = "wordpress"
}
variable "db_user" {
  default = "admin"
}
variable "db_password" {
  default = "StrongP@ssw0rd123"
}
