provider "aws" {
  region = var.region
}

module "example" {
  source = "../../"

  prefix      = var.prefix
  domain      = var.domain
  common_tags = var.common_tags
  cidr_block  = var.cidr_block

  allowed_waf_cidrs         = var.allowed_waf_cidrs
  allowed_waf_country_codes = var.allowed_waf_country_codes
}
