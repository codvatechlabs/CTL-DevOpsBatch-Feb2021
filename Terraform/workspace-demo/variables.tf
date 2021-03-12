variable "instance_type" {
  type    = string
  default = {
     "default" = "t2.small"
     "dev"     = "t2.micro"
     "qa"      = "t2.medium"
  }
 
}

variable "ami_id" {
  type    = string
  default = {
     "default" = "ami-0eeb03e72075b9bcc"
     "dev"     = "ami-0eeb03e72075b9bcc"
     "qa"      = "ami-0eeb03e72075b9bcc"
  }
 
}

variable "volume_type" {
  type    = string
  default = "gp2"
}

variable "volume_size" {
  type    = string
  default = "10"
}

variable "ec2_key_name" {
  type    = string
  default = "tf-demo"
}

variable "subnet_name" {
  type    = string
  default = "subnet-79cd2912"
}

variable "tag_values" {
  type = map(any)
  default = {
    "Name"             = "ec2-tf-demo",
    "Created_By"       = "Terraform_Automation",
    "Application_Name" = "Terraform_Demo"
  }
}
