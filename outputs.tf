# Reference outputs from the ALB module
output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "The DNS name of the ALB"
}

output "alb_arn" {
  value       = module.alb.alb_arn
  description = "The ARN of the ALB"
}

output "alb_target_group_arn" {
  value       = module.alb.alb_target_group_arn
  description = "The ARN of the ALB target group"
}

# Reference outputs from the EKS module
output "eks_cluster_id" {
  value       = module.eks.eks_cluster_id
  description = "The ID of the EKS cluster"
}

output "eks_cluster_name" {
  value       = module.eks.eks_cluster_name
  description = "The name of the EKS cluster"
}

output "eks_cluster_endpoint" {
  value       = module.eks.eks_cluster_endpoint
  description = "The endpoint for EKS cluster API"
}

output "eks_cluster_certificate_authority" {
  value       = module.eks.eks_cluster_certificate_authority
  description = "The certificate authority data for the cluster"
}

output "eks_node_group_name" {
  value       = module.eks.eks_node_group_name
  description = "The name of the EKS node group"
}

output "eks_node_group_arn" {
  value       = module.eks.eks_node_group_arn
  description = "The ARN of the EKS node group"
}

output "eks_node_group_instance_types" {
  value       = module.eks.eks_node_group_instance_types
  description = "The instance types of the EKS worker nodes"
}

output "eks_private_subnet_ids" {
  value       = module.eks.eks_private_subnet_ids
  description = "List of private subnet IDs used for EKS"
}

# Reference outputs from the VPC module
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "vpc_name" {
  value       = module.vpc.vpc_name
  description = "The name of the VPC"
}

output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "The CIDR block of the VPC"
}

output "vpc_subnet_ids" {
  value       = module.vpc.vpc_subnet_ids
  description = "The subnet IDs of the VPC"
}

output "vpc_security_group_ids" {
  value       = module.vpc.vpc_security_group_ids
  description = "The security group IDs associated with the VPC"
}

output "vpc_nat_gateway_ids" {
  value       = module.vpc.vpc_nat_gateway_ids
  description = "The NAT Gateway IDs in the VPC"
}

# Reference outputs from the ECR module
output "ecr_repo_url" {
  value       = aws_ecr_repository.nodejs_app.repository_url
  description = "The URL of the ECR repository for the Node.js app"
}

