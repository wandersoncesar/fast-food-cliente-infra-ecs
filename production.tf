/*====
Variables used across all modules
======*/
locals {
  production_availability_zones = ["us-east-1a", "us-east-1b"]
  environment = "fast-food"
}

provider "aws" {
  region = var.region
}

module "ecs" {
  source             = "./ecs"
  environment        = local.environment
  vpc_id             = "vpc-0dbe202c10e297c7f"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-0732bdd5e5c7d90de", "subnet-0adfce1ac08c6b744"]
  public_subnet_ids  = ["subnet-05286f00a9d3bc744", "subnet-00f1022d6148a5cdb"]
  security_groups_ids = [
    "sg-0cf5b4df1eb4d47a1", "sg-0a85f98b4f246b4c1"
  ]
  database_endpoint = ""
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}