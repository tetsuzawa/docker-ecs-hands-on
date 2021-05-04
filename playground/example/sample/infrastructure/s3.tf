resource "aws_s3_bucket" "hands_on_lb_logs" {
  bucket = "hands-on-lb-logs"
  acl    = "private"

  tags = {
    Name        = "hands-on-lb-logs"
  }
}

resource "aws_s3_bucket" "hands_on_credentials" {
  bucket = "hands-on-credentials"
  acl    = "private"

  tags = {
    Name        = "hands-on-credentials"
  }
}
