# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          WEB Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "web_a" {
  ami                    = data.aws_ami.amazon-linux-2.id
  availability_zone      = var.add_instance.web_a.availability_zone
  instance_type          = var.add_instance.web_a.instance_type
  key_name               = var.add_instance.web_a.key_name
  subnet_id              = data.terraform_remote_state.vpc.outputs.web_a_subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.web_sg_id]
  /* 
  user_data = <<-EOF
        #!/bin/bash
        sudo yum -y update
        sudo yum -y install httpd
        sudo echo "Test-for-3-tier-Terraform-configuration-2a" > /var/www/html/index.html
        sudo systemctl restart httpd
        --//--
        EOF
 */
  root_block_device {
    volume_size = var.add_instance.web_a.volume_size
    volume_type = var.add_instance.web_a.volume_type
    tags        = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-ebs", var.prefix, var.add_instance.web_a.availability_zone, var.add_instance.web_a.instance_name) }))
  }
  lifecycle { create_before_destroy = true }
  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s", var.prefix, var.add_instance.web_a.availability_zone, var.add_instance.web_a.instance_name) }))
}
resource "aws_instance" "web_c" {
  ami                    = data.aws_ami.amazon-linux-2.id
  availability_zone      = var.add_instance.web_c.availability_zone
  instance_type          = var.add_instance.web_c.instance_type
  key_name               = var.add_instance.web_c.key_name
  subnet_id              = data.terraform_remote_state.vpc.outputs.web_c_subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.web_sg_id]

  root_block_device {
    volume_size = var.add_instance.web_c.volume_size
    volume_type = var.add_instance.web_c.volume_type
    tags        = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-ebs", var.prefix, var.add_instance.web_c.availability_zone, var.add_instance.web_c.instance_name) }))
  }
  lifecycle { create_before_destroy = true }
  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-ebs", var.prefix, var.add_instance.web_c.availability_zone, var.add_instance.web_c.instance_name) }))
}

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                          WAS Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "was_a" {
  ami                    = data.aws_ami.amazon-linux-2.id
  availability_zone      = var.add_instance.was_a.availability_zone
  instance_type          = var.add_instance.was_a.instance_type
  key_name               = var.add_instance.was_a.key_name
  subnet_id              = data.terraform_remote_state.vpc.outputs.was_a_subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.was_sg_id]

  root_block_device {
    volume_size = var.add_instance.was_a.volume_size
    volume_type = var.add_instance.was_a.volume_type
    tags        = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-ebs", var.prefix, var.add_instance.was_a.availability_zone, var.add_instance.was_a.instance_name) }))
  }
  lifecycle { create_before_destroy = true }

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s", var.prefix, var.add_instance.was_a.availability_zone, var.add_instance.was_a.instance_name) }))
}
resource "aws_instance" "was_c" {
  ami                    = data.aws_ami.amazon-linux-2.id
  availability_zone      = var.add_instance.was_c.availability_zone
  instance_type          = var.add_instance.was_c.instance_type
  key_name               = var.add_instance.was_c.key_name
  subnet_id              = data.terraform_remote_state.vpc.outputs.was_c_subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.sg.outputs.was_sg_id]

  root_block_device {
    volume_size = var.add_instance.was_c.volume_size
    volume_type = var.add_instance.was_c.volume_type
    tags        = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-ebs", var.prefix, var.add_instance.was_c.availability_zone, var.add_instance.was_c.instance_name) }))
  }
  lifecycle { create_before_destroy = true }
  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s", var.prefix, var.add_instance.was_c.availability_zone, var.add_instance.was_c.instance_name) }))
}

