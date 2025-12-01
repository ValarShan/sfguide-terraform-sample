terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}

provider "snowflake" {
  user             = var.user
  password         = var.password   
  account          = var.account
  role             = var.role
}
