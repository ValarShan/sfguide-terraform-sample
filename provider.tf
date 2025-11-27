terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.71.0"
    }
  }
}

provider "snowflake" {
  profile = "SANDBOX_DEPLOYER"
}