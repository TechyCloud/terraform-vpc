#This Module Will Creating the VPC with Public and Private Route Tables

module "module-vpc_creation" {
source = "../modules/module-vpc_creation/"

VPC_Name = "PreProd-VPC"
VPC_CIDR_block = "192.168.0.0/16"
Environment_Name = "PreProd"
IGW_Name = "PreProd-internet-gateway"
Public_RouteTable_Name = "PreProd-route-table-IG-attached"
Private_RouteTable_Name = "PreProd-private-RT"
public_subnets_cidr = ["192.168.1.0/26", "192.168.2.0/26"]
public_subnets_Zone = ["us-east-1a", "us-east-1b"]
private_subnets_cidr = ["192.168.5.0/26", "192.168.6.0/26", "192.168.7.0/26", "192.168.8.0/26", "192.168.10.0/26", "192.168.11.0/26"]
private_subnets_Zone = ["us-east-1c", "us-east-1c", "us-east-1d", "us-east-1d", "us-east-1e", "us-east-1f"]
public_subnets_name = ["PreProd-Public-Subnet-01", "PreProd-Public-Subnet-02"]
private_subnets_name = ["PreProd-APP-Subnet-01", "PreProd-APP-Subnet-02", "PreProd-APP-Subnet-03", "PreProd-APP-Subnet-04", "PreProd-DB-Subnet-01", "PreProd-DB-Subnet-02"]
peer_accepter_vpc_id = "vpc-5e6a6824"
VPC_Peering_Name = "Peering-Defauld-PerProd"
VPC_Accepter_CIDR = "172.31.0.0/16"
sg_name = ["Eig-SG", "PCI-SG"]
}
