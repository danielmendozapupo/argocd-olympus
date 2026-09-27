output "namespace" {
  description = "Namespace where ingress-nginx is installed."
  value       = kubernetes_namespace_v1.ingress_nginx.metadata[0].name
}

output "release_name" {
  description = "Helm release name for ingress-nginx."
  value       = helm_release.ingress_nginx.name
}

output "service_type" {
  description = "Service type used by the ingress-nginx controller."
  value       = var.service_type
}