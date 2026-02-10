Instructions for accessing the private cluster using Bastion-Host and SSM

on local terminal run:
aws ssm start-session --target instance-id

switch to root user
sudo su

install dependencies
install aws-cli kubectl, unzip,etc.
	
update cluster congif
aws eks update-kubeconfig \
  --region us-east-1 \
  --name cluster-name

test connection to the cluster
kubectl get ns# Infra-pipeline
