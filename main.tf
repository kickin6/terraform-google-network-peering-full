resource "google_compute_network_peering" "peer1" {
  name               = "${var.peering_name}"
  network            = "${var.peer1_network}"
  peer_network       = "${var.peer2_network}"
  auto_create_routes = "${var.auto_create_routes}"
}

resource "google_compute_network_peering" "peer2" {
  name               = "${var.peering_name}"
  network            = "${var.peer2_network}"
  peer_network       = "${var.peer1_network}"
  auto_create_routes = "${var.auto_create_routes}"
}
