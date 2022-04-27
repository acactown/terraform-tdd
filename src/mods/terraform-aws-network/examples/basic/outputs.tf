output "aws_vpc" {
  description = "The created VPC"
  value       = module.example.aws_vpc
}

output "aws_subnet" {
  description = "The created Subnets"
  value       = module.example.aws_subnet
}

output "aws_lb" {
  description = "The created External Load Balancer"
  value       = module.example.aws_lb
}

output "aws_lb_listener" {
  description = "The created External Load Balancer Listener"
  value       = module.example.aws_lb_listener
}

output "aws_route53_zone" {
  description = "The created Route53 Hosted Zones"
  value       = module.example.aws_route53_zone
}
