terraform {
  backend "s3" {
    bucket = "terra-bucket-23"
    key    = "go-app-pro/terraform.tfstate"
    region = "us-east-1"
  }
}