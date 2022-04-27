package main

deny[msg] {
    not input.resource.aws_vpc.this
    msg = "Define VPC resource"
}

deny[msg] {
    not contains(input.resource.aws_vpc.this.cidr_block, "local.cidr_block")
    msg = "App VPC CIDR Block should be calculated `local.cidr_block`"
}

deny[msg] {
    not contains(input.resource.aws_vpc.this.tags, "Name")
    msg = "App VPC missing tag `Name`"
}

deny[msg] {
    not contains(input.resource.aws_vpc.this.tags, "Resource")
    msg = "App VPC missing tag `Resource`"
}

deny[msg] {
    not input.resource.aws_vpc.this.enable_dns_hostnames
    msg = "DNS hostnames shoul be enabled"
}

deny[msg] {
    input.resource.aws_vpc.this.assign_generated_ipv6_cidr_block
    msg = "Assign IPv6 should be disabled"
}

deny[msg] {
    not contains(input.resource.aws_vpc_dhcp_options.this.ntp_servers[0], "186.155.28.147")
    msg = "Configure DHCP NTP Server options"
}
