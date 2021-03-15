module "ec-demo" {
  source        = "C:\\tfdemo\\ec2-base-module"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  tag_values   = var.tag_values
  ec2_key_name      = var.ec2_key_name
  subnet_name   = var.subnet_name

}


