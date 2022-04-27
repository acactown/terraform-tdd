resource "aws_route53_zone" "public" {
  name = local.subdomain

  tags = merge(local.common_tags, {
    "Name"     = local.subdomain,
    "Resource" = "route53_zone",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_route53_zone" "private" {
  name = local.subdomain

  vpc {
    vpc_id = aws_vpc.this.id
  }

  tags = merge(local.common_tags, {
    "Name"     = local.subdomain,
    "Resource" = "route53_zone",
  })

  lifecycle {
    ignore_changes = [
      vpc,
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}
