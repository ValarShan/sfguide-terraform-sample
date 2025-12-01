terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.74.0"
    }
  }
}

# Base Role Grants
resource "snowflake_role_grants" "env_raw_db_reader_role_grant" {
  role_name = var.env_raw_db_reader_role
  roles     = [var.env_raw_db_analyst_role]
}

resource "snowflake_role_grants" "env_raw_db_writer_role_grant" {
  role_name = var.env_raw_db_writer_role
  roles     = [var.env_raw_db_loader_role]
}

