variable "kubeconfig_path" {
  description = "Path to the Kubernetes kubeconfig file."
  type        = string
  default     = "~/.kube/config"
}

variable "kube_context" {
  description = "Kubernetes context to use."
  type        = string
  default     = null
}

variable "namespace" {
  description = "Namespace where ingress-nginx will be installed."
  type        = string
  default     = "ingress-nginx"
}

variable "chart_version" {
  description = "Version of the ingress-nginx Helm chart."
  type        = string
}

variable "service_type" {
  description = "Kubernetes Service type for the ingress-nginx controller."
  type        = string
  default     = "NodePort"
}