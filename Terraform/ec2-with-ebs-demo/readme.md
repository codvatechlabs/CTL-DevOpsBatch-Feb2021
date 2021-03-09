
Ref Link : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#ebs-ephemeral-and-root-block-devices

Ref Link :https://www.terraform.io/docs/extend/best-practices/naming.html

Note : There is one more way by creating new volume and attach it to existing instance.
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment

resource "aws_ebs_volume" "demo" {
  availability_zone = "ap-south-1a"
  size              = 20

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.demo.id
  instance_id = aws_instance.ec2_terraform.id
}



