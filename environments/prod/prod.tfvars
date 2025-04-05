aws_access_key = "AKIAXEVXYTT7PLPXCYHH"
aws_secret_key = "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"
aws_region     = "us-east-1"



# VPC Configuration
cidr_block = "10.1.0.0/16"
vpc_name   = "prod-vpc"

# Public Subnets (across 3 availability zones for HA)
public_subnets = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]

# Private Subnets (across 3 availability zones)
private_subnets = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]

# Availability Zones (for high availability)
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

# Enable NAT Gateway (true to allow internet access for private subnets)
enable_nat_gateway = true

env = "prod"

