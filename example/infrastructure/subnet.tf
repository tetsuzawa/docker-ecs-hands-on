resource "aws_subnet" "hands_on_public_1a" {
  vpc_id            = aws_vpc.hands_on.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "hands-on-public-1a"
  }
}

resource "aws_subnet" "hands_on_public_1c" {
  vpc_id            = aws_vpc.hands_on.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "hands-on-public-1c"
  }
}

resource "aws_subnet" "hands_on_public_1d" {
  vpc_id            = aws_vpc.hands_on.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name = "hands-on-public-1d"
  }
}

//resource "aws_subnet" "hands_on_private_1a" {
//  vpc_id            = aws_vpc.hands_on.id
//  cidr_block        = "10.0.11.0/24"
//  availability_zone = "ap-northeast-1a"
//
//  tags = {
//    Name = "hands-on-private-1a"
//  }
//}
//
//resource "aws_subnet" "hands_on_private_1c" {
//  vpc_id            = aws_vpc.hands_on.id
//  cidr_block        = "10.0.13.0/24"
//  availability_zone = "ap-northeast-1c"
//
//  tags = {
//    Name = "hands-on-private-1c"
//  }
//}
//
//resource "aws_subnet" "hands_on_private_1d" {
//  vpc_id            = aws_vpc.hands_on.id
//  cidr_block        = "10.0.14.0/24"
//  availability_zone = "ap-northeast-1d"
//
//  tags = {
//    Name = "hands-on-private-1d"
//  }
//}
