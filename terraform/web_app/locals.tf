locals {
    common_tags = {
        Project = var.project
        Environment = var.environment
        BillingCode = var.billing_code
        Company = var.company_name
    }

    name_prefix = "${var.project}-${var.environment}"
}