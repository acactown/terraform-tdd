locals {
  subdomain = "${var.prefix}.${var.domain}"

  cidr_block = "${var.cidr_block}/16"

  common_tags = merge(var.common_tags, {
    "Module" = basename(abspath(path.module)),
  })
}
