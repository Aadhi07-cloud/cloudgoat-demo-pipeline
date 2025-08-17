terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

variable "user_id" {}
variable "scenario" {}

resource "local_file" "demo" {
  filename = "${path.module}/demo_${var.user_id}_${var.scenario}.txt"
  content  = "Demo file for user=${var.user_id}, scenario=${var.scenario}"
}

output "file_name" {
  value = local_file.demo.filename
}
