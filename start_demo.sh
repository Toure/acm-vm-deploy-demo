#!/bin/bash

# ANSI Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== ACM VM Deploy Demo ===${NC}"

# Check requirements
if ! command -v ansible-playbook &> /dev/null; then
    echo "Error: ansible-playbook could not be found."
    exit 1
fi

echo -e "${GREEN}Installing Ansible Requirements...${NC}"
ansible-galaxy collection install -r requirements.yml

echo ""
echo "Select an option:"
echo "1) Deploy to VMWare (deploy_vsphere_vm.yml)"
echo "2) Deploy Policy [KubeVirt] (deploy_vm_policy.yml)"
echo "3) Exit"
echo ""

read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo -e "${BLUE}Starting VMWare Deployment...${NC}"
        ansible-playbook -i inventory deploy_vsphere_vm.yml
        ;;
    2)
        echo -e "${BLUE}Starting Policy Deployment...${NC}"
        ansible-playbook -i inventory deploy_vm_policy.yml # Using inventory for implicit localhost warning suppression if needed, though mostly local
        ;;
    3)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac
