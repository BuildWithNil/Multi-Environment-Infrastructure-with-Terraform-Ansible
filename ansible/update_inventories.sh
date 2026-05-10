#!/bin/bash

# Paths and Variables
TERRAFORM_OUTPUT_DIR="../terraform"
ANSIBLE_INVENTORY_DIR="../ansible/inventories"

# Navigate to Terraform directory
cd "$TERRAFORM_OUTPUT_DIR" || {
    echo "Terraform directory not found"
    exit 1
}

# Fetch IPs from Terraform outputs
DEV_IPS=$(terraform output -json dev_infra_ec2_public_ips | jq -r '.[]')

STG_IPS=$(terraform output -json stg_infra_ec2_public_ips | jq -r '.[]')

PRD_IPS=$(terraform output -json prd_infra_ec2_public_ips | jq -r '.[]')

# Function to update inventory file
update_inventory_file() {

    local ips="$1"
    local inventory_file="$2"
    local env="$3"

    # Create/Clear inventory file
    > "$inventory_file"

    # Inventory group
    echo "[servers]" >> "$inventory_file"

    # Add dynamic hosts
    local count=1

    for ip in $ips; do
        echo "server${count} ansible_host=$ip" >> "$inventory_file"
        count=$((count + 1))
    done

    # Common variables
    echo "" >> "$inventory_file"
    echo "[servers:vars]" >> "$inventory_file"
    echo "ansible_user=ubuntu" >> "$inventory_file"
    echo "ansible_ssh_private_key_file=/home/nil/.ssh/nil-terra-key.pem" >> "$inventory_file"
    echo "ansible_python_interpreter=/usr/bin/python3" >> "$inventory_file"

    echo "Updated $env inventory: $inventory_file"
}

# Update inventory files
update_inventory_file "$DEV_IPS" "$ANSIBLE_INVENTORY_DIR/dev" "DEV"

update_inventory_file "$STG_IPS" "$ANSIBLE_INVENTORY_DIR/stg" "STG"

update_inventory_file "$PRD_IPS" "$ANSIBLE_INVENTORY_DIR/prd" "PRD"

echo "All inventory files updated successfully!"