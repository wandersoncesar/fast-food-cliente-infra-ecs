/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment                   = "cliente"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = local.environment
  vpc_id             = "vpc-056a4b3846658a575"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-057a66904568de481", "subnet-0a5b6562c2d837c73"]
  public_subnet_ids  = ["subnet-022c67825a30e9c88", "subnet-0f0b0e3f23171860c"]
  security_groups_ids = [
    "sg-0bca549f7061af96e", "sg-00f0f62fcd128eec2"
  ]
  database_endpoint = "api-cliente-database.coojyhb5idp7.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}
