output "cluster_name" {
  value = try(google_container_cluster.autopilot["enable"].name, null)
}

output "cluster_id" {
  value = try(google_container_cluster.autopilot["enable"].id, null)
}

output "location" {
  value = try(google_container_cluster.autopilot["enable"].location, null)
}

output "endpoint" {
  value = try(google_container_cluster.autopilot["enable"].endpoint, null)
}

output "ca_certificate" {
  value = try(
    google_container_cluster.autopilot["enable"].master_auth[0].cluster_ca_certificate,
    null
  )
}


