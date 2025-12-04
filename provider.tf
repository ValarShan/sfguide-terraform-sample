terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}
/*
provider "snowflake" {
  user             = var.login_name
  password         = var.password   
  account          = var.account_name
  role             = "SYSADMIN"
}

terraform {
  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}
*/

locals {
  account_name      = "IF19845"
  private_key_path  = "~/.ssh/snowflake_tf_snow_key.p8"
}

provider "snowflake" {
  account_name      = local.account_name
  user              = "TERRAFORM_SVC"
  role              = "SYSADMIN"
  authenticator     = "JWT"   # updated for v0.74
  private_key       = file(local.private_key_path)
}
