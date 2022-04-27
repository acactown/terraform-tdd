resource "aws_subnet" "public_a" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = cidrsubnet(local.cidr_block, 4, 0)
  availability_zone               = "${data.aws_region.current.name}a"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-public-subnet-a",
    "Resource" = "subnet",
    "Tier"     = "Public",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = cidrsubnet(local.cidr_block, 4, 1)
  availability_zone               = "${data.aws_region.current.name}b"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-public-subnet-b"
    "Resource" = "subnet"
    "Tier"     = "Public"
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_subnet" "private_a" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = cidrsubnet(local.cidr_block, 4, 2)
  availability_zone               = "${data.aws_region.current.name}a"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-private-subnet-a"
    "Resource" = "subnet"
    "Tier"     = "Private"
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_subnet" "private_b" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = cidrsubnet(local.cidr_block, 4, 3)
  availability_zone               = "${data.aws_region.current.name}b"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-private-subnet-b"
    "Resource" = "subnet"
    "Tier"     = "Private"
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_subnet" "restricted_a" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = cidrsubnet(local.cidr_block, 4, 4)
  availability_zone               = "${data.aws_region.current.name}a"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-restricted-subnet-a"
    "Resource" = "subnet"
    "Tier"     = "Restricted"
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_subnet" "restricted_b" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = cidrsubnet(local.cidr_block, 4, 5)
  availability_zone               = "${data.aws_region.current.name}b"
  map_public_ip_on_launch         = false
  assign_ipv6_address_on_creation = false


  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-restricted-subnet-b"
    "Resource" = "subnet"
    "Tier"     = "Restricted"
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}
