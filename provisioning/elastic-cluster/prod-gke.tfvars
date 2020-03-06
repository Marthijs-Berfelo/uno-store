
kube_config = {
  context = "gke_hybrit-code-factory_europe-west4_dev-ops"
  namespace = "uno-logging"
}

deployment_target = "prod"

kubernetes_cluster_type = "gke"

cluster_name = "logging"

es_master_replicas = 3

es_data_replicas = 0

es_storage_size = "5Gi"
