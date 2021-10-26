resource "rke_cluster" "kubernetes-cluster" {
  nodes {
    address = "10.184.0.2"
    user    = "vmgcp"
    role    = [ "controlplane", "worker", "etcd" ]
    ssh_key = file("replikasi.key")
    #sesuaikan location pathnya
  }

  nodes {
    address = "192.168.1.253"
    user    = "bigdata1"
    role    = ["worker"]
    ssh_key = file("replikasi.key")
  }
  nodes {
    address = "192.168.20.253"
    user    = "bigdata2"
    role    = ["worker"]
    ssh_key = file("replikasi.key")
  }
}

 resource "local_file" "kube_cluster_yaml" {   
     filename = "kube_config_cluster.yml"
     sensitive_content  = rke_cluster.kubernetes-cluster.kube_config_yaml
 }
