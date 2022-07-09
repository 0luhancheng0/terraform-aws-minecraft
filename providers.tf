provider "aws" {
  alias  = "east"
  region = var.region
}
provider "template" {}
