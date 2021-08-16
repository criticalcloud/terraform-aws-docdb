# Mandatory
variable "password" {
  type = string
}

variable "db_subnet_group_name" {
    type = string
}

# Variables with default values
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {
    "Realm" = "asgard"
  }
}

variable "vpc_security_group_ids" {
  type = list(string)
  default = []
  description = "Security group IDs"
}

variable "cluster_identifier" {
  type = string
  default = "mongo"
}

variable "engine_version" {
    type = string
    default = "4.0.0"
}

variable "username" {
  type = string
  default = "admin"
}

variable "backup_retention_period" {
    type = number
    default = 7
}

variable "preferred_backup_window" {
    type = string
    default = "03:00-03:30"
}

variable "preferred_maintenance_window" {
    type = string
    default = "sat:04:00-sat:04:30"
}

variable "storage_encrypted" {
    type = bool
    default = true
}

variable "deletion_protection" {
    type = bool
    default = true
}

variable "skip_final_snapshot" {
    type = bool
    default = false
}

variable "parameter_group_name" {
  type = string
  default = "pg"
}

variable "cluster_instances_count" {
    type = number
    default = 1
}

variable "instance_class" {
    type = string
    default = "db.t3.medium"
}

variable "pg_family" {
    type = string
    default = "docdb4.0"
}

variable "pg_description" {
    type = string
    default = "Managed by Terraform"
}

variable "parameters" {
  description = "A list of DB parameter maps to apply"
  type        = list(map(string))
  default     = []
}

variable "promotion_tier" {
    type = number
    default = 1
}