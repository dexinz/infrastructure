provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "GqIF:US-ASHBURN-AD-1"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaakyfs5al74yiyuisyfpiscafwqr6k2yktqhg4xhodiriupbtfhuxa"
	create_vnic_details {
		assign_public_ip = "true"
		subnet_id = "${oci_core_subnet.generated_oci_core_subnet.id}"
	}
	display_name = "gpu-instance"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3UzaIChokhIMEi/Ccuba4V/chcua6jbr6ZhVYBR8Qq/YtNvuKuEboiu18fjh9w+c2VRIlMkm4vQgI0PnLEn4kxUWFN/byN+rBs4tO4Yo2OtyAJRk23zfS3KqfHN1gg2tJXyq4WtI03kls8lnOg0hpkesYfc1l42XIgi6ihjxBEsT8l6UNCkJcfoTt1b/ztSwA4KCn2RDfDYzJlgNtqqyRLQ20z9udI8KmkhaxPcHuLDzOPzdArHgJkuum6lJf3rnRQY/1K5OGT/LoizZw3pof0zv3eaUCBKOk3htQDtmrCf7fpD52AfAvKcolpncYybyw4+A2NSExvXUF4G8/dSxz ssh-key-2020-12-19"
	}
	shape = "VM.GPU2.1"
	source_details {
		source_id = "ocid1.image.oc1..aaaaaaaa4cqfimd27o5xdz2gd7w2hoarfb32phr6vrd4vphznyb3wxgtzoia"
		source_type = "image"
	}
	depends_on = [
		oci_core_app_catalog_subscription.generated_oci_core_app_catalog_subscription
	]
}

resource "oci_core_app_catalog_subscription" "generated_oci_core_app_catalog_subscription" {
	compartment_id = "ocid1.compartment.oc1..aaaaaaaakyfs5al74yiyuisyfpiscafwqr6k2yktqhg4xhodiriupbtfhuxa"
	eula_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.eula_link}"
	listing_id = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.listing_id}"
	listing_resource_version = "2.0"
	oracle_terms_of_use_link = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.oracle_terms_of_use_link}"
	signature = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.signature}"
	time_retrieved = "${oci_core_app_catalog_listing_resource_version_agreement.generated_oci_core_app_catalog_listing_resource_version_agreement.time_retrieved}"
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_block = "10.0.0.0/16"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaakyfs5al74yiyuisyfpiscafwqr6k2yktqhg4xhodiriupbtfhuxa"
	display_name = "gpu-vcn"
	dns_label = "vcn03012126"
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
	cidr_block = "10.0.0.0/24"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaakyfs5al74yiyuisyfpiscafwqr6k2yktqhg4xhodiriupbtfhuxa"
	display_name = "gpu-subnet"
	dns_label = "subnet03012126"
	route_table_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
	compartment_id = "ocid1.compartment.oc1..aaaaaaaakyfs5al74yiyuisyfpiscafwqr6k2yktqhg4xhodiriupbtfhuxa"
	display_name = "Internet Gateway gpu-vcn"
	enabled = "true"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
	route_rules {
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		network_entity_id = "${oci_core_internet_gateway.generated_oci_core_internet_gateway.id}"
	}
	manage_default_resource_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
}

resource "oci_core_app_catalog_listing_resource_version_agreement" "generated_oci_core_app_catalog_listing_resource_version_agreement" {
	listing_id = "ocid1.appcataloglisting.oc1..aaaaaaaachivaakhl6nkqkze3d3f5yqtwabaeomgw6qauya5q4clciacw7qa"
	listing_resource_version = "2.0"
}
