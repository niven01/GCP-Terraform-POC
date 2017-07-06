resource "google_compute_instance_template" "web" {
  name           = "${var.asg_name}"
  machine_type   = "${var.instance_type}"
  can_ip_forward = false

  tags = ["web", "asg"]

  disk {
    source_image = "debian-cloud/debian-8"
  }

  network_interface {
    network = "default"
  }

  metadata {
    name = "web"
  }

}

resource "google_compute_target_pool" "web" {
  name = "${var.pool_name}"
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
