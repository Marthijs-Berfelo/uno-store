
kube_config = {
  context = "minikube"
  namespace = "elk-stack"
}

cluster_name = "logging"

es_host = "http://logging-master:9200"

//antiAffinity = "soft"

resources = {
  requests = {
    cpu = "100m"
    memory = "512M"
  }
  limits = {
    cpu = "1000m"
    memory = "512M"
  }
}
