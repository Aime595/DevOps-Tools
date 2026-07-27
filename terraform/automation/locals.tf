locals {
    name_prfix = var.name_prfix == null ? "${var.company}-${var.project}-${var.environment}" : var.name_prfix
    tags = var.tags == null ? var.tags_map : var.tags
}