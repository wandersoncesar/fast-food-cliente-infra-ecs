/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment                   = "fast-food-cliente"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = local.environment
  vpc_id             = "vpc-0b36947dc0287234c"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-02de05750f4eef167", "subnet-0ad9cbbc1f738f784"]
  public_subnet_ids  = ["subnet-052bca6bb5af799b5", "subnet-0975413e62f9ae778"]
  security_groups_ids = [
    "sg-08d49485c0c3d3bef", "sg-045515a8381388922"
  ]
  database_endpoint = "fast-food-cliente-database.coojyhb5idp7.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}
