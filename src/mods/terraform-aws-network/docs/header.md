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
