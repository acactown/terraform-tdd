variable "prefix" {
  description = "The env prefix to use for the resources"
  type        = string
}

variable "domain" {
  description = "The domain where resources will be deployed"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}

variable "cidr_block" {
  description = "The CIDR block to use for the VPC"
  type        = string
}

variable "allowed_waf_cidrs" {
  description = "Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in CIDR notation"
  type        = list(string)
}

variable "allowed_waf_country_codes" {
  description = "Contains an array of strings that specify one or country codes"
  type        = list(string)
}
