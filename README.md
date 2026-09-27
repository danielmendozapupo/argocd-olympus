# argocd-olympus

Terraform bootstrap for Argo CD on the Olympus home Kubernetes cluster.

## Ownership boundary

- **Terraform** owns the Argo CD namespace and Helm release.
- **Argo CD** owns applications deployed to the Kubernetes cluster.
- Terraform state is local for now. A remote backend can be introduced later without changing the Kubernetes/Argo CD ownership model.

## Layout

```text
argocd-olympus/
├── infrastructure/
│   └── argocd/
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── terraform.tfvars.example
│       ├── variables.tf
│       ├── versions.tf
│       └── values.yaml
├── kubernetes/
│   ├── argocd/
│   └── apps/
└── .gitignore
```

## Prerequisites

- Terraform 1.x
- kubectl
- a working kubeconfig for the home Kubernetes cluster

Verify cluster access before running Terraform:

```bash
kubectl cluster-info
kubectl get nodes
kubectl config current-context
```

## Deploy Argo CD

```bash
cd infrastructure/argocd
cp terraform.tfvars.example terraform.tfvars

terraform init
terraform fmt -recursive
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

If your kubeconfig contains multiple clusters, set `kube_context` in `terraform.tfvars` before planning.

## Access Argo CD

After apply:

```bash
terraform output -raw argocd_port_forward_command
```

Run the command it prints, then open `https://localhost:8080`.

Retrieve the initial admin password with the command shown by:

```bash
terraform output -raw argocd_initial_admin_password_command
```

The initial username is `admin`.

## Local state

No backend block is configured, so Terraform uses local state. State files and `terraform.tfvars` are ignored by Git. Commit `.terraform.lock.hcl` after the first `terraform init`.

When remote state is desired later, add a backend configuration and migrate the existing state with `terraform init -migrate-state`.

## Next layer: GitOps

The `kubernetes/` directory is intentionally separate from the Terraform bootstrap. Once Argo CD is available, its root application/project can point back to this repository and applications can be added under `kubernetes/apps/` without making Terraform own those workloads.
