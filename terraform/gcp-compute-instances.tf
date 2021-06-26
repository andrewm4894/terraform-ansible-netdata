resource "google_compute_address" "netdata" {
  name = "netdata"
}

resource "google_compute_instance" "netdata" {
  name                      = "netdata"
  machine_type              = "n1-standard-2"
  zone                      = var.gcp_zone
  tags                      = ["netdata"]
  allow_stopping_for_update = true
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-bionic-v20210325"
      size  = 64
      type  = "pd-ssd"
    }
  }
  network_interface {
    network = google_compute_network.netdata.name
    access_config {
      nat_ip = google_compute_address.netdata.address
    }
  }
  
  service_account {
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = "echo hello world"

}

