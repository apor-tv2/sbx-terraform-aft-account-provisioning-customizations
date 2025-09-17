data "aws_organizations_organization" "current" {}

output "organization_id" {
  value = data.aws_organizations_organization.current.id
}

module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "aft-notifications-orgreadable"

  topic_policy_statements = {
    pub = {
      actions = ["sns:Publish"]
      principals = [{
        type        = "AWS"
        identifiers = [data.aws_caller_identity.current.account_id]
      }]
    },

    sub = {
      actions = [
        "sns:Subscribe",
        "sns:Receive",
      ]

      principals = [{
        type        = "AWS"
        identifiers = ["*"]
      }]

      "conditions" = [{
	test = "StringEquals"
	variable = "aws:PrincipalOrgID"
	values = [data.aws_organizations_organization.current.id]
      }]
    }
  }

  tags = {
    Environment = "AFT Pipeline"
    Terraform   = "true"
  }
}
