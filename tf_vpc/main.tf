#This Module Will Creating the VPC with Public and Private Route Tables

module "module-vpc_creation" {
source = "../modules/module-vpc_creation/"
VPC_Name = "Eig-Test"
VPC_CIDR_block = "10.20.0.0/16"
Environment_Name = "Staging"
IGW_Name = "Eig-Test"
Public_RouteTable_Name = "Eig-Public-RT"
Private_RouteTable_Name = "Eig-Private-RT"
public_subnets_cidr = ["10.20.1.0/24", "10.20.2.0/24"]
public_subnets_Zone = ["ap-south-1a", "ap-south-1a"]
private_subnets_cidr = ["10.20.3.0/24", "10.20.4.0/24"]
private_subnets_Zone = ["ap-south-1b", "ap-south-1b"]
}
