terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}

/*
provider "snowflake" {
  user     = "VALARSHAN"
  password = "Christmas@2025"
  account  = "PQFCSPQ-IF19845"
  role     = "ACCOUNTADMIN"
}
*/

locals {
 # organization_name   = "PQFCSPQ"
  #account_name        = "IF19845"
  user                = "VALARSHAN" 
  password            = "Christmas@2025"   
  account             = "PQFCSPQ-IF19845"
  role                = "ACCOUNTADMIN"

}

provider "snowflake" {
 # organization_name = local.organization_name
 # account_name      = local.account_name
  user             = local.user
  password         = local.password   
  account          = local.account
  role             = local.role
}
