terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "random" {
  # Configuration options
}

variable "id" {
  description = "Change this ID will change the pet name"
  type        = string
  default     = "123"
}

resource "random_pet" "server" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    pet_id = "${var.id}"
  }
}

output "pet_output" {
  value       = random_pet.server.id
  description = "The Pet name"
}
