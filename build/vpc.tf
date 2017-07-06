
# Creates VPC
resource "google_compute_network" "default" {
  name                    = "${var.vpc_name}"
}

# Creates Subnets
resource "google_compute_subnetwork" "private" {
  name          = "${var.privatesubnet_name}"
  ip_cidr_range = "${var.privatesubnet_ip_cidr_range}"
  network       = "${google_compute_network.default.self_link}"
  region        = "${var.privatesubnet_region}"
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.publicsubnet_name}"
  ip_cidr_range = "${var.publicsubnet_ip_cidr_range}"
  network       = "${google_compute_network.default.self_link}"
  region        = "${var.publicsubnet_region}"
}
