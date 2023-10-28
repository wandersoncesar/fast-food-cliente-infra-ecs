/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = "production"
  vpc_id             = "vpc-"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-", "subnet-"]
  public_subnet_ids  = ["subnet-", "subnet-"]
  security_groups_ids = [
    "sg-", "sg-"
  ]
  database_endpoint = ""
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}