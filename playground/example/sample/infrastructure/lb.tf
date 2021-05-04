resource "aws_lb" "hands_on" {
  name = "hands-on-lb"
  load_balancer_type = "application"
//  security_groups = [
//    aws_security_group.lb_sg.id]
  subnets = [
    aws_subnet.hands_on_public_1a.id,
    aws_subnet.hands_on_public_1c.id,
    aws_subnet.hands_on_public_1d.id]

  tags = {
    Name = "hands-on-lb"
  }
}