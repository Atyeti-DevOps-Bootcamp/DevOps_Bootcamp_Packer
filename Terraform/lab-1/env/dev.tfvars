project_id = "your-gcp-project-id"

region = "us-central1"

# -------------------------
# VPC VALUES
# -----
vpc_name    = "autopilot-vpc"
subnet_name = "autopilot-subnet"

subnet_cidr = "10.10.0.0/24"     # Primary range

pods_cidr     = "10.20.0.0/16"   # Secondary for Pods
services_cidr = "10.30.0.0/20"   # Secondary for Services

# -------------------------
# GKE CLUSTER VALUES
# -------------------------
cluster_name = "dev-autopilot-000"   # change per environment

secondary_range_name  = "pods"
secondary_range_name_services = "services"

enable_cluster = true   #set false to disable cluster for an environment









