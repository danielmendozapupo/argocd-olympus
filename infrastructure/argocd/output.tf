output "argocd_namespace" {
  description = "Namespace containing the Argo CD installation."
  value       = kubernetes_namespace_v1.argocd.metadata[0].name
}

output "argocd_release_name" {
  description = "Installed Helm release name."
  value       = helm_release.argocd.name
}

output "argocd_chart_version" {
  description = "Installed argo-cd Helm chart version."
  value       = helm_release.argocd.version
}

output "argocd_port_forward_command" {
  description = "Command to access the Argo CD API/UI locally."
  value       = "kubectl -n ${var.argocd_namespace} port-forward svc/${var.argocd_release_name}-server 8080:443"
}

output "argocd_initial_admin_password_command" {
  description = "Command to retrieve the initial Argo CD admin password."
  value       = "kubectl -n ${var.argocd_namespace} get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d; echo"
}
