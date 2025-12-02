resource "snowflake_warehouse" "tf_warehouse_vs" {
  name                      = "TF_DEMO_WH_VS"
  warehouse_type            = "STANDARD"
  warehouse_size            = "XSMALL"
  max_cluster_count         = 1
  min_cluster_count         = 1
  auto_suspend              = 60
  auto_resume               = true
  enable_query_acceleration = false
  initially_suspended       = true
}

module "databases" {
  source         = "./modules/databases"
  env            = var.env
  retention_days = var.retention_days
}

module "roles" {
  source = "./modules/roles"
  env    = var.env
}

module "database_objects" {
  source                          = "./modules/database_objects"
  env                             = var.env
  env_eraw_db                     = module.databases.env_raw_db.name
}

module "database_object_grants" {
  source                          = "./modules/database_object_grants"
  env                             = var.env
  env_raw_db                      = module.databases.env_raw_db.name
  env_raw_db_reader_role          = module.roles.env_raw_db_reader_role.name
  env_raw_db_writer_role          = module.roles.env_raw_db_writer_role.name
}

module "role_grants" {
  source                          = "./modules/role_grants"
  env                             = var.env
  env_raw_db_analyst_role         = module.roles.env_raw_db_analyst_role.name
  env_raw_db_loader_role          = module.roles.env_raw_db_loader_role.name
  env_raw_db_reader_role          = module.roles.env_raw_db_reader_role.name
  env_raw_db_writer_role          = module.roles.env_raw_db_writer_role.name
}