resource "aws_route_table_association" "route_table_association_public" {
  route_table_id = aws_route_table.route_table_public.id
  subnet_id = aws_subnet.subnet_public.id
}

resource "aws_route_table_association" "route_table_association_private" {
  route_table_id = aws_route_table.route_table_private.id
  subnet_id = aws_subnet.subnet_private.id
}