# Authentication
variable "regn" {
  default = "europe-west2"
}

variable "credentials_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/auth.json"
}
