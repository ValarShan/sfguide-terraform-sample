terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
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
/*
#Below Version 0.93
# Old resource removed
removed {  
  from = snowflake_role_grants.env_raw_db_reader_role_grant 
  lifecycle {  
    destroy = false  
  }  
}

removed {  
  from = snowflake_role_grants.env_raw_db_writer_role_grant 
  lifecycle {  
    destroy = false  
  }  
}
# New resource definition
# Grant a role to another role

resource "snowflake_grant_privileges_to_account_role" "env_raw_db_reader_grant" {
  for_each    = tomap({
      env_raw_db_analyst_role-fiscal       = tomap({role = var.env_raw_db_analyst_role, schema = "fiscal"})
      env_raw_db_reader_role-fiscal        = tomap({role = var.env_raw_db_reader_role, schema = "fiscal"})
  })
  privileges = ["SELECT"]
  account_role_name  = "\"${each.value.role}\""
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = format("\"%s\".\"%s\"", var.env_raw_db, each.value.schema)
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "env_raw_db_writer_grant" {
  for_each    = tomap({
      env_raw_db_loader_role-fiscal       = tomap({role = var.env_raw_db_loader_role, schema = "fiscal"})
      env_raw_db_writer_role-fiscal        = tomap({role = var.env_raw_db_writer_role, schema = "fiscal"})
  })
  privileges = ["SELECT"]
  account_role_name  = "\"${each.value.role}\""
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = format("\"%s\".\"%s\"", var.env_raw_db, each.value.schema)
    }
  }
}
*/