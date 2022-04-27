package main

deny[msg] {
    not input.locals
    msg = "Define locals"
}

deny[msg] {
    not input.locals.subdomain == "${var.prefix}.${var.domain}"
    msg = "Subdomain should be calculated `${var.prefix}.${var.domain}`"
}

deny[msg] {
    not input.locals.cidr_block == "${var.cidr_block}/16"
    msg = "VPC CIDR Block should be calculated `${var.cidr_block}/16`"
}
