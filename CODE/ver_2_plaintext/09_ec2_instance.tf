# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       Bastion Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                           EIP
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_eip" "bastion_eip" {
  vpc      = true
  instance = aws_instance.bastion.id
  tags     = { Name = "test-tf-vpc-ap-northeast-2a-bastion-eip" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       EC2 Instance
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "bastion" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
  security_groups   = ["${aws_security_group.bastion_sg.id}"]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.main_pub_a_subnet.id

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-bastion" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-bastion" }
}


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                        Service Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          WEB Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "web_a" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.web_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.web_pri_a_subnet.id

  user_data = <<-EOF
        #!/bin/bash
        sudo yum -y update
        sudo yum -y install httpd
        sudo echo "Test-for-3-tier-Terraform-configuration-2a" > /var/www/html/index.html
        sudo systemctl restart httpd
        --//--
        EOF

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-web" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-web" }
}
resource "aws_instance" "web_c" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2c"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.web_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.web_pri_c_subnet.id

  user_data = <<-EOF
        #!/bin/bash
        sudo yum -y update
        sudo yum -y install httpd
        sudo echo "Test-for-3-tier-Terraform-configuration-2a" > /var/www/html/index.html
        sudo systemctl restart httpd
        --//--
        EOF

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2c-web" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2c-web" }
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          WAS Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "was_a" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2a"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.was_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.was_pri_a_subnet.id

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2a-was" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2a-was" }
}
resource "aws_instance" "was_c" {
  ami               = "ami-0fd0765afb77bcca7"
  availability_zone = "ap-northeast-2c"
  instance_type     = "t2.micro"
  security_groups   = [aws_security_group.was_sg.id]
  key_name          = "tf_test_key"
  subnet_id         = aws_subnet.was_pri_c_subnet.id

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 8
    volume_type = "gp3"
    # delete_on_termination = true
    tags = { Name = "test-tf-ap-northeast-2c-was" }
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = { Name = "test-tf-ap-northeast-2c-was" }
}
