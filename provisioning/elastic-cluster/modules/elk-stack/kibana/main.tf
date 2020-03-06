locals {
  chart = "${path.module}/../../../../../ek-stack/kibana"
  localContextName = "minikube"
  isLocal = var.kube_config.context == local.localContextName ? true : false
}

provider "helm" {
  debug = local.isLocal
  kubernetes {
    config_context = var.kube_config.context
  }
}

resource "helm_release" "kibana" {
  chart = local.chart
  name = "${var.cluster_name}-dashboard"
  namespace = var.kube_config.namespace
  wait = true
  timeout = var.time_out

  set {
    name = "elasticsearchHosts"
    value = var.es_host
  }

  set {
    name = "replicas"
    value = var.replicas
  }

  set {
    name = "resources.requests.cpu"
    value = var.resources.requests.cpu
  }

  set {
    name = "resources.requests.memory"
    value = var.resources.requests.memory
  }

  set {
    name = "resources.limits.cpu"
    value = var.resources.limits.cpu
  }

  set {
    name = "resources.limits.memory"
    value = var.resources.limits.memory
  }
}
