#!/bin/bash
# Terraform deployment automation

echo "Initializing Terraform..."
terraform init

echo "Validating Terraform..."
terraform validate

echo "Planning infrastructure..."
terraform plan -out=tfplan

echo "Applying infrastructure..."
terraform apply tfplan

echo "Terraform deployment complete."
