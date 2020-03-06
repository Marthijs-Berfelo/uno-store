variable "kube_config" {
  type = object({
    context = string
    namespace = string
  })
  description = "The kubernetes context configuration, containing the 'context' (reference to the cluster) and the 'namespace'"
}

variable "cluster_type" {
  type = string
  description = "The type of kubernetes cluster to target [ local: minikube | google: gke ]"
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

variable "cluster_zones" {
  type = string
  description = "The zones (comma separated string) that the kubernetes cluster should span in a cloud provider."
  default = "europe-west4-a,europe-west4-b"
}
