variable "env" { default = "TRAIL" }

variable "warehouse_size" { default = "XSMALL" }

variable "retention_days" { default = 1 }

variable "organization_name" {default ="if19845.eu-west-1"}

variable "private_key_path" {default ="~/.ssh/snowflake_tf_snow_key.p8"}

variable "user" {default ="ValarShan"}