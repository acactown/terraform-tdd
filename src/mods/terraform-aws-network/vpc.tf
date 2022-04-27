resource "aws_vpc" "this" {
  cidr_block                       = local.cidr_block
  enable_dns_hostnames             = true
  enable_dns_support               = true
  assign_generated_ipv6_cidr_block = false
  instance_tenancy                 = "default"

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-vpc",
    "Resource" = "vpc",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_vpc_dhcp_options" "this" {
  domain_name = ""

  domain_name_servers = [
    "AmazonProvidedDNS",
  ]

  ntp_servers = [
    "186.155.28.147",
  ]

  netbios_name_servers = []
  netbios_node_type    = ""

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-vpc-dhcp-options",
    "Resource" = "vpc_dhcp_options",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_vpc_dhcp_options_association" "this" {
  vpc_id          = aws_vpc.this.id
  dhcp_options_id = aws_vpc_dhcp_options.this.id
}
