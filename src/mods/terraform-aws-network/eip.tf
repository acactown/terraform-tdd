resource "aws_eip" "a" {
  vpc = true

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-nat-eip-a",
    "Resource" = "eip",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_eip" "b" {
  vpc = true

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-nat-eip-b",
    "Resource" = "eip",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}
