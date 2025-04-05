terraform {
  required_version = ">=1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


module "vpc" {
  source = "./modules/vpc"

  cidr_block         = var.cidr_block
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  enable_nat_gateway = var.enable_nat_gateway
  vpc_name           = var.vpc_name
}

module "eks" {
  source             = "./modules/eks"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids
  node_group_name    = var.node_group_name
  cluster_name       = var.cluster_name
  desired_size       = 2
  min_size           = 1
  max_size           = 3
  env                = var.env
}


module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids # ✅ Fix: Use `public_subnet_ids`
  alb_name          = "alb"
}

