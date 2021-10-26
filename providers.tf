terraform {
  required_providers {
    rke = {
      source = "rancher/rke"
      version = "1.2.3"
      # versi development 1.1.6
    }
  }
}

provider "rke" {
  debug = true
  log_file = "/tmp/rke-provider.log"
}
