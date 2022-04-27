resource "aws_security_group" "this" {
  name        = "${var.prefix}-external-lb-security-group"
  description = "External LB SG"
  vpc_id      = aws_vpc.this.id

  ingress = [
    {
      description      = "Allow HTTP from ALL"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]

  egress = [
    {
      description      = "Allow ALL egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
  ]

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-external-lb-security-group",
    "Resource" = "security_group",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}
