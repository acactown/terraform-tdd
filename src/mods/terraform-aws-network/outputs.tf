output "aws_vpc" {
  description = "The created VPC"

  value = {
    id  = aws_vpc.this.id
    arn = aws_vpc.this.arn
  }
}

output "aws_subnet" {
  description = "The created Subnets"

  value = {
    public = {
      a = {
        id  = aws_subnet.public_a.id
        arn = aws_subnet.public_a.arn
      }
      b = {
        id  = aws_subnet.public_b.id
        arn = aws_subnet.public_b.arn
      }
    }

    private = {
      a = {
        id  = aws_subnet.private_a.id
        arn = aws_subnet.private_a.arn
      }
      b = {
        id  = aws_subnet.private_b.id
        arn = aws_subnet.private_b.arn
      }
    }

    restricted = {
      a = {
        id  = aws_subnet.restricted_a.id
        arn = aws_subnet.restricted_a.arn
      }
      b = {
        id  = aws_subnet.restricted_b.id
        arn = aws_subnet.restricted_b.arn
      }
    }
  }
}

output "aws_lb" {
  description = "The created External Load Balancer"

  value = {
    id       = aws_lb.this.id
    arn      = aws_lb.this.arn
    dns_name = aws_lb.this.dns_name
    zone_id  = aws_lb.this.zone_id
  }
}

output "aws_lb_listener" {
  description = "The created External Load Balancer Listener"

  value = {
    id  = aws_lb_listener.this.id
    arn = aws_lb_listener.this.arn
  }
}

output "aws_route53_zone" {
  description = "The created Route53 Hosted Zones"

  value = {
    public = {
      arn     = aws_route53_zone.public.arn
      zone_id = aws_route53_zone.public.zone_id
    }

    private = {
      arn     = aws_route53_zone.private.arn
      zone_id = aws_route53_zone.private.zone_id
    }
  }
}
