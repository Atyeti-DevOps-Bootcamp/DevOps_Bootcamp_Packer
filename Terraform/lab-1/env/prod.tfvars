project_id = "prod-gcp-project-id"

region = "us-central1"

# VPC
vpc_name    = "prod-autopilot-vpc"
subnet_name = "prod-autopilot-subnet"
subnet_cidr = "10.50.0.0/24"

pods_cidr     = "10.60.0.0/16"
services_cidr = "10.70.0.0/20"

# -------------------------
# GKE CLUSTER VALUES
cluster_name = "prod-autopilot-1"   # change per environment

secondary_range_name  = "pods"
secondary_range_name_services = "services"

enable_cluster = false
##########















