
output "result" {
  value = var.replicas > 0 ? helm_release.es[0].id : "none"
}
