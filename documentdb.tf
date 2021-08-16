## DOCUMENTDB
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "docdb"
  engine_version          = var.engine_version
  master_username         = var.username
  master_password         = var.password
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.docdb_pg.name
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  
  storage_encrypted = var.storage_encrypted
  deletion_protection = var.deletion_protection
  skip_final_snapshot     = var.skip_final_snapshot

  tags = merge(
    var.tags,
    {
      "Name" = var.cluster_identifier
    },
  )

}

## MONGODB INSTANCES
resource "aws_docdb_cluster_instance" "cluster_instances" {
  identifier         = var.repl_identifier != "mongo_repl" ? var.repl_identifier : "${var.cluster_identifier}-${sum([count.index, 1])}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = var.instance_class
  preferred_maintenance_window = var.preferred_maintenance_window
  promotion_tier = var.promotion_tier

  tags = merge(
    var.tags,
    {
      "Name" = "${var.cluster_identifier}-${sum([count.index, 1])}"
    },
  )
  
  count              = var.cluster_instances_count
}