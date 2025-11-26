terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

locals {
  organization_name = "pqfcspq"
  account_name      = "if19845"
  password  = "Git25"
}

provider "snowflake" {
    organization_name = local.organization_name
    account_name      = local.account_name
    user              = "DEPLOYER_SVC_VS"
    role              = "SYSADMIN"
    authenticator     = "externalbrowser"
    password          = local.password
}

resource "snowflake_database" "tf_db_vs" {
  name         = "TF_DEMO_DB_VS"
  is_transient = false
}

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
