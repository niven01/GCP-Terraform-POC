resource "google_compute_subnetwork" "private" {
  name          = "${var.platform-name}-${var.poc-region}"
  ip_cidr_range = "10.10.0.0/24"
  network       = "${google_compute_network.platform.self_link}"
  region        = "${var.poc-region}"
}


resource "google_compute_instance_template" "web" {
  name           = "${var.asg_name}"
  machine_type   = "${var.instance_type}"
  can_ip_forward = false

  tags = ["web", "asg"]

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-1610"
  }

  network_interface {
    network = "default"

    access_config {
      # Ephemeral
    }
  }

  metadata {
    name = "web"
    startup-script =<<SCRIPT
apt-get update
apt-get install -y apache2
cat <<EOF > /var/www/html/index.html
<html><body><h1>Hello GCP World</h1>
<p>This page was created from a simple startup script!</p>
</body></html>
SCRIPT
  }

}

resource "google_compute_http_health_check" "web" {
  name         = "test"
  request_path = "/"
  timeout_sec        = 1
  check_interval_sec = 1
}

resource "google_compute_target_pool" "web" {
  name = "${var.pool_name}"
  health_checks = [
    "${google_compute_http_health_check.web.name}",
  ]
}

resource "google_compute_forwarding_rule" "web" {
  name       = "port-80"
  target     = "${google_compute_target_pool.web.self_link}"
  port_range = "80"
}

resource "google_compute_instance_group_manager" "web" {
  name = "${var.group_manager_name}"
  zone = "${var.group_manager_zone}"

  instance_template  = "${google_compute_instance_template.web.self_link}"
  target_pools       = ["${google_compute_target_pool.web.self_link}"]
  base_instance_name = "web"
}

resource "google_compute_autoscaler" "web" {
  name   = "${var.autoscaler_name}"
  zone   = "${var.autoscaler_zone}"
  target = "${google_compute_instance_group_manager.web.self_link}"

  autoscaling_policy = {
    max_replicas    = "${var.max}"
    min_replicas    = "${var.min}"
    cooldown_period = "${var.cooldown}"

    cpu_utilization {
      target = 0.5
    }
  }
}
