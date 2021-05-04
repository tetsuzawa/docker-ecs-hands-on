# for LB
resource "aws_security_group" "hands_on_alb" {
  name        = "hands-on-alb"
  vpc_id      = aws_vpc.hands_on.id

  ingress {
    description      = "HTTP VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.hands_on.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "hands-on-alb"
  }
}