resource "aws_route_table_association" "hands_on_public_1a" {
  route_table_id = aws_route_table.hands_on_public_1a.id
  subnet_id      = aws_subnet.hands_on_public_1a.id
}

resource "aws_route_table_association" "hands_on_public_1c" {
  route_table_id = aws_route_table.hands_on_public_1c.id
  subnet_id      = aws_subnet.hands_on_public_1c.id
}

resource "aws_route_table_association" "hands_on_public_1d" {
  route_table_id = aws_route_table.hands_on_public_1d.id
  subnet_id      = aws_subnet.hands_on_public_1d.id
}
