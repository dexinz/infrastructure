resource "oci_core_vcn" "Mset2VCN" {
  cidr_block     = "10.1.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "Mset2VCN"
  dns_label      = "mset2"
}

resource "oci_core_internet_gateway" "Mset2IG" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "Mset2IG"
  vcn_id         = "${oci_core_vcn.Mset2VCN.id}"
}

resource "oci_core_route_table" "Mset2RT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_vcn.Mset2VCN.id}"
  display_name   = "Mset2RouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.Mset2IG.id}"
  }
}
