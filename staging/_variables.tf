variable "database" {
  type    = string
  default = "TERRAFORM_DEMO_STAGING1"
}

variable "env_name" {
  type    = string
  default = "STAGING"
  #default = "Stage"

}

variable "snowflake_private_key" {
  type        = string
  description = "Private key used to access Snowflake"
  sensitive   = true
}