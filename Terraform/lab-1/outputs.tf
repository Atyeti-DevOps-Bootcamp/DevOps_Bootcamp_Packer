output "vpc_id" {
  value = module.vpc.network_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}

output "gke_name" {
  value = module.gke.cluster_name
}

output "gke_endpoint" {
  value = module.gke.endpoint
}

output "gke_ca_certificate" {
  value = module.gke.ca_certificate
}
