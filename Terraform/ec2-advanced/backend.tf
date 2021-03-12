terraform {
  backend "s3" {
    bucket         = "devops-dynamodb-lock-tf"
    key            = "ec2-ad/infra-stack"
    region         = "ap-south-1"
    dynamodb_table = "terraform_state"
  }
}