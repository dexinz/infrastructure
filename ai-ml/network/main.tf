resource "oci_core_vcn" "MLflowVCN" {
  cidr_block     = "10.1.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "MLflowVCN"
  dns_label      = "MLflow"
}

resource "oci_core_internet_gateway" "MLflowIG" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "MLflowIG"
  vcn_id         = "${oci_core_vcn.MLflowVCN.id}"
}

resource "oci_core_route_table" "MLflowRT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.MLflowVCN.id}"
  display_name   = "MLflowRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.MLflowIG.id}"
  }
}
