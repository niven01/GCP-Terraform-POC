# Autoscale
variable "asg_name" {
  default = "web"
}

variable "instance_type" {
  default     = "f1-micro"
}

variable "pool_name" {
  default = "web"
}


variable "group_manager_name" {
  default = "web-mgr"
}

variable "group_manager_zone" {
  default = "europe-west2-a"
}


variable "autoscaler_name" {
  default = "web"
}

variable "autoscaler_zone" {
  default = "europe-west2-a"
}

variable "max" {
  default = 2
}

variable "min" {
  default = 1
}

variable "cooldown" {
  default = 60
}
