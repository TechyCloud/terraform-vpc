# terraform-vpc

Terraform is an Infrastructure as a Code product. In this article, we are going to use Terraform to create a complete VPC with Public Subnet & Private Subnet, Internet Gateway, Nat Gateway, Route Tables, EIP and spread across all our defined Availability Zones on AWS. With Terraform, you can easily create a whole new infrastructure by only creating variables, and destroy it with just a single command.

## Prerequisites
- Terraform v0.13.5
- AWS CLI Instlled
- IAM Access Key & Secret Key

This module will launching the below resources as per given veriables in the AWS console.
- VPC
- Public Subnet
- Private Subnet
- Route Tables with association
- Internet Gateway
- Nat Gateway with EIP

## Usage
You can download the terraform code from [here](https://github.com/TechyCloud/terraform-vpc.git) 
