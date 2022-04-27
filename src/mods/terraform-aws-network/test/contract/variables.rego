package main

contains_variables(variables) {
    endswith(variables.prefix.value, "-test")
    "192.30.252.153/32" == variables.allowed_waf_cidrs.value[0]
    "CO" == variables.allowed_waf_country_codes.value[0]
    "10.128.0.0" == variables.cidr_block.value
    "domain.app" == variables.domain.value
}

deny[msg] {
    not contains_variables(input.variables)
    msg = "Variables are not populated with expected values"
}
