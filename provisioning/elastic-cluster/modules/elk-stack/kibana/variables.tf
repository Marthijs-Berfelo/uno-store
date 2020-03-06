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

variable "es_host" {
  type = string
  description = "The elasticsearch host url"
}

// TODO: add pod anti affinity when scaling dashboard
//variable "antiAffinity" {
//  type = string
//  default = "hard"
//}

variable "resources" {
  type = object({
    limits = object({
      cpu = string
      memory = string
    })
    requests = object({
      cpu = string
      memory = string
    })
  })
  description = "The POD resource configuration"
  default = {
    requests = {
      cpu = "100m"
      memory = "500Mi"
    }
    limits = {
      cpu = "1000m"
      memory = "1Gi"
    }
  }
}

variable "replicas" {
  type = number
  description = "The number of replicas in the node group"
  default = 1
}
