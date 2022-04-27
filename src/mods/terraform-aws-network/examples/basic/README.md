# Basic Network Example

Configuration in this directory creates which creates all Network capabilities: Support many of features of VPC, Route Tables, Subnets, but rather limited support for WAF v2

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.11.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_example"></a> [example](#module\_example) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_waf_cidrs"></a> [allowed\_waf\_cidrs](#input\_allowed\_waf\_cidrs) | Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in CIDR notation | `list(string)` | n/a | yes |
| <a name="input_allowed_waf_country_codes"></a> [allowed\_waf\_country\_codes](#input\_allowed\_waf\_country\_codes) | Contains an array of strings that specify one or country codes | `list(string)` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The CIDR block to use for the VPC | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to be applied to all resources | `map(string)` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The domain where resources will be deployed | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The env prefix to use for the resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where resources will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_lb"></a> [aws\_lb](#output\_aws\_lb) | The created External Load Balancer |
| <a name="output_aws_lb_listener"></a> [aws\_lb\_listener](#output\_aws\_lb\_listener) | The created External Load Balancer Listener |
| <a name="output_aws_route53_zone"></a> [aws\_route53\_zone](#output\_aws\_route53\_zone) | The created Route53 Hosted Zones |
| <a name="output_aws_subnet"></a> [aws\_subnet](#output\_aws\_subnet) | The created Subnets |
| <a name="output_aws_vpc"></a> [aws\_vpc](#output\_aws\_vpc) | The created VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
