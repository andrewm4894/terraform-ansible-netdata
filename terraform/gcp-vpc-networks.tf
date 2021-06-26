resource "google_compute_network" "netdata" {
  name = "nedata"
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.netdata.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "netdata" {
  name    = "netdata"
  network = google_compute_network.netdata.name
  allow {
    protocol = "tcp"
    ports    = ["19999"]
  }
  # ip's to whitelist
  source_ranges = var.netdata_ip_allowlist
}