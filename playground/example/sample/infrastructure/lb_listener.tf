resource "aws_lb_listener" "hands_on" {
  load_balancer_arn = aws_lb.hands_on.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
  }
}