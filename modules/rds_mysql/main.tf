resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.project}-rds-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "${var.project}-rds-subnet-group"
  }
}

resource "aws_db_instance" "wordpress" {
  identifier              = "${var.project}-mysql-db"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.db_user
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids  = [var.sg_rds]
  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name = "${var.project}-mysql-db"
  }
}

