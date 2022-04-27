package main

deny[msg] {
    not input.resource.aws_subnet.public_a
    msg = "Define public subnet A resource"
}

deny[msg] {
    not input.resource.aws_subnet.public_b
    msg = "Define public subnet B resource"
}

deny[msg] {
    not input.resource.aws_subnet.private_a
    msg = "Define private subnet A resource"
}

deny[msg] {
    not input.resource.aws_subnet.private_b
    msg = "Define private subnet B resource"
}

deny[msg] {
    not input.resource.aws_subnet.restricted_a
    msg = "Define restricted subnet A resource"
}

deny[msg] {
    not input.resource.aws_subnet.restricted_b
    msg = "Define restricted subnet B resource"
}

deny[msg] {
    input.resource.aws_subnet.public_a.map_public_ip_on_launch
    msg = "Public Subnet CIDR Block is not public"
}
