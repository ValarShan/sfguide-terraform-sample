terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.71.0"
    }
  }
}

# DB Level Roles

resource "snowflake_role" "env_raw_db_reader_role" {
  name = format("%s%s", var.env, "_RAW_DB_READER_ROLE")
}

resource "snowflake_role" "env_raw_db_writer_role" {
  name = format("%s%s", var.env, "_RAW_DB_WRITER_ROLE")
}