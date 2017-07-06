resource "google_compute_network" "platform" {
  name       = "${var.platform-name}"
}


resource "google_compute_firewall" "ssh" {
  name    = "${var.platform-name}-ssh"
  network = "${google_compute_network.platform.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

   source_ranges = ["0.0.0.0/0"]
}
