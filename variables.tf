variable peering_name {
  description = "Peering connection name"
  type        = "string"
  default     = "peer1"
}

variable peer1_network {
  description = "Resource link of network #1."
  type        = "string"
  default     = ""
}

variable peer2_network {
  description = "Resource link of network #2."
  type        = "string"
  default     = ""
}

variable auto_create_routes {
  description = "If set to true, the routes between the two networks will be created and managed automatically."
  type        = "string"
  default     = "true"
}
