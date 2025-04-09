# 🚀 Azure Terraform POC

This repository contains a simple **Terraform proof-of-concept** to deploy a **Linux Virtual Machine** on **Microsoft Azure**, including the necessary networking components like VNet, Subnet, and NIC. It is designed to help you get started with Infrastructure as Code (IaC) on Azure using Terraform.

---

## 📦 What This Repo Does

- Sets up a **Virtual Network** and **Subnet**
- Creates a **Network Interface (NIC)**
- Provisions a **Linux Virtual Machine** (Ubuntu 18.04 LTS)
- Allows passing environment-specific details like credentials, resource group, and location via variables

---

## ✅ Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.3 or above recommended)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- A valid **Azure Subscription**
- Azure Service Principal credentials (for non-interactive login)

---

## 🔐 Required Azure Credentials

You’ll need the following values to authenticate with Azure:

- `subscription_id`
- `client_id` (App ID of the Service Principal)
- `client_secret` (Password/Secret of the Service Principal)
- `tenant_id`

---

## 🗂 Project Structure

azure-tf-poc/
├── main.tf              → (Optional) Entry file; can be left empty or used to organize modules
├── provider.tf          → Azure provider configuration and authentication setup
├── vm.tf                → Contains VM, VNet, Subnet, and NIC resource definitions
├── variables.tf         → Declares input variables (e.g., location, credentials, names)
├── terraform.tfvars     → Defines actual values for the declared variables (keep this private)
├── outputs.tf           → (Optional) Used to output values after deployment (e.g., public IP)
└── README.md            → Documentation and usage instructions

⚙️ How to Use

1. Clone the Repo

git clone https://github.com/Dineshkumardevops/azure-tf-poc.git
cd azure-tf-poc

2. Create terraform.tfvars
Create a terraform.tfvars file in the root of the project and fill it with your values:

subscription_id     = "your-subscription-id"
client_id           = "your-client-id"
client_secret       = "your-client-secret"
tenant_id           = "your-tenant-id"
admin_password      = "P@ssw0rd1234!"
resource_group_name = "your-resource-group-name"
location            = "your-location" # e.g. "southcentralus"
vm_name             = "your-vm-name"

⚠️ DO NOT COMMIT this file if the repo is public.

3. Initialize Terraform

    terraform init

4. Validate the Configuration

    terraform validate

5. Deploy the Infrastructure

    terraform apply

    Respond with yes when prompted.

6. Destroy the Infrastructure (Optional)

    terraform destroy

📌 Notes
This is a demo setup. For production, consider using:

SSH keys instead of passwords

Azure Key Vault for secret management

Remote state storage (e.g., Azure Storage Account with state locking)

Make sure your Service Principal has the right RBAC permissions on the subscription.

## 🙌 Acknowledgments

- [Terraform by HashiCorp](https://www.terraform.io/) – Infrastructure as Code (IaC) tool used for automating cloud infrastructure.
- [Azure Provider for Terraform](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) – Official Azure provider documentation for Terraform.
- [Microsoft Azure Documentation](https://learn.microsoft.com/en-us/azure/) – Official docs for understanding and managing Azure services.
- [Azure CLI Documentation](https://learn.microsoft.com/en-us/cli/azure/) – Useful for managing resources and generating service principal credentials.


