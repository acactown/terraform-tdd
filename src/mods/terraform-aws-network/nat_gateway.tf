resource "aws_nat_gateway" "a" {
  allocation_id = aws_eip.a.id
  subnet_id     = aws_subnet.public_a.id

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-nat-gateway-a",
    "Resource" = "nat_gateway",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_nat_gateway" "b" {
  allocation_id = aws_eip.b.id
  subnet_id     = aws_subnet.public_b.id

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-nat-gateway-b",
    "Resource" = "nat_gateway",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}
