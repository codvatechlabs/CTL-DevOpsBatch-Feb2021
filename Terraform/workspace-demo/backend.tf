terraform {
  backend "s3" {
    bucket         = "devops-dynamodb-lock-tf"
    key            = "workspace-demo"
    region         = "ap-south-1"
    dynamodb_table = "terraform_state"
  }
}