# Oracle Local Peering Module

[Terraform Registry](https://registry.terraform.io/modules/jakoberpf/peering-local/oracle/latest)

This module sets up a local peering connection base and creates a connection setup script.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci.acceptor"></a> [oci.acceptor](#provider\_oci.acceptor) | n/a |
| <a name="provider_oci.requestor"></a> [oci.requestor](#provider\_oci.requestor) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_local_peering_gateway.acceptor](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_local_peering_gateway) | resource |
| [oci_core_local_peering_gateway.requestor](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_local_peering_gateway) | resource |
| [oci_identity_policy.acceptor_policy](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_policy.requestor_policy](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_policy) | resource |
| [random_string.deployment_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [oci_core_vcn.acceptor](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vcn) | data source |
| [oci_core_vcn.requestor](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_vcn) | data source |
| [oci_identity_compartment.acceptor](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartment) | data source |
| [oci_identity_compartment.requestor](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_compartment) | data source |
| [oci_identity_groups.acceptor_administrators](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_groups) | data source |
| [oci_identity_groups.requestor_administrators](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/identity_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acceptor_compartment_ocid"></a> [acceptor\_compartment\_ocid](#input\_acceptor\_compartment\_ocid) | n/a | `string` | n/a | yes |
| <a name="input_acceptor_id"></a> [acceptor\_id](#input\_acceptor\_id) | n/a | `string` | n/a | yes |
| <a name="input_acceptor_root_compartment_ocid"></a> [acceptor\_root\_compartment\_ocid](#input\_acceptor\_root\_compartment\_ocid) | n/a | `string` | n/a | yes |
| <a name="input_acceptor_route_table_id"></a> [acceptor\_route\_table\_id](#input\_acceptor\_route\_table\_id) | n/a | `string` | n/a | yes |
| <a name="input_acceptor_vnc_ocid"></a> [acceptor\_vnc\_ocid](#input\_acceptor\_vnc\_ocid) | n/a | `string` | n/a | yes |
| <a name="input_requestor_compartment_ocid"></a> [requestor\_compartment\_ocid](#input\_requestor\_compartment\_ocid) | n/a | `string` | n/a | yes |
| <a name="input_requestor_id"></a> [requestor\_id](#input\_requestor\_id) | n/a | `string` | n/a | yes |
| <a name="input_requestor_root_compartment_ocid"></a> [requestor\_root\_compartment\_ocid](#input\_requestor\_root\_compartment\_ocid) | n/a | `string` | n/a | yes |
| <a name="input_requestor_route_table_id"></a> [requestor\_route\_table\_id](#input\_requestor\_route\_table\_id) | n/a | `string` | n/a | yes |
| <a name="input_requestor_vnc_ocid"></a> [requestor\_vnc\_ocid](#input\_requestor\_vnc\_ocid) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acceptor_route_rule_script"></a> [acceptor\_route\_rule\_script](#output\_acceptor\_route\_rule\_script) | n/a |
| <a name="output_requestor_route_rule_script"></a> [requestor\_route\_rule\_script](#output\_requestor\_route\_rule\_script) | n/a |
<!-- END_TF_DOCS -->