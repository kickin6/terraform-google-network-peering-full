/* Copyright 2018 Kawika Ohumukini
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom
 * the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
 * OR OTHER DEALINGS IN THE SOFTWARE.
 */
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
  source             = "../../"
  peering_name       = "peer1"
  peer1_network      = "${google_compute_network.network1.self_link}"
  peer2_network      = "${google_compute_network.network2.self_link}"
  auto_create_routes = "true"
}