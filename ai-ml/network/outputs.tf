output "vcn_ocid" {
  value = "${oci_core_vcn.Mset2VCN.id}"
}
output "route_table_ocid" {
  value = "${oci_core_route_table.Mset2RT.id}"
}
output "subnet_ocid" {
  value = "${oci_core_subnet.Mset2Subnet.id}"
}