output "ec2_sg_id" {
  value = aws_security_group.ec2.id
}

output "alb_sg" {
  value = aws_security_group.alb.id
}

output "rds_sg_id" {
  value = aws_security_group.rds.id
}

output "efs_sg_id" {
  value = aws_security_group.efs.id
}

output "rds_sg" {
  value = aws_security_group.rds.id
}
