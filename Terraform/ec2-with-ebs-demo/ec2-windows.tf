/* Create new ec2 instance with below configurations*/

resource "aws_instance" "ec2_tf_windows" {
  ami           = "ami-006650c37d04e2c1e"
  instance_type = "t2.small"

  root_block_device {
    volume_type = "gp2"
    volume_size = "30"
    encrypted   = "true"
  }

  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = 3
    encrypted   = "true"
  }

  tags = {
    Name             = "ec2-tf-demo"
    Created_By       = "Terraform_Automation"
    Application_Name = "TF_Windows"

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


output "Private_IP_Windows" {
  value = aws_instance.ec2_tf_windows.private_ip
}

output "Public_IP_Windows" {
  value = aws_instance.ec2_tf_windows.public_ip
}
