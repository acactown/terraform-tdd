prefix = "12345-test"

domain = "domain.app"

common_tags = {
  "Environment" = "test",
  "Domain"      = "domain.app"
  "Project"     = "tdd",
  "Origin"      = "terraform",
}

cidr_block = "10.128.0.0"

allowed_waf_cidrs = [
  "192.30.252.153/32",
  "192.30.252.154/32",
  "185.199.108.153/32",
  "185.199.109.153/32",
  "185.199.110.153/32",
  "185.199.111.153/32",
]

allowed_waf_country_codes = [
  "CO",
  "US",
]
