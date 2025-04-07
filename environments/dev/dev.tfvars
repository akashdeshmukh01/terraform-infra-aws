aws_access_key = "AKIAXEVXYTT7PLPXCYHH"
aws_secret_key = "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"
aws_region     = "us-east-1"


# VPC Configuration
cidr_block = "10.0.0.0/16"
vpc_name   = "dev-vpc"

# Public Subnets (across 2 availability zones)
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

# Private Subnets (across 2 availability zones)
private_subnets = ["10.0.21.0/24", "10.0.22.0/24"]

# Availability Zones (modify based on your AWS region)
availability_zones = ["us-east-1a", "us-east-1b"]

# NAT Gateway Setting (true = create NAT gateway for private subnets)
enable_nat_gateway = true

//env = "dev"

env             = "dev"
node_group_name = "dev-node-group"
cluster_name    = "dev-cluster"