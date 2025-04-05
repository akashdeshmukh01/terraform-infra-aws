# VPC Outputs
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.nat_gateway_id
}

# EKS Outputs
output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = module.eks.eks_cluster_id
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.eks_cluster_name
}

output "eks_cluster_endpoint" {
  description = "The endpoint for EKS cluster API"
  value       = module.eks.eks_cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  description = "The certificate authority data for the cluster"
  value       = module.eks.eks_cluster_certificate_authority
}

output "eks_node_group_name" {
  description = "The name of the EKS node group"
  value       = module.eks.eks_node_group_name
}

output "eks_node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = module.eks.eks_node_group_arn
}

output "eks_node_group_instance_types" {
  description = "The instance types of the EKS worker nodes"
  value       = module.eks.eks_node_group_instance_types
}

# ECR Output from EKS Module
output "ecr_repo_url" {
  description = "URL of the ECR repository"
  value       = module.eks.ecr_repo_url
}

# ALB Outputs
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = module.alb.alb_arn
}

output "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = module.alb.alb_target_group_arn
}