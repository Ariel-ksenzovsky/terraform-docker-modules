output "hostname" {
  description = "MySQL primary container name (DNS hostname on the Docker network)"
  value       = var.enabled ? docker_container.mysql[0].name : null
}

output "primary_volume_name" {
  description = "MySQL primary data volume name"
  value       = var.enabled ? docker_volume.mysql_data[0].name : null
}

output "replica_hostnames" {
  description = "MySQL replica container names"
  value       = [for c in docker_container.mysql_replica : c.name]
}

# Credentials as outputs (optional, but requested by assignment)
output "db_user" {
  description = "DB username"
  value       = var.db_user
  sensitive   = true
}

output "db_password" {
  description = "DB password"
  value       = var.db_password
  sensitive   = true
}
