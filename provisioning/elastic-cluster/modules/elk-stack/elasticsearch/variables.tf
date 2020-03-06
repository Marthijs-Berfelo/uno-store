variable "kube_config" {
  type = object({
    context = string
    namespace = string
  })
  description = "The kubernetes context configuration, containing the 'context' (reference to the cluster) and the 'namespace'"
}

variable "dependencies" {
  type = "list"
  default = []
}

variable "time_out" {
  type = number
  description = "The timeout for creation of the resources, needed especially when pulling images."
}

variable "cluster_name" {
  type = string
  description = "The name of the ES cluster (must be equal for all ES nodes)"
}

variable "node_group" {
  type = string
  description = "The group the deployed nodes should be part of ( master - for master nodes | data - for data nodes)"
}

variable "values_file" {
  type = string
  description = "The name of the values file to use: [ minikube-values.yaml | prod-values.yaml ]"
}

variable "replicas" {
  type = number
  description = "The number of replicas in the node group"
  default = 3
}

variable "storage_class_name" {
  type = string
  description = "The name of the storage class to use for persistent storage"
  default = "elk-standard"
}

variable "storage" {
  type = object({
    className = string
    size = string
  })
  description = "The persistent storage config"
  default = {
    className = "elk-standard"
    size = "30Gi"
  }
}
