
kube_config = {
  context = "minikube"
  namespace = "logging"
}

deployment_target = "minikube"

kubernetes_cluster_type = "minikube"

cluster_name = "logging"

es_master_replicas = 3

es_data_replicas = 0

es_storage_size = "100M"

ls_storage_size = "1G"

logstash_pipelines = [
  "gelf"
]

logstash_mule_pipelines = [
  "mule-logs"
]

cloudhub_config = {
  user = "marthijs__hybrit"
  pass = "G50Ob^$hrqYz"
  env = "Sandbox"
  num_log_lines = 150
}