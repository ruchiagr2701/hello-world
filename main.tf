terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket27"
	credentials = "key.json"
	prefix = "terraform/state"
  }
}

provider "google" {
  credentials = file("key.json")
  project = "hopeful-lexicon-449405-b6"  # Hardcoded project ID
  region  = "us-central1"               # Hardcoded region
}

# Compute instance (VM) resource
resource "google_compute_instance" "my_instance" {
  name         = "demo-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
