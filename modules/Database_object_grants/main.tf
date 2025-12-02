terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}

#DATABASE LEVEL GRANTS
## RAW_DB GRANTS
## "env_raw_db_reader_grant" - future we need to parametrised the envs too

/*commented out below resources for 0.93 upgrade
resource "snowflake_database_grant" "env_raw_db_reader_grant" {
  database_name          = var.env_raw_db
  privilege              = "USAGE"
  with_grant_option      = false
  enable_multiple_grants = true
  roles                  = [var.env_raw_db_reader_role]
}
resource "snowflake_database_grant" "env_raw_db_writer_grant" {
  database_name          = var.env_raw_db
  privilege              = "ALL PRIVILEGES"
  with_grant_option      = false
  enable_multiple_grants = true
  roles                  = [var.env_raw_db_writer_role]
}
*/
# Old resource removed
removed {  
  from = snowflake_database_grant.env_raw_db_reader_grant  
  lifecycle {  
    destroy = false  
  }  
}
# New resource definition
resource "snowflake_grant_privileges_to_account_role" "env_raw_db_reader_grant" {  
  account_role_name    = "\"${var.env_raw_db_reader_role}\""  
  privileges           = ["USAGE"]  
  with_grant_option    = false  
  on_account_object {  
    object_name = "\"${var.env_raw_db}\""  
    object_type = "DATABASE"  
  }  
}

resource "snowflake_grant_privileges_to_account_role" "env_raw_db_writer_grant" {  
  account_role_name    = "\"${var.env_raw_db_writer_role}\""  
  privileges           = ["USAGE"]  
  with_grant_option    = false  
  on_account_object {  
    object_name = "\"${var.env_raw_db}\""  
    object_type = "DATABASE"  
  }  
}
  