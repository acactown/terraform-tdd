<!-- BEGIN_TF_DOCS -->
<div id="top"></div>

[![terraform](https://img.shields.io/badge/terraform-v1.1.X-purple.svg)](https://www.terraform.io/)
[![aws-vault](https://img.shields.io/badge/awsvault-v6.3.X-yellow.svg)](https://github.com/99designs/aws-vault)
[![make](https://img.shields.io/badge/make-v4.2.X-yellow.svg)](https://www.gnu.org/software/make/)
[![git](https://img.shields.io/badge/git-v2.30.X-red.svg)](https://git-scm.com/)

<br />

<div align="center">
    <a href="https://github.com/acactown/terraform-tdd/src/mods/terraform-aws-network">
        <img src="https://www.pngitem.com/pimgs/m/513-5132146_terraform-icon-png-transparent-png.png" alt="Logo" width="80" height="80">
    </a>

    <h3 align="center">terraform-aws-network</h3>

    <p align="center">
        Terraform module which creates all Network capabilities. `:wq`
        <br />
        <a href="https://github.com/acactown/terraform-tdd/issues">Report Bug</a>
        ·
        <a href="https://github.com/acactown/terraform-tdd/projects/1">Request Feature</a>
    </p>
</div>

## Table of Contents

* [Prerequisites](#prerequisites)
* [Supported Features](#supported-features)
* [Feature Roadmap](#feature-roadmap)
* [Usage](#usage)
* [Notes](#notes)
* [Diagram](#diagram)
* [Examples](#examples)
* [Requirements](#requirements)
* [Providers](#providers)
* [Modules](#modules)
* [Resources](#resources)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Contributing](#contributing)
* [Contact](#contact)
* [Further Reading / Useful Links](#further-reading--useful-links)

<p align="right">(<a href="#top">back to top</a>)</p>

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Terraform](https://www.terraform.io/downloads.html)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)  
* [AWS Vault](https://github.com/99designs/aws-vault)
* [Docker](https://www.docker.com/)
* [Golang](https://golang.org/)

<p align="right">(<a href="#top">back to top</a>)</p>

## Supported Features

* Support many of features of VPC, Route Tables, Subnets, but rather limited support for WAF v2
* Conditional creation for many types of resources

<p align="right">(<a href="#top">back to top</a>)</p>

## Feature Roadmap

* Some features are still missing (especially for WAF v2 support)

<p align="right">(<a href="#top">back to top</a>)</p>

## Usage

### Basic resource creation

<!--- editorconfig-checker-disable -->
```terraform
module "network" {
  source = "../mods/terraform-aws-network"

  prefix = "test"
  domain = "domain.app"

  common_tags = {
    "Project" = "tdd",
    "Origin"  = "terraform",
  }

  cidr_block = "10.128.0.0"

  allowed_waf_cidrs = [
    "192.30.252.153/32",
    "192.30.252.154/32",
    "185.199.108.153/32",
    "185.199.109.153/32",
    "185.199.110.153/32",
    "185.199.111.153/32",
  ]

  allowed_waf_country_codes = [
    "CO",
    "US",
  ]
}
```
<!--- editorconfig-checker-enable -->

<p align="right">(<a href="#top">back to top</a>)</p>

## Notes

* Make sure provider block has the setting of `skip_requesting_account_id` disabled (false) to produce correct value in the `execution_arn`.

<p align="right">(<a href="#top">back to top</a>)</p>

## Diagram

[![diagram](./docs/diagram.png)](./docs/diagram.drawio.xml)

<p align="right">(<a href="#top">back to top</a>)</p>

## Examples

* [Basic](./examples/basic) - Create VPC, Subnets, Route Tables, Security Groups, Application Load Balancer and WAF

<p align="right">(<a href="#top">back to top</a>)</p>

#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | 1.1.3 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | 4.11.0 |
<p align="right">(<a href="#top">back to top</a>)</p>
#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | 4.11.0 |
<p align="right">(<a href="#top">back to top</a>)</p>
#### Modules

No modules.
<p align="right">(<a href="#top">back to top</a>)</p>
#### Resources

| Name | Type |
|------|------|
| [aws_eip.a](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/eip) | resource |
| [aws_eip.b](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/eip) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/internet_gateway) | resource |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/lb) | resource |
| [aws_lb_listener.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/lb_listener) | resource |
| [aws_nat_gateway.a](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.b](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/nat_gateway) | resource |
| [aws_route.internet_gateway_route](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route) | resource |
| [aws_route.nat_a_route](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route) | resource |
| [aws_route.nat_b_route](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route53_zone) | resource |
| [aws_route53_zone.public](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route53_zone) | resource |
| [aws_route_table.direct](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table) | resource |
| [aws_route_table.nat_a](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table) | resource |
| [aws_route_table.nat_b](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_a_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_b_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_a_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_b_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.restricted_a_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.restricted_b_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/route_table_association) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/security_group) | resource |
| [aws_subnet.private_a](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/subnet) | resource |
| [aws_subnet.private_b](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/subnet) | resource |
| [aws_subnet.public_a](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/subnet) | resource |
| [aws_subnet.public_b](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/subnet) | resource |
| [aws_subnet.restricted_a](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/subnet) | resource |
| [aws_subnet.restricted_b](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/vpc) | resource |
| [aws_vpc_dhcp_options.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/vpc_dhcp_options) | resource |
| [aws_vpc_dhcp_options_association.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/vpc_dhcp_options_association) | resource |
| [aws_wafv2_ip_set.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/wafv2_ip_set) | resource |
| [aws_wafv2_web_acl.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/wafv2_web_acl) | resource |
| [aws_wafv2_web_acl_association.this](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/resources/wafv2_web_acl_association) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.11.0/docs/data-sources/region) | data source |
<p align="right">(<a href="#top">back to top</a>)</p>
#### Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| <a name="input_allowed_waf_cidrs"></a> [allowed_waf_cidrs](#input_allowed_waf_cidrs) | Contains an array of strings that specify one or more IP addresses or blocks of IP addresses in CIDR notation | `list(string)` | n/a |
| <a name="input_allowed_waf_country_codes"></a> [allowed_waf_country_codes](#input_allowed_waf_country_codes) | Contains an array of strings that specify one or country codes | `list(string)` | n/a |
| <a name="input_cidr_block"></a> [cidr_block](#input_cidr_block) | The CIDR block to use for the VPC | `string` | n/a |
| <a name="input_common_tags"></a> [common_tags](#input_common_tags) | Common tags to be applied to all resources | `map(string)` | n/a |
| <a name="input_domain"></a> [domain](#input_domain) | The domain where resources will be deployed | `string` | n/a |
| <a name="input_prefix"></a> [prefix](#input_prefix) | The env prefix to use for the resources | `string` | n/a |
<p align="right">(<a href="#top">back to top</a>)</p>
#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_lb"></a> [aws_lb](#output_aws_lb) | The created External Load Balancer |
| <a name="output_aws_lb_listener"></a> [aws_lb_listener](#output_aws_lb_listener) | The created External Load Balancer Listener |
| <a name="output_aws_route53_zone"></a> [aws_route53_zone](#output_aws_route53_zone) | The created Route53 Hosted Zones |
| <a name="output_aws_subnet"></a> [aws_subnet](#output_aws_subnet) | The created Subnets |
| <a name="output_aws_vpc"></a> [aws_vpc](#output_aws_vpc) | The created VPC |
<p align="right">(<a href="#top">back to top</a>)</p>
## Contributing

Contributions are what make community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please create a pull request.

Don't forget to give the project a star! Thanks again!

1. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
2. Commit your Changes (`git commit -m '✨ #101: Add some AmazingFeature'`)
3. Push to the Branch (`git push origin feature/AmazingFeature`)
4. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

## Contact

* Andrés Amado - [@acactown](https://github.com/acactown) - acactown@gmail.com

__Project Link:__ [https://github.com/acactown/terraform-tdd](https://github.com/acactown/terraform-tdd/projects/1)

<p align="right">(<a href="#top">back to top</a>)</p>

## Further Reading / Useful Links

I've included a few of my favorite sites to kick things off!

* [Awesome Terraform](https://awesomerepos.io/awesome/shuaibiyy/awesome-terraform)
* [Using AWS-Vault to securely manage access to AWS](https://www.turbogeek.co.uk/using-aws-vault-to-securely-manage-access-to-aws/)
* [How to Manage Your Secrets with git-crypt](https://dev.to/heroku/how-to-manage-your-secrets-with-git-crypt-56ih)
* [The Best GitHub Actions You Should Use](https://blog.mergify.com/the-best-github-action-you-should-use/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- END_TF_DOCS -->