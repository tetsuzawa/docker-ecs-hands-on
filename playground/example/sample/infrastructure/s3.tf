resource "aws_s3_bucket" "hands_on_credentials" {
  bucket = "hands-on-credentials"
  acl    = "private"

  tags = {
    Name        = "hands-on-credentials"
  }
}
