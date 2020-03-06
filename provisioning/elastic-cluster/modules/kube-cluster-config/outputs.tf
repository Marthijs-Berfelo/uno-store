
output "result" {
  value = var.cluster_type == "minikube" ? kubernetes_storage_class.minikube[0].id : kubernetes_storage_class.gke_regional[0].id
}