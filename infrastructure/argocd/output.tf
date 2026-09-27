output "argocd_namespace" {
  description = "Kubernetes namespace where Argo CD is installed."
  value       = var.argocd_namespace
}

output "argocd_chart_version" {
  description = "Argo CD Helm chart version."
  value       = var.argocd_chart_version
}

output "argocd_server_service" {
  description = "Argo CD server Kubernetes service."
  value       = "argocd-server"
}

output "argocd_port_forward_command" {
  description = "Command to expose the Argo CD UI locally."
  value       = "kubectl port-forward svc/argocd-server -n ${var.argocd_namespace} ${var.argocd_local_port}:80"
}

output "argocd_ui_url" {
  description = "Local Argo CD UI URL after starting port-forwarding."
  value       = "http://localhost:${var.argocd_local_port}"
}

output "argocd_local_port" {
  description = "Local port used to access the Argo CD UI."
  value       = var.argocd_local_port
}

