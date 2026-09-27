variable "kubeconfig_path" {
  description = "Path to the kubeconfig used to access the homelab Kubernetes cluster."
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Optional kubeconfig context. Leave null to use the kubeconfig current-context."
  type        = string
  default     = null
  nullable    = true
}

variable "argocd_namespace" {
  description = "Kubernetes namespace in which Argo CD is installed."
  type        = string
  default     = "argocd"
}

variable "argocd_release_name" {
  description = "Helm release name for Argo CD."
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Pinned argo-cd Helm chart version."
  type        = string
  default     = "10.9.2"
}

variable "argocd_local_port" {
  description = "Local port used to access the Argo CD UI via kubectl port-forward."
  type        = number
  default     = 8082
}