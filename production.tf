/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment                   = "api-cliente"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = local.environment
  vpc_id             = "vpc-03599603e61e08c59"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-06ecf9a08b3b0f332", "subnet-0a828c9554d1127c0"]
  public_subnet_ids  = ["subnet-0ed872fb39094e628", "subnet-055ecb6a3ba4588f9"]
  security_groups_ids = [
    "sg-0a0e28979fbac271e", "sg-086fed6229b34bf5a"
  ]
  database_endpoint = "api-cliente-database.coojyhb5idp7.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}
