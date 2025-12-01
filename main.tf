/*
terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}


locals {
  organization_name = "pqfcspq"
  account_name      = "if19845"
  private_key_path  = "~/.ssh/snowflake_tf_snow_key.p8"
}

provider "snowflake" {
    organization_name = local.organization_name
    account_name      = local.account_name
    username          = "VALAR SHAN"
    user              = "DEPLOYER_SVC_VS"
    role              = "SYSADMIN"
    authenticator     = "SNOWFLAKE_JWT"
    private_key       = file(local.private_key_path)
}


*/

resource "snowflake_warehouse" "tf_warehouse_vs" {
  name                      = "TF_DEMO_WH_VS"
  warehouse_type            = "STANDARD"
  warehouse_size            = "XSMALL"
  max_cluster_count         = 1
  min_cluster_count         = 1
  auto_suspend              = 60
  auto_resume               = true
  enable_query_acceleration = false
  initially_suspended       = true
}

module "databases" {
  source         = "./modules/databases"
  env            = var.env
  retention_days = var.retention_days
}

module "roles" {
  source = "./modules/roles"
  env    = var.env
}

module "database_object_grants" {
  source                          = "./modules/database_object_grants"
  env                             = var.env
  env_raw_db                      = module.databases.env_raw_db.name
  env_raw_db_reader_role          = module.roles.env_raw_db_reader_role.name
  env_raw_db_writer_role          = module.roles.env_raw_db_writer_role.name
}

module "role_grants" {
  source                          = "./modules/role_grants"
  env                             = var.env
  env_raw_db_analyst_role         = module.roles.env_raw_db_analyst_role.name
  env_raw_db_loader_role          = module.roles.env_raw_db_loader_role.name
  env_raw_db_reader_role          = module.roles.env_raw_db_reader_role.name
  env_raw_db_writer_role          = module.roles.env_raw_db_writer_role.name
}