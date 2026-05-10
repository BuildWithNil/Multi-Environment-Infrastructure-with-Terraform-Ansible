# 🚀 DevOps Project: Multi-Environment Infrastructure with Terraform & Ansible

## 📌 Project Overview

This project demonstrates how to provision and configure a complete **multi-environment infrastructure** using:

- **Terraform** → Infrastructure Provisioning
- **Ansible** → Configuration Management & Automation
- **AWS EC2** → Cloud Infrastructure
- **Nginx** → Web Server Deployment
- **Dynamic Inventory Automation** → Terraform + Ansible Integration

The project creates separate environments:

- DEV
- STG (Staging)
- PRD (Production)

---

# 🏗️ Architecture Workflow

```text
Terraform → Provision EC2 Infrastructure → Generate Outputs
        ↓
update_inventories.sh
        ↓
Dynamic Ansible Inventory Creation
        ↓
Ansible Playbooks & Roles
        ↓
Nginx Installation + Webpage Deployment
```

---

# 📂 Project Structure

```bash
Terra-Ansible_Multi-Env/
│
├── ansible/
│   ├── inventories/
│   ├── playbooks/
│   ├── roles/
│   └── update_inventories.sh
│
├── terraform/
│   ├── infra/
│   ├── main.tf
│   ├── provider.tf
│   └── terraform.tfvars
│
└── README.md
```

---

# ⚙️ Prerequisites

## Install Terraform

```bash
sudo apt update
sudo apt install terraform -y
```

## Install Ansible

```bash
sudo apt update
sudo apt install ansible -y
```

## Configure AWS CLI

```bash
aws configure
```

---

# 🚀 Terraform Deployment

```bash
cd terraform

terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

---

# 🔄 Update Dynamic Inventory

```bash
cd ../ansible

chmod +x update_inventories.sh

./update_inventories.sh
```

---

# 🔌 Verify Connectivity

```bash
ansible -i inventories/dev servers -m ping
```

---

# 🚀 Deploy Nginx using Ansible

```bash
ansible-playbook -i inventories/dev playbooks/install_nginx.yml
```

---

# 🌐 Access Application

```text
http://<PUBLIC_IP>
```

---

# 🧹 Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

# 👨‍💻 Author

## Nilamadhab Das

DevOps Engineer | AWS | Terraform | Ansible | Docker | Kubernetes

GitHub: github.com/BuildWithNil
LinkedIn: linkedin.com/in/buildwithnil
