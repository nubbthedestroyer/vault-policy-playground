# Vault Policy Playground

#### Into
This repo contains a set of Terraform and Vault HCL that allows the user to experiement with different Vault policies and configurations.  There are a few key components:

#### Components
* main.tf
    * This contains all the TF necessary to provision vault policies on a local dev server, but could also be used to apply the policies and other resources in production.  
    * Of course, you could always just run the CLI commands or hit the API, but this allows the user to see the config as it was at apply and manage small changes, effectively making it easier to experiment.
    * The "token" value in the parameters for the vault provider are left blank because vault will automatically login and store the token in "~/.vault-token" and terraform will get it from there.
* Policy documents (policy-*.hcl)
    * This is a set of independent Vault policies that allow for a starting point for experimentation.  The policies are appled in main.tf in the 'resource "vault_policy"' blocks.
* start-vault.sh
    * example for starting vault in a local dev server config for easy play.  
    
#### Pre-Requisites

* Vault binary
* Terraform Binary

#### Instructions

Start vault server in dev mode
```bash
./start-vault.sh
```

run the terraform to configure the policies
```bash
terraform init
terraform apply
```

test and play around with the policies
```bash
vault token create -policy=devs_policy_full_example
vault kv get devplayground/footest
```
