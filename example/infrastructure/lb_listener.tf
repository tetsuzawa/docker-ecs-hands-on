resource "aws_lb_listener" "hands_on" {
  load_balancer_arn = aws_lb.hands_on.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.hands_on_instance_web.arn
  }
}