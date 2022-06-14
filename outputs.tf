output "requestor_route_rule_script" {
  value = templatefile("${path.module}/templates/set-route-rule.sh.tftpl", { 
      profile=upper(var.requestor_id), 
      compartment-id = var.requestor_compartment_ocid, 
      vcn-id = var.requestor_vnc_ocid,
      rt-id = var.requestor_route_table_id
    })
}