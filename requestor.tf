resource "oci_identity_policy" "requestor_policy" {
  provider       =  oci.requestor
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

# resource "oci_core_route_table" "requestor" {
#   provider       = oci.requestor
#   compartment_id = var.requestor_compartment_ocid
#   vcn_id         = var.requestor_vnc_ocid
#   display_name   = "Route Table to acceptor ${var.acceptor_id}"
#   route_rules {
#     destination = data.oci_core_vcn.acceptor.cidr_blocks[0]
#     network_entity_id = oci_core_local_peering_gateway.requestor.id
#   }
#   depends_on = [
#     oci_identity_policy.requestor_policy
#   ]
# }

# resource "null_resource" "requestor" {
#   provisioner "local-exec" {
#     command = "echo oci network route-table create --compartment-id xxx --vcn-id yyy --route-rules '[{\"cidrBlock\":\"$VCN_CIDR\",\"networkEntityId\":\"zzz\"}]' $FOO $BAR $BAZ >> env_vars.txt"

#     environment = {
#       VCN_CIDR = data.oci_core_vcn.acceptor.cidr_blocks[0]
#       FOO = "bar"
#       BAR = 1
#       BAZ = "true"
#     }
#   }

#   depends_on = [
#     data.oci_core_vcn.acceptor
#   ]
# }
