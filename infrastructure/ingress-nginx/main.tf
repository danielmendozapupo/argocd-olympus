resource "kubernetes_namespace_v1" "ingress_nginx" {
  metadata {
    name = var.namespace

    labels = {
      "app.kubernetes.io/name"       = "ingress-nginx"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }
}

resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  namespace  = kubernetes_namespace_v1.ingress_nginx.metadata[0].name
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version

  wait          = true
  wait_for_jobs = true
  timeout       = 600

  set = [
    {
      name  = "controller.service.type"
      value = var.service_type
    },
    {
      name  = "controller.hostPort.enabled"
      value = "true"
    },
    {
      name  = "controller.hostPort.ports.http"
      value = "80"
    },
    {
      name  = "controller.hostPort.ports.https"
      value = "443"
    }
  ]

  depends_on = [
    kubernetes_namespace_v1.ingress_nginx
  ]
}