resource "oci_core_subnet" "MLflowSubnet" {
  availability_domain = ""
  cidr_block          = "10.1.1.0/24"
  display_name        = "MLflowSubnet"
  dns_label           = "MLflow"
  security_list_ids   = ["${oci_core_security_list.MLflowSecurityList.id}"]
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_vcn.MLflowVCN.id}"
  route_table_id      = "${oci_core_route_table.MLflowRT.id}"
}
