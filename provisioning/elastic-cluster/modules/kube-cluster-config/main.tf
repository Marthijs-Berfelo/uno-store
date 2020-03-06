
provider "kubernetes" {
  config_context = var.kube_config.context
}

resource "kubernetes_namespace" "elk_stack" {
  metadata {
    name = var.kube_config.namespace
  }
}

resource "kubernetes_storage_class" "minikube" {
  count = var.cluster_type == "minikube" ? 1 : 0
  storage_provisioner = "k8s.io/minikube-hostpath"
  reclaim_policy = var.storage.reclaimPolicy
  metadata {
    name = var.storage.className
  }
  depends_on = [kubernetes_namespace.elk_stack]
}

resource "kubernetes_storage_class" "gke_regional" {
  count = var.cluster_type == "gke" ? 1 : 0
  storage_provisioner = "kubernetes.io/gce-pd"
  reclaim_policy = var.storage.reclaimPolicy
  metadata {
    name = var.storage.className
  }
  parameters = {
    type = "pd-standard"
    replication-type = "none"
    zones = var.cluster_zones
  }

  depends_on = [kubernetes_namespace.elk_stack]
}
