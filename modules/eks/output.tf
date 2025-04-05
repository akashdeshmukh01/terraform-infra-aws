# Output EKS Cluster ID
output "eks_cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.eks.id
}

# Output EKS Cluster Name
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks.name
}

# Output EKS Cluster Endpoint
output "eks_cluster_endpoint" {
  description = "The endpoint for EKS cluster API"
  value       = aws_eks_cluster.eks.endpoint
}

# Output EKS Cluster Certificate Authority Data
output "eks_cluster_certificate_authority" {
  description = "The certificate authority data for the cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

# Output Node Group Name
output "eks_node_group_name" {
  description = "The name of the EKS node group"
  value       = aws_eks_node_group.node_group.node_group_name
}

# Output Node Group ARN
output "eks_node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.node_group.arn
}

# Output Node Group Instance Types
output "eks_node_group_instance_types" {
  description = "The instance types of the EKS worker nodes"
  value       = aws_eks_node_group.node_group.instance_types
}

# Output Private Subnet IDs (For other modules like ALB)
output "eks_private_subnet_ids" {
  description = "List of private subnet IDs used for EKS"
  value       = var.private_subnet_ids
}
