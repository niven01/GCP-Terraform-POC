# Network

variable "poc-region"               { default = "europe-west2" }
variable "poc-zone"                 { default = "europe-west2-a" }
variable "poc-project"              { default = "build-172714" }
variable "platform-name"            { default = "poc"  }
variable "iprange"                  { default = "10.10.0.0/16"  }

#asg
variable "asg_name"                 { default = "web" }
variable "instance_type"            { default = "f1-micro" }
variable "pool_name"                { default = "web-lb" }
variable "group_manager_name"       { default = "web-mgr" }
variable "group_manager_zone"       { default = "europe-west2-a" }
variable "autoscaler_name"          { default = "web" }
variable "autoscaler_zone"          { default = "europe-west2-a" }
variable "max"                      { default = 3 }
variable "min"                      { default = 2 }
variable "cooldown"                 { default = 60 }

#key pair
variable "public_key_path"          { default = "~/.ssh/gcloud_id_rsa.pub" }
variable "private_key_path"         { default = "~/.ssh/gcloud_id_rsa" }
