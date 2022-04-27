resource "aws_route_table" "direct" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-direct-route-table",
    "Resource" = "route_table",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_route" "internet_gateway_route" {
  route_table_id         = aws_route_table.direct.id
  gateway_id             = aws_internet_gateway.this.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "public_a_route_table_association" {
  route_table_id = aws_route_table.direct.id
  subnet_id      = aws_subnet.public_a.id
}

resource "aws_route_table_association" "public_b_route_table_association" {
  route_table_id = aws_route_table.direct.id
  subnet_id      = aws_subnet.public_b.id
}

resource "aws_route_table" "nat_a" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-nat-route-table-a",
    "Resource" = "route_table",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_route" "nat_a_route" {
  route_table_id         = aws_route_table.nat_a.id
  nat_gateway_id         = aws_nat_gateway.a.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private_a_route_table_association" {
  route_table_id = aws_route_table.nat_a.id
  subnet_id      = aws_subnet.private_a.id
}

resource "aws_route_table_association" "restricted_a_route_table_association" {
  route_table_id = aws_route_table.nat_a.id
  subnet_id      = aws_subnet.restricted_a.id
}

resource "aws_route_table" "nat_b" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-nat-route-table-b",
    "Resource" = "route_table",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_route" "nat_b_route" {
  route_table_id         = aws_route_table.nat_b.id
  nat_gateway_id         = aws_nat_gateway.b.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "private_b_route_table_association" {
  route_table_id = aws_route_table.nat_b.id
  subnet_id      = aws_subnet.private_b.id
}

resource "aws_route_table_association" "restricted_b_route_table_association" {
  route_table_id = aws_route_table.nat_b.id
  subnet_id      = aws_subnet.restricted_b.id
}
