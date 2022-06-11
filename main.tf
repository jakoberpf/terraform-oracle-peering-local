terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  alias            = "requestor"
}

provider "oci" {
  alias            = "acceptor"
}

resource "random_string" "deployment_id" {
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}

data "oci_identity_compartment" "requestor" {
  provider = oci.requestor
  id = var.requestor_compartment_ocid
}

data "oci_identity_compartment" "acceptor" {
  provider = oci.acceptor
  id = var.acceptor_compartment_ocid
}

data "oci_identity_groups" "requestor_administrators" {
  provider = oci.requestor
  name = "Administrators"
  compartment_id = var.requestor_root_compartment_ocid
}

data "oci_identity_groups" "acceptor_administrators" {
  provider = oci.acceptor
  name = "Administrators"
  compartment_id = var.acceptor_root_compartment_ocid
}

data "oci_core_vcn" "requestor" {
  provider = oci.requestor
  vcn_id = var.requestor_vnc_ocid
}

data "oci_core_vcn" "acceptor" {
  provider = oci.acceptor
  vcn_id = var.acceptor_vnc_ocid
}
