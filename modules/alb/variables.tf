# VPC ID
variable "vpc_id" {
  description = "VPC ID where ALB will be deployed"
  type        = string
}

# Public Subnets
variable "public_subnet_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

# ALB Name
variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

# Enable HTTPS
variable "enable_https" {
  description = "Enable HTTPS listener"
  type        = bool
  default     = false
}

# SSL Certificate ARN (Optional, required if HTTPS is enabled)
variable "certificate_arn" {
  description = "ARN of the SSL certificate for HTTPS"
  type        = string
  default     = ""
}
