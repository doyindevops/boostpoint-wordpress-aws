resource "aws_eip" "nat_eip" {
  count  = 2
  domain = "vpc"

  tags = {
    Name = "boostpoint-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  count         = 2
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = var.public_subnet_ids[count.index]
  depends_on    = [var.igw_id]

  tags = {
    Name = "boostpoint-nat-gateway-${count.index + 1}"
  }
}

resource "aws_route_table" "private_rt" {
  count  = 2
  vpc_id = var.vpc_id

  tags = {
    Name = "boostpoint-private-rt-${count.index + 1}"
  }
}

resource "aws_route" "private_nat_route" {
  count                  = 2
  route_table_id         = aws_route_table.private_rt[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw[count.index].id
}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = 2
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_rt[count.index].id
}
