terraform {
  backend "gcs" {
    bucket = "terraform-ansible-netdata-tf-state"
    prefix = "terraform/state"
  }
}