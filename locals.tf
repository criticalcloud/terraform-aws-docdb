locals {
  pg_name = var.parameter_group_name != "pg" ? var.parameter_group_name : "${var.parameter_group_name}-${var.cluster_identifier}"
}
