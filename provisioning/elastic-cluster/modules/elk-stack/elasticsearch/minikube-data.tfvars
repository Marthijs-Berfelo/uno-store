
kube_config = {
  context = "minikube"
  namespace = "elk-stack"
}

cluster_name = "logging"

node_group = "data"

values_file = "minikube-data-values.yaml"

storage = {
  className = var.storage_class_name
  size = "100M"
}

replicas = 1