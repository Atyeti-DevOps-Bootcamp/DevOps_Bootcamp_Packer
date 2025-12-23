terraform {
  backend "remote" {
    organization = "BootcampDevops-org"
    workspaces {
      prefix = "gke-"
    }
  }
}
