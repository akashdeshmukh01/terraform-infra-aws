# VPC ID
variable "vpc_id" {
  description = "VPC ID where EKS will be deployed"
  type        = string
}

# Subnets
variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

# EKS Cluster Name
variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

# Kubernetes Version
variable "kubernetes_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.27"
}

# Node Group
variable "node_group_name" {
  description = "EKS Node Group Name"
  type        = string
}

variable "instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

# Scaling Configuration
variable "desired_size" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
}

variable "env" {
  description = "Environment name (e.g., dev or prod)"
  type        = string
}