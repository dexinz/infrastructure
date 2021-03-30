output "vcn_ocid" {
  value = "${oci_core_vcn.MLflowVCN.id}"
}
output "route_table_ocid" {
  value = "${oci_core_route_table.MLflowRT.id}"
}
output "subnet_ocid" {
  value = "${oci_core_subnet.MLflowSubnet.id}"
}