variable "kube_config" {
  type = object({
    context = string
    namespace = string
  })
  description = "The kubernetes context configuration, containing the 'context' (reference to the cluster) and the 'namespace'"
}

variable "deployment_target" {
  type = string
  description = "The target environment to deploy the ELK stack to [ local: minikube | remote: prod ]"
}

variable "kubernetes_cluster_type" {
  type = string
  description = "The type of kubernetes cluster to target [ local: minikube | google: gke ]"
}

variable "cluster_name" {
  type = string
  description = "The name of the ES cluster (must be equal for all ELK nodes)"
}

variable "master_node_group" {
  type = string
  description = "The elasticsearch name of the master node group (is part of the elasticsearch service name to connect to)"
  default = "master"
}

variable "es_master_replicas" {
  type = number
  description = "The number of elasticsearch master nodes"
}

variable "es_data_replicas" {
  type = number
  description = "The number of elasticsearch data nodes"
}

variable "es_storage_size" {
  type = string
  description = "The size of the persistent volume for elasticsearch nodes"
}

variable "storage_class_name" {
  type = string
  description = "The name of the storage class to use for persistent storage"
  default = "elk-standard"
}

variable "storage" {
  type = object({
    className = string
    reclaimPolicy = string
  })
  description = "The persistent storage config"
  default = {
    className = "elk-standard"
    reclaimPolicy = "Retain"
  }
}
