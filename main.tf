resource "google_compute_subnetwork" "this" {
    name                    = var.nw_name
    ip_cidr_range           = var.nw_cidr_range
    region                  = var.nw_region
    network                 = var.vpc_name
}