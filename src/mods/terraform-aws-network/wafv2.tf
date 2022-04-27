resource "aws_wafv2_ip_set" "this" {
  name               = "${var.prefix}-waf-allowed-ip-set"
  description        = "Allowed IPs"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"
  addresses          = var.allowed_waf_cidrs

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-waf-allowed-ip-set",
    "Resource" = "wafv2_ip_set",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_wafv2_web_acl" "this" {
  name        = "${var.prefix}-waf-web-regional-acl"
  description = "Regional WAF Web ACL"
  scope       = "REGIONAL"

  default_action {
    block {}
  }

  rule {
    name     = "${var.prefix}-AWS-AWSManagedRulesAmazonIpReputationList"
    priority = 0

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesAmazonIpReputationList"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-AWS-AWSManagedRulesAmazonIpReputationList"
    }
  }

  rule {
    name     = "${var.prefix}-wafrule-rate-based"
    priority = 1

    action {
      block {}
    }

    statement {
      rate_based_statement {
        limit              = 1500
        aggregate_key_type = "IP"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-wafrule-rate-based"
    }
  }

  rule {
    name     = "${var.prefix}-AWS-AWSManagedRulesCommonRuleSet"
    priority = 2

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        excluded_rule {
          name = "SizeRestrictions_BODY"
        }
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-AWS-AWSManagedRulesCommonRuleSet"
    }
  }

  rule {
    name     = "${var.prefix}-AWS-AWSManagedRulesKnownBadInputsRuleSet"
    priority = 3

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-AWS-AWSManagedRulesKnownBadInputsRuleSet"
    }
  }

  rule {
    name     = "${var.prefix}-AWS-AWSManagedRulesSQLiRuleSet"
    priority = 4

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesSQLiRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-AWS-AWSManagedRulesSQLiRuleSet"
    }
  }

  rule {
    name     = "${var.prefix}-AWS-AWSManagedRulesLinuxRuleSet"
    priority = 5

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesLinuxRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-AWS-AWSManagedRulesLinuxRuleSet"
    }
  }

  rule {
    name     = "${var.prefix}-AWS-AWSManagedRulesUnixRuleSet"
    priority = 6

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesUnixRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-AWS-AWSManagedRulesUnixRuleSet"
    }
  }

  rule {
    name     = "${var.prefix}-wafrule-allowed-origins"
    priority = 7

    action {
      allow {}
    }

    statement {
      or_statement {
        statement {
          geo_match_statement {
            country_codes = var.allowed_waf_country_codes
          }
        }
        statement {
          ip_set_reference_statement {
            arn = aws_wafv2_ip_set.this.arn
          }
        }
      }
    }

    visibility_config {
      sampled_requests_enabled   = true
      cloudwatch_metrics_enabled = false
      metric_name                = "${var.prefix}-wafrule-allowed-origins"
    }
  }

  visibility_config {
    sampled_requests_enabled   = true
    cloudwatch_metrics_enabled = false
    metric_name                = "${var.prefix}-waf-web-regional-acl"
  }

  tags = merge(local.common_tags, {
    "Name"     = "${var.prefix}-waf-web-regional-acl",
    "Resource" = "wafv2_web_acl",
  })

  lifecycle {
    ignore_changes = [
      tags["CreatedBy"],
      tags["CreatedOn"],
    ]
  }
}

resource "aws_wafv2_web_acl_association" "this" {
  web_acl_arn  = aws_wafv2_web_acl.this.arn
  resource_arn = aws_lb.this.arn
}
