resource "aws_launch_template" "wordpress" {
  name_prefix   = "${var.project}-lt-"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.launch_template_sg_id]

  user_data = var.user_data


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.project}-wordpress"
    }
  }
}

resource "aws_autoscaling_group" "wordpress_asg" {
  desired_capacity     = 1
  max_size             = 2
  min_size             = 1
  vpc_zone_identifier  = var.asg_subnet_ids
  launch_template {
    id      = aws_launch_template.wordpress.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-wordpress-asg"
    propagate_at_launch = true
  }
}
