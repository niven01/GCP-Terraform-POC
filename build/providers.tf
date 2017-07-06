provider "google" {
  credentials = "${file("~/.gcloud/auth.json")}"
  project     = "${var.poc-project}"
  region      = "${var.poc-region}"
}
