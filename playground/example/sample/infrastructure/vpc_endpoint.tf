resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.hands_on.id
  service_name      = "com.amazonaws.ap-northeast-1.s3"
  vpc_endpoint_type = "Gateway"

  tags = {
    Name = "hands-on-s3"
  }
}