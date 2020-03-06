cluster_name = "logging"

node_group = "master"

values_file = "prod-values.yaml"

storage = {
  className = var.storage_class_name
  size = "30G"
}