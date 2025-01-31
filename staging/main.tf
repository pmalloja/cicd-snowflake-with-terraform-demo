#terraform {
 # required_providers {
  #  snowflake = {
   #   source  = "Snowflake-Labs/snowflake"
  #    version = "0.67.0"
 #   }
#  } 

  backend "s3" {
    bucket  = "snowgittfpoc"
    key     = "terraform-staging.tfstate"
    region  = "us-east-1"
    encrypt = true

    #role_arn  = "arn:aws:iam::225989372755:role/terraform-s3-backend-access-role"
  }
}

provider "snowflake" {
  username    = "tf-snow"
  account     = "nhvnbka-axb59546"
  role        = "TF_DEMO_READER"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 1
  database            = var.database
  env_name            = var.env_name
}