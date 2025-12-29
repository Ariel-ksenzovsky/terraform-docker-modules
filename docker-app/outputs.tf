output "container_names" {
  description = "App container names"
  value       = docker_container.app[*].name
}

output "host_ports" {
  description = "App host ports (first port mapping external per container)"
  value       = [for c in docker_container.app : try(c.ports[0].external, null)]
}

output "container_ips" {
  description = "App container IPs"
  value       = [for c in docker_container.app : try(c.network_data[0].ip_address, null)]
}
