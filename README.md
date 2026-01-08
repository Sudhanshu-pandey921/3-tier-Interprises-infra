# 3-Tier Enterprises Infrastructure

> Professional Terraform-based Azure infrastructure for a 3-tier application (web → app → data).


## 🚀 Project Overview

This repository contains Terraform configurations and reusable modules to provision a 3-tier application infrastructure on Microsoft Azure. The design separates environment-specific configurations (e.g., `dev`, `prod`) from reusable modules (networking, VMs, databases), enabling consistent, repeatable deployments.

Key goals:
- Modular, testable Terraform code
- Environment isolation (dev / prod)
- Reusable modules for cloud resources
- Clear variables/outputs to support automation and CI/CD


---

## 📁 Repository Structure

```
/ (root)
├─ environments/
│  ├─ dev/                 # Development environment (tfvars for dev)
│  └─ prod/                # Production environment (tfvars for prod)
└─ modules/                # Reusable terraform modules
   ├─ linux_vm/
   ├─ mysql/
   ├─ nic/
   ├─ nsg/
   ├─ nsg_association/
   ├─ public-ip/
   ├─ resource_group/
   ├─ sql_database/
   ├─ subnet/
   └─ vnet/
```

Each module contains `main.tf`, `variables.tf`, and `outputs.tf` (or `output.tf`) and is designed to be compositionally consumed by environment-level configs.


---

## 🔧 Modules (what they do)

- `resource_group` — Creates Azure Resource Groups and common tags
- `vnet` / `subnet` — Virtual Network and Subnet resources
- `nsg` / `nsg_association` — Network Security Groups and associations
- `public-ip` — Public IP addresses
- `nic` — Network Interface Cards for VMs
- `linux_vm` — Linux virtual machines (image, size, SSH keys, extension hooks)
- `mysql` / `sql_database` — Managed database services


---

## 🧭 Environments

Two environment folders exist:
- `environments/dev` — for development testing and iteration
- `environments/prod` — for production-grade configuration

Each environment contains:
- `main.tf` — composition of modules targeting that environment
- `variables.tf` — variable definitions
- `terraform.tfvars` — environment-specific variable values (sensitive values should not be committed)
- `provider.tf` / `locals.tf` / `data.tf` — environment-scoped provider and data definitions


---

## ✅ Prerequisites

- Terraform (recommended version pinned in CI) — install from https://www.terraform.io
- Azure CLI — for authentication (az login) and managing subscriptions
- Access to an Azure subscription with sufficient permissions to create resources
- Recommended: Use a service principal and managed identity for automation


---

## 🧪 Typical Workflow

1. Authenticate with Azure:

```bash
az login
az account set --subscription "<YOUR_SUBSCRIPTION>"
```

2. Select environment and initialize Terraform:

```bash
cd environments/dev
terraform init
```

3. Plan and review changes:

```bash
terraform plan -var-file=terraform.tfvars
```

4. Apply changes:

```bash
terraform apply -var-file=terraform.tfvars
```

5. To destroy (clean up):

```bash
terraform destroy -var-file=terraform.tfvars
```


---

## 🔒 Secrets & Sensitive Data

- **Never commit** secrets, service principals, or credentials to the repository.
- Use Azure Key Vault, environment variables, or your CI/CD secrets store to inject sensitive values at runtime.
- Keep `terraform.tfstate` out of source control; use remote state backends (Azure Storage + ADLS, or Terraform Cloud) for collaboration and state locking.


---

## ✅ Best Practices & Conventions

- Keep modules small and focused (single responsibility)
- Prefer explicit variable names and document them in `variables.tf`
- Add tags to resources for owner, environment, and cost center
- Names should include environment prefix when necessary (e.g., `dev-app-vm-01`)
- Write and run `terraform validate` and `terraform fmt` before commits


---

## 🛠 Extending the Repo

- Add a new environment: copy `environments/dev` → `environments/<your-env>`, update `terraform.tfvars` and provider settings
- Add a new module: create `modules/<name>/` with `main.tf`, `variables.tf`, and `outputs.tf`; import the module into environment `main.tf`


---

## 🔁 CI / CD Recommendations

- Use pipeline tasks to run `terraform fmt`, `terraform validate`, `terraform plan` with `-out`, and store plan artifacts for `terraform apply` step
- Keep credentials in pipeline secrets and use a service principal or managed identity
- Protect `prod` environment deployments with approvals and manual gates


---

## 🤝 Contributing

Contributions are welcome! Please open an issue or a pull request with a clear description and testing notes. Ensure all Terraform changes pass `terraform fmt` and `terraform validate` in CI.


---

## 📜 License & Maintainers

- License: Add an appropriate license file (`LICENSE`) if needed (e.g., MIT)
- Maintainers: Add contact info, or list team/people responsible for the repo


---

If you'd like, I can also:
- Add example environment `README.md` files under `environments/dev` and `environments/prod` ✅
- Add a `CONTRIBUTING.md` and a `SECURITY.md` template ✅


---

*Generated to reflect the current project layout and best practices.*
