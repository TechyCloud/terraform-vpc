#Creating Security Groups
resource "aws_security_group" "sg" {
  count = "${length(var.sg_name)}"
  name        = "${element(var.sg_name,count.index)}"
  description = "Security Groups"
  vpc_id      = "${aws_vpc.VPC_ID.id}"
  tags = {
    Name = "${element(var.sg_name,count.index)}"
  }
}

#Creating VPC
resource "aws_vpc" "VPC_ID" {
 cidr_block = var.VPC_CIDR_block
 enable_dns_hostnames = true
 tags = {
   Name = var.VPC_Name
   Environment = var.Environment_Name
 }
}

#Create VPC Peering
resource "aws_vpc_peering_connection" "VPC-Peering" {
  peer_vpc_id   = var.peer_accepter_vpc_id
  vpc_id        = "${aws_vpc.VPC_ID.id}"
  auto_accept   = true

  tags = {
    Name = var.VPC_Peering_Name
  }

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

#Creating Public Subnets
resource "aws_subnet" "public" {
 count = "${length(var.public_subnets_cidr)}"
 vpc_id = "${aws_vpc.VPC_ID.id}"
 cidr_block = "${element(var.public_subnets_cidr,count.index)}"
 availability_zone = "${element(var.public_subnets_Zone,count.index)}"
 map_public_ip_on_launch = true
 tags = {
  Name = "${element(var.public_subnets_name,count.index)}"
 }
}

#Creating Private Subnets
resource "aws_subnet" "private" {
 count = "${length(var.private_subnets_cidr)}"
 vpc_id = "${aws_vpc.VPC_ID.id}"
 cidr_block = "${element(var.private_subnets_cidr,count.index)}"
 availability_zone = "${element(var.private_subnets_Zone,count.index)}" 
 map_public_ip_on_launch = true
 tags = {
  Name = "${element(var.private_subnets_name,count.index)}"
 }
}

#Creating Internet Gateway
resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.VPC_ID.id}"
  tags = {
    Name = var.IGW_Name
  }
}

#Creating Public Route Table 
resource "aws_default_route_table" "Route-table-IG-attached" {
  default_route_table_id = "${aws_vpc.VPC_ID.default_route_table_id}"

  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.IGW.id}"
 }
 tags = {
   Name = var.Public_RouteTable_Name
 }
}

#Route table association with public subnets
resource "aws_route_table_association" "Public_Subnets_Association" {
  count = "${length(var.public_subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.public.*.id,count.index)}"
  route_table_id = "${aws_default_route_table.Route-table-IG-attached.id}"
}

#Creating Elastic IP Address For NGW
resource "aws_eip" "ElasticIP_NGW" {}

#Creating Nat Gateway With EIP
resource "aws_nat_gateway" "NGW" {
  allocation_id = "${aws_eip.ElasticIP_NGW.id}"
  subnet_id     = "${aws_subnet.public[0].id}"
}

#Creating Private Route Table
resource "aws_route_table" "private-rt" {
 vpc_id = "${aws_vpc.VPC_ID.id}"

 route {
  cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_nat_gateway.NGW.id}"
 }
 tags = {
   Name = var.Private_RouteTable_Name
 }
}

#Route table association with Private Route Table
resource "aws_route_table_association" "Private_Subnet_Association" {
  count = "${length(var.private_subnets_cidr)}"
  subnet_id = "${element(aws_subnet.private.*.id,count.index)}"
  route_table_id = "${aws_route_table.private-rt.id}"
}

#Adding Peering ID to Route Table
resource "aws_route" "peer_id" {
  route_table_id            = "${aws_default_route_table.Route-table-IG-attached.id}"
  destination_cidr_block    = var.VPC_Accepter_CIDR
  vpc_peering_connection_id = "${aws_vpc_peering_connection.VPC-Peering.id}"
}

#Adding Peering ID to Private Route Table
resource "aws_route" "private_peer_id" {
  route_table_id            = "${aws_route_table.private-rt.id}"
  destination_cidr_block    = var.VPC_Accepter_CIDR
  vpc_peering_connection_id = "${aws_vpc_peering_connection.VPC-Peering.id}"
}
