terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.71.0"
    }
  }
}

# DATABASE LEVEL GRANTS
## RAW_DB GRANTS
## "env_raw_db_reader_grant" - future we need to parametrised the envs too
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
