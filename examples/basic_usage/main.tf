provider "aws" {
  alias   = "cert_read_role"
  profile = "certreadrole-role"
  region  = "us-east-1"
}

#-------------------------------------------------------------------------------
# Configure the module.
#-------------------------------------------------------------------------------
module "cert_role" {
  source = "../../"

  providers = {
    aws = aws.cert_read_role
  }

  account_ids = [
    "563873274798"
  ]
  cert_bucket_name = "cool-certificates"
  hostname         = "site.example.com"
}
