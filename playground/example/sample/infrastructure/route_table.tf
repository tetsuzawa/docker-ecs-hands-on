resource "aws_route_table" "hands_on_public_1a" {
  vpc_id = aws_vpc.hands_on.id

  tags = {
    Name = "hands-on-public-1a"
  }
}

resource "aws_route_table" "hands_on_public_1c" {
  vpc_id = aws_vpc.hands_on.id

  tags = {
    Name = "hands-on-public-1a"
  }
}

resource "aws_route_table" "hands_on_public_1d" {
  vpc_id = aws_vpc.hands_on.id

  tags = {
    Name = "hands-on-public-1a"
  }
}

# private subnetから外部に通信したいときに使う (nat_gateway, eip, route_table, route, route_table_association)を追加
//resource "aws_route_table" "hands_on_private_1a" {
//  vpc_id = aws_vpc.hands_on.id
//
//  tags = {
//    Name = "hands-on-private-1a"
//  }
//}
//
//resource "aws_route_table" "hands_on_private_1c" {
//  vpc_id = aws_vpc.hands_on.id
//
//  tags = {
//    Name = "hands-on-private-1a"
//  }
//}
//
//resource "aws_route_table" "hands_on_private_1d" {
//  vpc_id = aws_vpc.hands_on.id
//
//  tags = {
//    Name = "hands-on-private-1a"
//  }
//}
