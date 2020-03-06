
kube_config = {
  context = "minikube"
  namespace = "elk-stack"
}

cluster_name = "logging"

node_group = "master"

values_file = "minikube-values.yaml"

storage = {
  className = "elk-standard"
  size = "100M"
}