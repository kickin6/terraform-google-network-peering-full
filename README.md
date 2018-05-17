# Network Peering Terraform Module

Modular Network Peering Two Projects on Google Compute Engine for Terraform.

## Usage
```
variable project1 {
  description = "Project #1 to peer"
  type = "string"
  default = ""
}

variable project2 {
  description = "Project #2 to peer"
  type = "string"
  default = ""
}

resource "google_compute_network" "network1" {
  name                    = "network1"
  project                 = "${var.project1}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet1" {
  name          = "subnet1"
  region        = "us-east1"
  project       = "${var.project1}"
  network       = "${google_compute_network.network1.self_link}"
  ip_cidr_range = "10.28.0.0/24"
}

resource "google_compute_network" "network2" {
  name                    = "network2"
  project                 = "${var.project2}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet2" {
  name          = "subnet2"
  region        = "us-east1"
  project       = "${var.project2}"
  network       = "${google_compute_network.network2.self_link}"
  ip_cidr_range = "10.28.1.0/24"
}

module "peering" {
  source             = "github.com/kickin6/terraform-google-network-peering"
  peering_name       = "peer1"
  peer1_network      = "${google_compute_network.network1.self_link}"
  peer2_network      = "${google_compute_network.network2.self_link}"
  auto_create_routes = "true"
}
```

## Resources Created
- [`google_compute_network_peering.peer1`](https://www.terraform.io/docs/providers/google/r/compute_network_peering.html): The network peering connection in project #1.
- [`google_compute_network_peering.peer2`](https://www.terraform.io/docs/providers/google/r/compute_network_peering.html): The network peering connection in project #2.
