output "container_names" {
  description = "NGINX container names"
  value       = docker_container.nginx[*].name
}

output "host_ports" {
  description = "NGINX host ports (first port mapping external per container)"
  value       = [for c in docker_container.nginx : try(c.ports[0].external, null)]
}

output "container_ips" {
  description = "NGINX container IPs on the attached network"
  value       = [for c in docker_container.nginx : try(c.network_data[0].ip_address, null)]
}
