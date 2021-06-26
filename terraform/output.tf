resource "local_file" "netdata_ip_address" {
    content  = google_compute_address.netdata.address
    filename = "output/netdata_ip_address"
}