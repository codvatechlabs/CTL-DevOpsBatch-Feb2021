provider "aws" {
  region = "ap-south-1"
  #shared_credentials_file = "/Users/DELL/.aws/credentials"

}

terraform {
  backend "s3" {
    bucket = "ctl-devops-terraform-state"
    key    = "demo/app-stack"
    region = "ap-south-1"
    dynamodb_table = "terraform_state"
  }
}