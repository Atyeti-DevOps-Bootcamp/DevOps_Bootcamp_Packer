project_id = "staging-gcp-project"

region = "us-central1"

vpc_name    = "staging-autopilot-vpc"
subnet_name = "staging-autopilot-subnet"
subnet_cidr = "10.30.0.0/24"

pods_cidr     = "10.40.0.0/16"
services_cidr = "10.41.0.0/20"

# -------------------------
# GKE CLUSTER VALUES
# -------------------------
cluster_name = "staging-autopilot-0"   # change per environment
secondary_range_name  = "pods"
secondary_range_name_services = "services"

enable_cluster = true   # set false to disable cluster for an environment


#########




