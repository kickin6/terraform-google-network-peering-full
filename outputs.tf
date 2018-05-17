output "peer1_state" {
  description = "State of peer1."
  value       = "${google_compute_network_peering.peer1.state}"
}

output "peer1_state_details" {
  description = "State details of peer1."
  value       = "${google_compute_network_peering.peer1.state_details}"
}

output "peer2_state" {
  description = "State of peer2."
  value       = "${google_compute_network_peering.peer2.state}"
}

output "peer2_state_details" {
  description = "State Details of peer2."
  value       = "${google_compute_network_peering.peer2.state_details}"
}
