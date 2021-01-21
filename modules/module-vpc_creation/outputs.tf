output "VPC_ID" {
  value       = "${aws_vpc.VPC_ID.id}"
  description = "The ID of the VPC"
}
output "public" {
  value       = "${aws_subnet.public.*.id}"
  description = "The ID of the Public Subnets"
}
output "private" {
  value       = "${aws_subnet.private.*.id}"
  description = "The ID of the Private Subnets"
}
output "IGW" {
  value = "${aws_internet_gateway.IGW.id}"
  description = "Internet Gateway ID"
}
output "Route-table-IG-attached" {
  value = "${aws_default_route_table.Route-table-IG-attached.id}"
  description = "Public Route Table ID"
}
output "private-rt" {
  value = "${aws_route_table.private-rt.id}"
  description = "Private Route Table ID"
}
output "ElasticIP_NGW" {
  value = "${aws_eip.ElasticIP_NGW.id}"
  description = "Elastic IP Address"
}
