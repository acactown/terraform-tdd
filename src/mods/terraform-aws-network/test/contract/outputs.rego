package main

deny[msg] {
    aws_lb := input.configuration.root_module.outputs.aws_lb.expression.references
    "aws_lb.this.id" == [aws_lb][0]
    "aws_lb.this.arn" == [aws_lb][0]
    "aws_lb.this.dns_name" == [aws_lb][0]
    "aws_lb.this.zone_id" == [aws_lb][0]
    msg = sprintf("`aws_alb` output has wrong values: `%v`", [aws_lb])
}
