resource "oci_core_subnet" "Mset2Subnet" {
  availability_domain = ""
  cidr_block          = "10.1.0.0/24"
  display_name        = "Mset2Subnet"
  dns_label           = "mset2"
  security_list_ids   = ["${oci_core_security_list.Mset2SecurityList.id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.Mset2VCN.id}"
  route_table_id      = "${oci_core_route_table.Mset2RT.id}"
}
