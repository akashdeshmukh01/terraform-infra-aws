output "eks_cluster_name" {
  description = "Name of the EKS Cluster"
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster endpoint"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_certificate_authority" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}

output "eks_cluster_oidc_issuer_url" {
  description = "OIDC issuer URL for the cluster"
  value       = aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

output "eks_cluster_security_group_id" {
  description = "EKS Cluster security group ID"
  value       = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

output "node_group_name" {
  description = "Name of the Node Group"
  value       = aws_eks_node_group.node_group.node_group_name
}

output "node_group_role_arn" {
  description = "ARN of the IAM role assigned to worker nodes"
  value       = aws_iam_role.eks_node_role.arn
}

output "cluster_role_arn" {
  description = "IAM role ARN assigned to the EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

output "vpc_private_subnet_ids" {
  description = "List of private subnet IDs used by the EKS cluster"
  value       = var.private_subnet_ids
}

output "alb_irsa_role_arn" {
  description = "IAM role ARN used by ALB controller service account"
  value       = aws_iam_role.alb_sa_role.arn
}

output "ecr_repository_url" {
  description = "ECR repo URL to push the Docker image"
  value       = aws_ecr_repository.nodejs_app.repository_url
}

output "eks_cluster_id" {
  value       = aws_eks_cluster.eks.id
  description = "EKS Cluster ID"
}

output "eks_node_group_name" {
  value       = aws_eks_node_group.node_group.node_group_name
  description = "EKS Node Group Name"
}

output "eks_node_group_arn" {
  value       = aws_eks_node_group.node_group.arn
  description = "EKS Node Group ARN"
}

output "eks_node_group_instance_types" {
  value       = aws_eks_node_group.node_group.instance_types
  description = "EKS Node Group Instance Types"
}

