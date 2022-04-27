package main

subnetWithTierTag[api.id] {
    api := input.aws_subnet[_]
    tags := api.config.tags
    contains(tags, "Tier")
}
