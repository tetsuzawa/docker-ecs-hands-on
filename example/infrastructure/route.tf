resource "aws_route" "hands_on_public_1a_igw" {
  route_table_id = aws_route_table.hands_on_public_1a.id
  gateway_id = aws_internet_gateway.hands_on.id
  destination_cidr_block = "0.0.0.0/0"
}
