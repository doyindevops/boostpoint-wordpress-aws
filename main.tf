provider "aws" {
  region = var.region
}

module "vpc" {
  source          = "./modules/vpc"
  project         = var.project
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

data "template_file" "asg_user_data" {
  template = file("${path.module}/user_data.sh.tpl")

  vars = {
    db_name = var.db_name
    db_user = var.db_user
    db_pass = var.db_password
    db_host = module.rds_mysql.db_endpoint
  }
}
module "nat_gateway" {
  source             = "./modules/nat_gateway"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.vpc.igw_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "security_groups" {
  source   = "./modules/security_groups"
  vpc_id   = module.vpc.vpc_id
  my_ip    = var.my_ip
  project  = var.project
}

module "rds_mysql" {
  source             = "./modules/rds_mysql"
  project            = var.project
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = var.db_password
  private_subnet_ids = module.vpc.private_subnet_ids
  sg_rds             = module.security_groups.rds_sg
}

module "ec2_wordpress" {
  source            = "./modules/ec2_wordpress"
  project           = var.project
  key_name          = var.key_name
  subnet_id         = module.vpc.public_subnet_ids[0]
  security_group_id = module.security_groups.ec2_sg_id

  db_host         = module.rds_mysql.db_endpoint
  db_user         = var.db_user
  db_password     = var.db_password
  db_name         = var.db_name
}

module "alb" {
  source             = "./modules/alb"
  project            = var.project
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnet_ids
  ec2_instance_id    = module.ec2_wordpress.instance_id
  ec2_target_port    = 80
  alb_sg_id          = module.security_groups.alb_sg
}

output "alb_url" {
  value = "http://${module.alb.alb_dns_name}"
}

module "autoscaling" {
  source                = "./modules/autoscaling"
  project               = var.project
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  key_name              = var.key_name
  asg_subnet_ids        = module.vpc.public_subnet_ids
  launch_template_sg_id = module.security_groups.ec2_sg_id

  user_data = base64encode(data.template_file.asg_user_data.rendered)

}
module "route53" {
  source = "./modules/route53"
}



