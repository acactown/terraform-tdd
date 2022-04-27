package main

deny[msg] {
    subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.public_a"]
    subnets[0].values.cidr_block != "10.128.0.0/20"
    subnets[0].values.availability_zone != "us-east-1a"
    msg = sprintf("Public Subnet A has wrong CIDR: `%v`", [subnets[0].values.cidr_block])
}

deny[msg] {
    subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.public_b"]
    subnets[0].values.cidr_block != "10.128.16.0/20"
    subnets[0].values.availability_zone != "us-east-1b"
    msg = sprintf("Public Subnet B has wrong CIDR: `%v`", [subnets[0].values.cidr_block])
}

deny[msg] {
    subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.private_a"]
    subnets[0].values.cidr_block != "10.128.32.0/20"
    subnets[0].values.availability_zone != "us-east-1a"
    msg = sprintf("Public Subnet A has wrong CIDR: `%v`", [subnets[0].values.cidr_block])
}

deny[msg] {
    subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.private_b"]
    subnets[0].values.cidr_block != "10.128.48.0/20"
    subnets[0].values.availability_zone != "us-east-1b"
    msg = sprintf("Public Subnet B has wrong CIDR: `%v`", [subnets[0].values.cidr_block])
}

deny[msg] {
    subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.restricted_a"]
    subnets[0].values.cidr_block != "10.128.64.0/20"
    subnets[0].values.availability_zone != "us-east-1a"
    msg = sprintf("Public Rectricted A has wrong CIDR: `%v`", [subnets[0].values.cidr_block])
}

deny[msg] {
    subnets := [r | r := input.planned_values.root_module.resources[_]; r.address == "aws_subnet.restricted_b"]
    subnets[0].values.cidr_block != "10.128.80.0/20"
    subnets[0].values.availability_zone != "us-east-1b"
    msg = sprintf("Public Rectricted A has wrong CIDR: `%v`", [subnets[0].values.cidr_block])
}
