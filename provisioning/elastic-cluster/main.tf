
locals {
  es-master_values_file = "${var.deployment_target}-values.yaml"
  es_data_values_file = "${var.deployment_target}-data-values.yaml"
  es_storage = {
    className = var.storage_class_name
    size = var.es_storage_size
  }
  es_host = "http://${var.cluster_name}-${var.master_node_group}:9200"
}

module "kubernetes_config" {
  source = "./modules/kube-cluster-config"
  kube_config = var.kube_config
  cluster_type = var.kubernetes_cluster_type
}


module "elasticsearch_master" {
  source = "./modules/elk-stack/elasticsearch"
  kube_config = var.kube_config
  cluster_name = var.cluster_name
  node_group = var.master_node_group
  values_file = local.es-master_values_file
  replicas = var.es_master_replicas
  storage = local.es_storage

  time_out = 600

  dependencies = [module.kubernetes_config.result]
}

module "elasticsearch_data" {
  source = "./modules/elk-stack/elasticsearch"
  kube_config = var.kube_config
  cluster_name = var.cluster_name
  node_group = "data"
  values_file = local.es_data_values_file
  replicas = var.es_data_replicas
  storage = local.es_storage

  time_out = 600

  dependencies = [module.elasticsearch_master.result]
}

module "kibana" {
  source = "./modules/elk-stack/kibana"
  kube_config = var.kube_config
  cluster_name = var.cluster_name
  es_host = local.es_host

  time_out = 600

  dependencies = [module.elasticsearch_master.result]
}
