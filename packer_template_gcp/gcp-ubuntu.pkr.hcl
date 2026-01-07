packer {
  required_plugins {
    googlecompute = {
      source  = "github.com/hashicorp/googlecompute"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

# -----------------------------
# Variables (from Vault)
# -----------------------------
variable "admin_password" {
  type      = string
  sensitive = true
}

variable "user1_password" {
  type      = string
  sensitive = true
}

# -----------------------------
# GCP Source Image
# -----------------------------
source "googlecompute" "ubuntu" {
  project_id = "packer-automation-483407"
  zone       = "us-central1-a"

  image_name   = "packer-ubuntu-hardened-{{timestamp}}"
  image_family = "packer-ubuntu-hardened"

  machine_type = "e2-micro"

  source_image_family     = "ubuntu-2204-lts"
  source_image_project_id = ["ubuntu-os-cloud"]

  ssh_username = "packer"
}

# -----------------------------
# Build
# -----------------------------
build {
  sources = ["source.googlecompute.ubuntu"]

  # ---------------------------------
  # Shell Provisioner (APT SAFE)
  # ---------------------------------
  provisioner "shell" {
    inline = [
      "echo 'Waiting for cloud-init...'",
      "sudo cloud-init status --wait",

      "echo 'Resetting apt state...'",
      "sudo rm -rf /var/lib/apt/lists/*",
      "sudo apt-get clean",

      "echo 'Updating apt...'",
      "sudo apt-get update -y",

      "echo 'Installing Python + Ansible dependencies (APT ONLY)...'",
      "sudo apt-get install -y python3 python3-apt python3-passlib",

      "echo 'Preparing Ansible temp directory...'",
      "sudo mkdir -p /tmp/.ansible",
      "sudo chmod 777 /tmp/.ansible"
    ]
  }

  # -----------------------------
  # Ansible Provisioner
  # -----------------------------
  provisioner "ansible" {
    playbook_file = "${path.root}/ansible/playbook.yml"
    use_proxy     = false

    ansible_env_vars = [
      "ANSIBLE_REMOTE_TEMP=/tmp/.ansible"
    ]

    extra_arguments = [
      "--become",
      "--extra-vars",
      jsonencode({
        admin_password = var.admin_password
        user1_password = var.user1_password
      }),
      "-e", "ansible_python_interpreter=/usr/bin/python3"
    ]
  }
}
