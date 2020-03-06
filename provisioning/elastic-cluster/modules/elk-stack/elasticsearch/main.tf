
locals {
  chart = "${path.module}/../../../../../ek-stack/elasticsearch"
  localContextName = "minikube"
  isLocal = var.kube_config.context == local.localContextName ? true : false
}

provider "helm" {
  debug = local.isLocal
  kubernetes {
    config_context = var.kube_config.context
  }
}

resource "helm_release" "es" {
  count = var.replicas > 0 ? 1 : 0
  chart = local.chart
  name = "es-${var.cluster_name}-${var.node_group}"
  namespace = var.kube_config.namespace
  wait = true
  timeout = var.time_out

  values = [
    file("${path.module}/helm_values/${var.values_file}")
  ]

  set {
    name = "clusterName"
    value = var.cluster_name
  }

  set {
    name = "nodeGroup"
    value = var.node_group
  }

  set {
    name = "replicas"
    value = var.replicas
  }

  set {
    name = "volumeClaimTemplate.storageClassName"
    value = var.storage.className
  }

  set {
    name = "volumeClaimTemplate.resources.requests.storage"
    value = var.storage.size
  }
}
