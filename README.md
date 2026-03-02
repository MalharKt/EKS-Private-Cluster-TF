Private Production EKS Cluster using Terraform + SSM Bastion

Overview
This repository provisions a production-ready private Amazon EKS cluster using Infrastructure as Code with Terraform.

The architecture deploys:

A custom VPC module for networking

A custom IAM module for secure roles & policies

A private EKS cluster in private subnets

A public bastion host accessible via AWS Systems Manager (SSM)

This eliminates the need for SSH key management while keeping the Kubernetes control plane and worker nodes private.

Architecture Summary

Public Subnet

Bastion EC2 instance with SSM access (no SSH required)

Private Subnets

EKS worker nodes

Internal resources

Custom Modules Used

modules/vpc → Creates VPC, subnets, routing, NAT, security boundaries

modules/iam → Creates IAM roles, policies, and instance profiles for EKS, nodes, and SSM

modules/eks → Provisions private EKS control plane & node groups

Deployment Steps
terraform init
terraform plan
terraform apply

Accessing the Cluster Securely
On local terminal run:
aws ssm start-session --target instance-id

Switch to root user
sudo su

Install dependencies
install aws-cli kubectl, unzip,etc.
	
Update cluster congif
aws eks update-kubeconfig \
  --region us-east-1 \
  --name cluster-name

Test connection to the cluster
kubectl get ns