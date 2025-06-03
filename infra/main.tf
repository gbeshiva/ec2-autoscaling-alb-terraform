
provider "aws" {
  region = var.region
}

resource "aws_launch_template" "web_app" {
  name_prefix   = "web-app-template"
  image_id      = var.ami_id # Amazon Linux 2 AMI
  instance_type = var.instance_type

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Welcome to the Auto Scaling Web App</h1>" > /var/www/html/index.html
              EOF
  )
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = var.desire_count
  max_size             = var.max_count
  min_size             = var.min_count
  vpc_zone_identifier  = var.subnet_ids
  launch_template {
    id      = aws_launch_template.web_app.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "web-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_lb" "app_lb" {
  name               = "web-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_id
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}
