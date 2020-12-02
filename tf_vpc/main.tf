#This Module Will Creating the VPC with Public and Private Route Tables

module "module-vpc_creation" {
source = "../modules/module-vpc_creation/"

VPC_Name = "NonProd-VPC"
VPC_CIDR_block = "192.168.0.0/16"
Environment_Name = "UAT"
IGW_Name = "internet-gateway"
Public_RouteTable_Name = "route-table-IG-attached"
Private_RouteTable_Name = "private-RT"
public_subnets_cidr = ["192.168.1.0/26", "192.168.2.0/26"]
public_subnets_Zone = ["us-east-1a", "us-east-1b"]
private_subnets_cidr = ["192.168.5.0/26", "192.168.6.0/26", "192.168.7.0/26", "192.168.8.0/26", "192.168.10.0/26", "192.168.11.0/26"]
private_subnets_Zone = ["us-east-1c", "us-east-1c", "us-east-1d", "us-east-1d", "us-east-1e", "us-east-1f"]
public_subnets_name = ["NonProd-Public-01", "NonProd-Public-02"]
private_subnets_name = ["NonProd-APP-01", "NonProd-APP-02", "NonProd-APP-03", "NonProd-APP-04", "NonProd-DB-01", "NonProd-DB-02"]
}
