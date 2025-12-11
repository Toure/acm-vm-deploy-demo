# ACM VM Deployment Demo

This playbook demonstrates how to deploy a Virtual Machine to VMware vSphere using Ansible. It is designed to be used with Red Hat Advanced Cluster Management for Kubernetes (ACM) but can also be run standalone.

## Prerequisites

- Ansible installed
- Access to a vCenter server
- A valid template exists in vCenter

## Setup

1.  **Install Requirements**
    Run the following command to install the required Ansible collections:
    ```bash
    ansible-galaxy collection install -r requirements.yml
    ```

2.  **Configure Inventory**
    Edit the `inventory` file to point to your execution node (bastion host or localhost).

3.  **Configure Variables**
    Update `vars/main.yml` with your vCenter credentials and VM specifications.

## Usage

To run the playbook:

```bash
ansible-playbook -i inventory deploy_vsphere_vm.yml
```

## Notes

- This playbook assumes `pyvmomi` is installed on the execution node or will be installed by the playbook (requires sudo/root).
- The `deploy_vsphere_vm.yml` playbook disables fact gathering (`gather_facts: no`) for speed, as it focuses on VM deployment.
