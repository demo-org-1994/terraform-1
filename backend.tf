terraform {
  backend "s3" {
    bucket       = "terraform-bucket-010"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}
