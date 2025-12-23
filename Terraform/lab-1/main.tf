provider "google" {
  project = var.project_id
  region  = var.region
  #credentials = file("fake-creds.json")
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  #credentials = file("fake-creds.json")
}

# ---------------------------------------
# VPC MODULE 
#......................................

module "vpc" {
  source = "./modules/vpc"

  project_id     = var.project_id
  vpc_name       = var.vpc_name
  subnet_name    = var.subnet_name
  subnet_cidr    = var.subnet_cidr
  pods_cidr      = var.pods_cidr
  services_cidr  = var.services_cidr
  region         = var.region
}

# ---------------------------------------
# GKE AUTOPILOT MODULE

module "gke" {
  source = "./modules/gke"

  project_id   = var.project_id
  region       = var.region
  cluster_name = var.cluster_name

  # From VPC module outputs
  network_id   = module.vpc.network_id
  subnet_id    = module.vpc.subnet_id
  enable_cluster = var.enable_cluster

  # Secondary ranges
  cluster_secondary_range_name  = module.vpc.pods_range_name
  services_secondary_range_name = module.vpc.services_range_name
  depends_on = [
    module.vpc
  ]
}
















