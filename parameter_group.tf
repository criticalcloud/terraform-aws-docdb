## PARAMETER GROUP
resource "aws_docdb_cluster_parameter_group" "docdb_pg" {
  family      = var.pg_family
  name        = local.pg_name
  description = var.pg_description


  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
    }
  }
}
