locals {
  pg_name = var.parameter_group_name != "pg" ? var.parameter_group_name : "${var.parameter_group_name}-${var.cluster_identifier}"
  repl_name = var.replica_identifier != "mongo_rpl" ? var.replica_identifier : "${var.replica_identifier}-${sum([count.index, 1])}"
}
