config {
  module              = true
  force               = false
  disabled_by_default = false

  varfile = [
    "terraform.example.tfvars",
  ]
}

plugin "aws" {
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  version = "0.13.3"

  enabled = true
}

rule "terraform_standard_module_structure" {
  enabled = false
}

rule "aws_instance_invalid_type" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}

rule "terraform_documented_outputs" {
  enabled = true
}

rule "terraform_documented_variables" {
  enabled = true
}

rule "terraform_naming_convention" {
  enabled = true

  variable {
    format = "snake_case"
  }

  locals {
    format = "snake_case"
  }

  output {
    format = "snake_case"
  }

  resource {
    format = "snake_case"
  }

  module {
    format = "snake_case"
  }

  data {
    format = "snake_case"
  }
}
