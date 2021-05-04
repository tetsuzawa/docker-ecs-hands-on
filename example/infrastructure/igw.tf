resource "aws_internet_gateway" "hands_on" {
  vpc_id = aws_vpc.hands_on.id

  tags = {
    Name = "hands-on-igw"
  }
}