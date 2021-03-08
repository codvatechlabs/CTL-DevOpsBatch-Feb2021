/* Create new ec2 instance with below configurations*/

resource "aws_instance" "ec2_terraform" {
  //count         = 1
  ami           = "ami-0eeb03e72075b9bcc"
  instance_type = "t2.small"
  tags = {
    Name             = "ec2-tf-demo"
    Created_By       = "Terraform_Automation"
    Application_Name = "Terraform_Demo"

  }

  key_name               = "tf-demo"
  subnet_id              = "subnet-79cd2912"
  vpc_security_group_ids = ["sg-0753de48dc263cacb"]

  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Welcome to CodvaTech Labs Terraform Demo!!!, I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}

output "Private_IP" {
  value = aws_instance.ec2_terraform.private_ip
}

output "Public_IP" {
  value = aws_instance.ec2_terraform.public_ip
}