# Azure VM Deployment with Terraform

This repository contains Terraform code to deploy Azure Virtual Machines (VMs) in a private subnet behind a load balancer, with SSH access through a bastion host.

## Prerequisites

Before you begin, ensure you have the following:

- Azure subscription
- Terraform installed (version >= x.x.x)
- Azure CLI installed (for managing Azure resources)

## Getting Started

1. Clone this repository:

   ```bash
   git clone https://github.com/your-repo-name.git
   ```

2. Navigate to the cloned directory:

   ```bash
   cd your-repo-name
   ```

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Create a `terraform.tfvars` file with the required variables. Here's an example:

   ```hcl
   web_linuxvm_instance_count = 2
   ```

   Adjust the value of `web_linuxvm_instance_count` as needed.

5. Review and adjust the `variables.tf` file to configure other settings as per your requirements.

6. Review and adjust the `main.tf` file to customize resource names, sizes, etc., according to your preferences.

7. Apply the Terraform configuration:

   ```bash
   terraform apply
   ```

   This will create the Azure resources based on the specified configuration.

## SSH Access via Bastion Host

To access the VMs via SSH, you'll need to connect through the bastion host. Here's how:

1. Get the public IP address of the bastion host from the Azure Portal or using the Azure CLI.

2. SSH into the bastion host:

   ```bash
   ssh username@bastion-public-ip
   ```

3. Once connected to the bastion host, SSH into the desired VM(s) within the private subnet:

   ```bash
   ssh username@private-vm-ip
   ```

   Replace `username` with your username and `private-vm-ip` with the private IP address of the VM you want to connect to.

## Cleanup

To avoid incurring costs, ensure to destroy the created Azure resources when they are no longer needed:

```bash
terraform destroy
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.