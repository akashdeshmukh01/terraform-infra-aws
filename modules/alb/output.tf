# Output ALB DNS Name
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

# Output ALB ARN
output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.alb.arn
}

# Output Target Group ARN
output "alb_target_group_arn" {
  description = "The ARN of the ALB target group"
  value       = aws_lb_target_group.alb_tg.arn
}
