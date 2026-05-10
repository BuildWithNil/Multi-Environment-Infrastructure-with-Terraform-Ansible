# 🚀 DevOps Project: Multi-Environment Infrastructure with Terraform & Ansible

## 📌 Project Overview

This project demonstrates provisioning and configuration of a complete **multi-environment infrastructure** using:

- Terraform → Infrastructure Provisioning
- Ansible → Configuration Management
- AWS EC2 → Cloud Infrastructure
- Nginx → Web Server Deployment
- Dynamic Inventory Automation → Terraform + Ansible Integration

Environments:
- DEV
- STG
- PRD

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
│   │   ├── dev.example
│   │   ├── stg.example
│   │   └── prd.example
│   │
│   ├── playbooks/
│   ├── roles/
│   └── update_inventories.sh
│
├── terraform/
│   ├── infra/
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── nil-terra-key.pub
│
├── .gitignore
└── README.md
```

---

# ☁️ Technologies Used

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure as Code |
| Ansible | Configuration Management |
| AWS EC2 | Cloud Compute |
| Nginx | Web Server |
| Bash | Inventory Automation |
| S3 Backend | Remote Terraform State |
| DynamoDB | State Locking |

---

# 🔥 Features

✅ Multi-Environment Infrastructure

✅ Dynamic Inventory Automation

✅ Reusable Terraform Modules

✅ Ansible Roles Implementation

✅ Automated Nginx Deployment

✅ Remote Terraform Backend

✅ Scalable Infrastructure Design

---

# ⚙️ Prerequisites

## Install Terraform

```bash
sudo apt update
sudo apt install terraform -y
```

Check version:

```bash
terraform -version
```

---

## Install Ansible

```bash
sudo apt update
sudo apt install ansible -y
```

Check version:

```bash
ansible --version
```

---

## Install AWS CLI

```bash
sudo apt install awscli -y
```

Configure AWS:

```bash
aws configure
```

---

# 🔐 Generate SSH Key Pair

```bash
ssh-keygen -t rsa
```

Move keys:

```bash
mv ~/.ssh/id_rsa terraform/nil-terra-key
mv ~/.ssh/id_rsa.pub terraform/nil-terra-key.pub
```

Set permissions:

```bash
chmod 400 terraform/nil-terra-key
```

---

# 📥 Clone Repository

```bash
git clone https://github.com/BuildWithNil/Terra-Ansible_Multi-Env.git

cd Terra-Ansible_Multi-Env
```

---

# 🚀 Step 1: Deploy Infrastructure using Terraform

Navigate to Terraform directory:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview infrastructure:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply -auto-approve
```

---

# 📤 Terraform Outputs

```bash
terraform output
```

Example:

```bash
dev_infra_ec2_public_ips
stg_infra_ec2_public_ips
prd_infra_ec2_public_ips
```

---

# 🔄 Step 2: Update Dynamic Inventories

Navigate to ansible directory:

```bash
cd ../ansible
```

Make script executable:

```bash
chmod +x update_inventories.sh
```

Run inventory update script:

```bash
./update_inventories.sh
```

This script dynamically updates:

- inventories/dev
- inventories/stg
- inventories/prd

---

# 📁 Inventory Templates

For security reasons, actual inventory files are excluded from the repository.

Use example inventory templates:

```bash
cp inventories/dev.example inventories/dev

cp inventories/stg.example inventories/stg

cp inventories/prd.example inventories/prd
```

Replace placeholder IPs with your actual EC2 public IPs.

---

# 📄 Example Inventory

```ini
[servers]
server1 ansible_host=<SERVER_PUBLIC_IP>

[servers:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=~/.ssh/nil-terra-key.pem
ansible_python_interpreter=/usr/bin/python3
```

---

# 🔌 Step 3: Verify Ansible Connectivity

```bash
ansible -i inventories/dev servers -m ping
```

Expected Output:

```bash
server1 | SUCCESS => {
    "ping": "pong"
}
```

---

# 🚀 Step 4: Deploy Nginx using Ansible Role

```bash
ansible-playbook -i inventories/dev playbooks/install_nginx.yml
```

This playbook:

✅ Installs Nginx

✅ Starts & Enables Nginx

✅ Deploys Static Webpage

---

# 📜 Ansible Role Structure

```bash
roles/nginx-role/
├── defaults/
├── files/
│   └── index.html
├── handlers/
├── meta/
├── tasks/
│   └── main.yml
├── templates/
├── tests/
└── vars/
```

---

# 🌐 Access Application

Copy EC2 Public IP from Terraform output:

```bash
terraform output
```

Open in browser:

```text
http://<PUBLIC_IP>
```

---

# 🔒 Security Best Practices

The following sensitive files are excluded using `.gitignore`:

- PEM Keys
- Terraform State Files
- Terraform Variables
- Dynamic Inventories
- Secrets & Environment Variables

Never upload:

❌ `.pem` files

❌ AWS credentials

❌ Terraform secrets

❌ `.terraform/` directory

---

# 🧹 Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

# 🛠️ Troubleshooting

## Permission Denied

```bash
chmod 400 nil-terra-key
```

---

## Host Key Verification Failed

```bash
ssh-keygen -R <IP>
```

---

## Verify Inventory

```bash
ansible-inventory -i inventories/dev --list
```

---

# 📈 Future Enhancements

- Docker Integration
- Kubernetes Deployment
- Jenkins/GitHub Actions CI/CD
- Monitoring with Prometheus & Grafana
- Load Balancer & Auto Scaling
- SSL using ACM + Route53

---

# 🎯 Learning Outcomes

This project demonstrates:

- Infrastructure as Code (IaC)
- Multi-Environment Deployment
- Dynamic Inventory Automation
- Cloud Infrastructure Provisioning
- Configuration Management using Ansible
- Reusable DevOps Architecture

---

# 👨‍💻 Author

## Nilamadhab Das

DevOps Engineer | AWS | Terraform | Ansible | Docker | Kubernetes

GitHub: github.com/BuildWithNil

LinkedIn: linkedin.com/in/buildwithnil

---

# ⭐ Support

If you found this project useful:

⭐ Star the repository

🍴 Fork the project

📢 Share with others