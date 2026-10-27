# Notes Terraform Repair

This repository holds the Terraform configuration for the CloudNotes notes API. It uses the built-in `terraform_data` resource, so it needs **no cloud provider, no cloud account, no credential, and no billing**. You only run `init`, `validate`, and `plan`. **Never run `terraform apply`.**

## Layout

```text
terraform/
├── versions.tf          # Terraform version constraint, local state
├── main.tf              # root configuration: calls two modules
├── variables.tf         # root input variables
├── outputs.tf           # root outputs
└── modules/
    ├── network/         # main.tf, variables.tf, outputs.tf
    └── service/         # main.tf, variables.tf, outputs.tf
```

## Intended design

1. **Root variables.** The root configuration declares three input variables in `variables.tf`, each with a type, a description, and a default:
   | Variable | Type | Default |
   |---|---|---|
   | `environment` | `string` | `"local"` |
   | `region` | `string` | `"us-central1"` |
   | `app_port` | `number` | `5000` |
2. **Module wiring.** The `service` module attaches to the network created by the `network` module. The network's ID is passed from the `network` module output into the `service` module input. The `service` module exposes its endpoint (the `local.endpoint` value) as an output named `endpoint`, and the root `outputs.tf` reads it.
3. **State safety.** Terraform state files, state backups, plan files, and the `.terraform/` folder are never tracked by Git. `.gitignore` prevents them from being added again.

## Commands (run from the repository root)

```bash
terraform -chdir=terraform init -backend=false
terraform -chdir=terraform fmt -check -recursive
terraform -chdir=terraform validate
terraform -chdir=terraform plan -out=tfplan
```

Check what Git tracks:

```bash
git status --short
git ls-files
```

## Rules

- The repository has exactly three planted issues. Fix them in task order so the intended design is met. One issue may hide the next.
- Do not change resource names, module names, or module `main.tf` files.
- Do not hardcode values that the design says come from a variable or a module output.
- Never run `terraform apply`. Never add a cloud provider or credential.
