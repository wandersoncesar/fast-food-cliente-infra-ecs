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
  vpc_id             = "vpc-09e1933376ac822fc"
  availability_zones = local.production_availability_zones
  repository_name    = "fast-food-app"
  subnets_ids        = ["subnet-090645056d7342986", "subnet-07b6cfbf2e49b00f2"]
  public_subnet_ids  = ["subnet-0b62a4b0594d25534", "subnet-0c05e5c4d2ce70d61"]
  security_groups_ids = [
    "sg-06c13a23aae21edee", "sg-0f236f3aa9383c1ef"
  ]
  database_endpoint = "fast-food-database.csxw4cuf3uvj.us-east-1.rds.amazonaws.com"
  database_name     = var.production_database_name
  database_username = var.production_database_username
  database_password = var.production_database_password
}