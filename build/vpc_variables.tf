# VPC
variable "region" {
  default = "europe-west2"
}

variable "region_zone" {
  default = "europe-west2-a"
}

variable "project_name" {
  description = "build-172714"
}

variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/auth.json"
}

variable "vpc_name" {
  default = "poc-vpc"
}

variable "ipv4_range" {
  default = "10.0.0.0/16"
}

variable "privatesubnet_name" {
  default = "private-subnet-a"
}

variable "publicsubnet_name" {
  default = "public-subnet-a"
}

variable "privatesubnet_ip_cidr_range" {
  default = "10.10.0.0/24"
}

variable "publicsubnet_ip_cidr_range" {
  default = "10.20.0.0/24"
}

variable "privatesubnet_region" {
  default = "europe-west2"
}

variable "publicsubnet_region" {
  default = "europe-west2"
}
