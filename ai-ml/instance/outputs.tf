output "private_ip" {
  value = "${oci_core_instance.Mset2Instance.private_ip}"
}

output "public_ip" {
  value = "${oci_core_instance.Mset2Instance.public_ip}"
}
