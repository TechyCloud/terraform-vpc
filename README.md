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
You can download terraform code [here](https://github.com/TechyCloud/terraform-vpc/archive/main.zip) to setup the VPC with public & private subnets.

Once downloaded you can update the below vaiables in main.tf file. 

```
VPC_Name =  "Test-VPC"
VPC_CIDR_block = "10.20.0.0/16"
Environment_Name = "DEV"
IGW_Name = "Test-IGW"
Public_RouteTable_Name = "Public-RT"
Private_RouteTable_Name = "Private-RT"
public_subnets_cidr = ["10.20.1.0/24", "10.20.2.0/24"]
public_subnets_Zone = ["ap-south-1a", "ap-south-1a"]
private_subnets_cidr = ["10.20.3.0/24", "10.20.4.0/24"]
private_subnets_Zone = ["ap-south-1b", "ap-south-1b"]
```
