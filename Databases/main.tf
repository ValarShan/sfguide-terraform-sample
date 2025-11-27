terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.71.0"
    }
  }
}

resource "snowflake_database" "env_raw_db" {
  name                        = format("%s%s",var.env,"_RAW_DB")
  data_retention_time_in_days = var.retention_days
}
