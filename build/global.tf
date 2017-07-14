resource "google_compute_network" "platform" {
  name       = "${var.platform-name}"
}


resource "google_compute_firewall" "ssh" {
  name    = "${var.platform-name}-ssh"
  network = "${google_compute_network.platform.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
   source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "http" {
  name    = "${var.platform-name}-http"
  network = "${google_compute_network.platform.name}"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
   source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "https" {
  name    = "${var.platform-name}-https"
  network = "${google_compute_network.platform.name}"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
   source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "icmp" {
  name    = "${var.platform-name}-icmp"
  network = "${google_compute_network.platform.name}"
  allow {
    protocol = "icmp"
  }
   source_ranges = ["0.0.0.0/0"]
}
