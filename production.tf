/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment                   = "fast-food"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = local.environment
  vpc_id             = "vpc-0b59352822e8ca1eb"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-006a26a695d5712df", "subnet-05acc92a5bb447e53"]
  public_subnet_ids  = ["subnet-0e802add561560eb9", "subnet-05baa8661c8531eee"]
  security_groups_ids = [
    "sg-0b5da126186147074", "sg-0362ae51d595ab5c0"
  ]
  database_endpoint = "fast-food-database.coojyhb5idp7.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}
