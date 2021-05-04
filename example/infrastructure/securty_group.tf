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

# for web
resource "aws_security_group" "hands_on_web" {
  name        = "hands-on-web"
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
    Name = "hands-on-web"
  }
}

# for service1
resource "aws_security_group" "service1" {
  name        = "service1"
  vpc_id      = aws_vpc.hands_on.id

  ingress {
    description      = "HTTP VPC"
    from_port        = 9001
    to_port          = 9001
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
    Name = "hands-on-service1"
  }
}

# for service2
resource "aws_security_group" "service2" {
  name        = "service2"
  vpc_id      = aws_vpc.hands_on.id

    ingress {
      description      = "HTTP VPC"
      from_port        = 9002
      to_port          = 9002
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
    Name = "hands-on-service2"
  }
}
