🏗️ JioPay App Infrastructure
This repository contains Infrastructure as Code (IaC) for provisioning and managing the JioPay Application Infrastructure on Microsoft Azure using Terraform.

📘 Overview
The project automates the creation and configuration of core Azure resources required for the JioPay platform. It ensures consistency, scalability, and security across environments by using modular Terraform architecture integrated with Azure DevOps pipelines for CI/CD automation.

🚀 Key Features
Fully Automated Infrastructure Provisioning using Terraform
Modular Design for easy maintenance and reusability
Secure Resource Management using Azure Key Vault
Networking Architecture with VNet, Subnets, NSG, and Bastion
Azure SQL & Storage Account Integration
CI/CD Integration with Azure DevOps for seamless deployments
State Management using Remote Backend (Azure Storage + State Locking)

🧱 Core Azure Resources
Resource Group
Virtual Network & Subnets
Network Security Groups
Public IP, Bastion, and Firewall
Storage Account
Azure SQL Server & Database
Key Vault (for secrets and credentials)

⚙️ Tools & Technologies
Terraform 
Azure Cloud
Azure DevOps Pipelines
Git & GitHub for Version Control

🔐 Security Practices
All secrets stored in Azure Key Vault
Backend state protected with Azure Storage Access Controls
Role-based access through Azure RBAC

🧑‍💻 Author
Akshay Pakade
DevOps Engineer
🔗 Automating Cloud Infrastructure with Terraform & Azure Cloud
