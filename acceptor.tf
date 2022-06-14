resource "oci_identity_policy" "acceptor_policy" {
  provider       = oci.acceptor
  compartment_id = var.acceptor_root_compartment_ocid
  name           = "Acceptor-Policy-${random_string.deployment_id.result}"
  description    = "Acceptor Policy"
  statements = [
    "Define tenancy Requestor as ${var.requestor_root_compartment_ocid}",
    "Define group RequestorGroup as ${data.oci_identity_groups.requestor_administrators.groups[0].id}",
    "Admit group RequestorGroup of tenancy Requestor to manage local-peering-to in compartment Zelos",
    "Admit group RequestorGroup of tenancy Requestor to associate local-peering-gateways in tenancy Requestor with local-peering-gateways in compartment Zelos"
  ]
}

resource "oci_core_local_peering_gateway" "acceptor" {
  provider       = oci.acceptor
  compartment_id = var.acceptor_compartment_ocid
  vcn_id         = var.acceptor_vnc_ocid
  display_name   = "acceptor-to-${var.requestor_id}-${random_string.deployment_id.result}"
  # route_table_id = oci_core_route_table.requestor.id
  depends_on = [
    oci_identity_policy.acceptor_policy
  ]
}
