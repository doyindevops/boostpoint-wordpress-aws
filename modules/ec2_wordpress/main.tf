resource "aws_instance" "wordpress" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_name

  user_data = templatefile("${path.module}/user_data.sh.tpl", {
    db_name = var.db_name
    db_user = var.db_user
    db_pass = var.db_password
    db_host = var.db_host
  })

  tags = {
    Name = "${var.project}-wp"
  }
}
