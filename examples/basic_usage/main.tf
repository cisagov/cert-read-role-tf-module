provider "aws" {
  region  = "us-east-1"
  profile = "certreadrole-role"
  alias   = "cert_read_role"
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
