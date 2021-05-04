resource "aws_lb_target_group" "hands_on_instance_web" {
  name     = "hands-on-instance-web"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.hands_on.id

  tags = {
    Name = "hands-on-instance-web"
  }
}