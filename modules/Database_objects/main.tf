terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.93.0"
    }
  }
}

resource "snowflake_schema" "fiscal_schema" {
  database = var.env_raw_db
  name     = "fiscal"
}
