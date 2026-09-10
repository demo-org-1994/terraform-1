terraform {
  backend "s3" {
    bucket       = "terraform-locking-092026"
    key          = "dev/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}