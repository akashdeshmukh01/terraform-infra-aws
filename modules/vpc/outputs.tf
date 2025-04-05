# Output the VPC ID
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.main.id
}

# Output Public Subnet IDs
output "public_subnet_ids" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public[*].id
}

# Output Private Subnet IDs
output "private_subnet_ids" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private[*].id
}

# Output Internet Gateway ID
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

# Output NAT Gateway ID (if enabled)
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = var.enable_nat_gateway ? aws_nat_gateway.nat[0].id : null
}

# Output Private Route Table ID
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

