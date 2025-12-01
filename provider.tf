terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}

provider "snowflake" {
  user             = var.login_name
  password         = var.password   
  account          = var.account_name
  #role             = var.role
}
