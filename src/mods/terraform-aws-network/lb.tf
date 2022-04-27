resource "aws_lb" "this" {
  name                       = "${var.prefix}-external-lb"
  load_balancer_type         = "application"
  internal                   = false
  enable_deletion_protection = false # Just for testing purposes ;)
  enable_http2               = true
  idle_timeout               = 300

  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
  ]

  security_groups = [
    aws_security_group.this.id,
  ]

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-external-lb",
    "Resource" = "lb",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.id
  port              = 80
  protocol          = "HTTP" # Just for testing purposes ;)

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "It works!"
      status_code  = "200"
    }
  }
}
