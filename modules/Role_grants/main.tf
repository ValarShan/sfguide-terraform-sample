terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}
/*
# Base Role Grants
resource "snowflake_role_grants" "env_raw_db_reader_role_grant" {
  role_name = var.env_raw_db_reader_role
  roles     = [var.env_raw_db_analyst_role]
}

resource "snowflake_role_grants" "env_raw_db_writer_role_grant" {
  role_name = var.env_raw_db_writer_role
  roles     = [var.env_raw_db_loader_role]
}
*/
# Old resource removed
removed {  
  from = snowflake_role_grants.env_raw_db_reader_role_grant  
  lifecycle {  
    destroy = false  
  }  
}
# New resource definition
# Grant a role to another role
resource "snowflake_roles_grants_to_role" "env_raw_db_reader_role_grant" {
  role_name = "\"${var.env_raw_db_reader_role}\""   # target role quoted
  roles     = ["\"${var.var.env_raw_db_analyst_role}\""] # granted role quoted
}

resource "snowflake_roles_grants_to_role" "env_raw_db_writer_role_grant" {
  role_name = "\"${var.env_raw_db_writer_role}\""   # target role quoted
  roles     = ["\"${var.var.env_raw_db_loader_role}\""] # granted role quoted
}