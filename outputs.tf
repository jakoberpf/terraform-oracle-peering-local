output "requestor_route_rule_script" {
  value = templatefile("${path.module}/templates/set-route-rule.sh.tftpl", { 
      profile=upper(var.requestor_id), 
      compartment-id = var.requestor_compartment_ocid, 
      vcn-id = var.requestor_vnc_ocid,
      rt-id = var.requestor_route_table_id,
      cidr-block = data.oci_core_vcn.acceptor.cidr_blocks[0],
      peering-id = var.acceptor_id,
      peering-ocid = oci_core_local_peering_gateway.requestor.id
    })
}

output "acceptor_route_rule_script" {
  value = templatefile("${path.module}/templates/set-route-rule.sh.tftpl", { 
      profile=upper(var.acceptor_id), 
      compartment-id = var.acceptor_compartment_ocid, 
      vcn-id = var.acceptor_vnc_ocid,
      rt-id = var.acceptor_route_table_id,
      cidr-block = data.oci_core_vcn.requestor.cidr_blocks[0],
      peering-id = var.requestor_id,
      peering-ocid = oci_core_local_peering_gateway.acceptor.id
    })
}