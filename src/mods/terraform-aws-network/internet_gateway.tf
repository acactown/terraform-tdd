resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-internet-gateway",
    "Resource" = "internet_gateway",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}
