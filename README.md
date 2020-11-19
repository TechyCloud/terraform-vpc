# terraform-vpc

Terraform is an Infrastructure as a Code product. In this article, we are going to use Terraform to create a complete VPC with Public Subnet & Private Subnet, Internet Gateway, Nat Gateway, Route Tables, EIP and spread across all our defined Availability Zones on AWS. With Terraform, you can easily create a whole new infrastructure by only creating variables, and destroy it with just a single command.

## Prerequisites
- Terraform v0.13.5
- AWS CLI Instlled
- IAM Access Key & Secret Key

###### This module will launching the below resources as per given veriables in the AWS console.
- VPC
- Public Subnet
- Private Subnet
- Route Tables with association
- Internet Gateway
- Nat Gateway with EIP

## Usage
You can download terraform code [here](https://github.com/TechyCloud/terraform-vpc/archive/main.zip) to setup the VPC with public & private subnets.

Once downloaded you can update the below vaiables in main.tf file. If you want to add more then two subnets either public or private subnets you can add subnet **CIDR range** like below on respective variables. 

**Public Sunet CIDR**
> public_subnets_cidr = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]

**Private Subnet CIDR**
> private_subnets_cidr = ["10.20.5.0/24", "10.20.6.0/24", 10.20.7.0/24]

Like wise, You can add the **availability zone** in the both(Public & Private) vaiables.

> public_subnets_Zone = ["ap-south-1a", "ap-south-1a", "ap-south-1b"]


```
VPC_Name =  "Test-VPC"
VPC_CIDR_block = "10.20.0.0/16"
Environment_Name = "DEV"
IGW_Name = "Test-IGW"
Public_RouteTable_Name = "Public-RT"
Private_RouteTable_Name = "Private-RT"
public_subnets_cidr = ["10.20.1.0/24", "10.20.2.0/24"]
public_subnets_Zone = ["ap-south-1a", "ap-south-1a"]
private_subnets_cidr = ["10.20.5.0/24", "10.20.6.0/24"]
private_subnets_Zone = ["ap-south-1b", "ap-south-1b"]
```
The code is ready to launch the resources after updating the variabls in **main.tf** file. 

You can run the below command to initialize the configuration before goint to apply the changes in **tf_vpc** directory.

> terraform init

Once succeed the above command, You can run the below apply command to launch the resouces in console. 

For this step, Please keep it ready IAM user access and secret key to apply the changes.   

> terraform apply


