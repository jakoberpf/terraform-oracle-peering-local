resource "oci_identity_policy" "requestor_policy" {
  provider       = oci.requestor
  compartment_id = var.requestor_root_compartment_ocid
  name           = "Requestor-Policy-${random_string.deployment_id.result}"
  description    = "Requestor Policy"
  statements = [
    "Define tenancy Acceptor as ${var.acceptor_root_compartment_ocid}",
    "Allow group Administrators to manage local-peering-from in compartment ${data.oci_identity_compartment.requestor.name}",
    "Endorse group Administrators to manage local-peering-to in tenancy Acceptor",
    "Endorse group Administrators to associate local-peering-gateways in compartment ${data.oci_identity_compartment.requestor.name} with local-peering-gateways in tenancy Acceptor"
  ]
}

resource "oci_core_local_peering_gateway" "requestor" {
  provider       = oci.requestor
  compartment_id = var.requestor_compartment_ocid
  vcn_id         = var.requestor_vnc_ocid
  display_name   = "requestor-to-${var.acceptor_id}-${random_string.deployment_id.result}"
  peer_id        = oci_core_local_peering_gateway.acceptor.id
  # route_table_id = oci_core_route_table.requestor.id
  depends_on = [
    oci_identity_policy.requestor_policy,
    oci_core_local_peering_gateway.acceptor
  ]
}
