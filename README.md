### Módulo para gerenciamento de Subnetwork para Google Cloud Platform

Example usage module:

***terraform.tf***
```go
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {

}
```

---

***main.tf***
```go
module "subnet-us" {
  source = "git@github.com:dihogoteixeira/mod-gcp-subnetwork.git?ref=v1.1"

  nw_name = "subnet-us"
  nw_cidr_range = "10.10.10.0/24"
  nw_region = "us-central1"
  vpc_name = module.network.self_link

  depends_on = [
    module.network
  ]
}

module "subnet-asia" {
  source = "git@github.com:dihogoteixeira/mod-gcp-subnetwork.git?ref=v1.1"

  nw_name = "subnet-asia"
  nw_cidr_range = "10.10.20.0/24"
  nw_region = "asia-east1"
  vpc_name = module.network.self_link

  depends_on = [
    module.network
  ]
}
```

---

***output.tf***
```go
// subnet1 output
output "us_creation_timestamp" {
  value = module.subnet-us.creation_timestamp
}

output "us_gateway_address" {
  value = module.subnet-us.gateway_address
}

output "us_self_link" {
  value = module.subnet-us.self_link
}

// subnet2 output
output "asia_creation_timestamp" {
  value = module.subnet-us.creation_timestamp
}

output "asia_gateway_address" {
  value = module.subnet-us.gateway_address
}

output "asia_self_link" {
  value = module.subnet-asia.self_link
}
```