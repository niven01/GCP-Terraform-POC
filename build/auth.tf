provider "google" {
  region      = "${var.regn}"
  credentials = "${file("${var.credentials_path}")}"
  project     = "${var.project_name}"
}
