# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       Bastion Server
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                           EIP
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_eip" "bastion_eip" {
  vpc        = true
  instance   = aws_instance.bastion.id
  depends_on = [aws_instance.bastion]
  tags       = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-eip", var.prefix, var.az, var.instance_name)}))
}
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#                       EC2 Instance
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
resource "aws_instance" "bastion" {
  # ami               = "ami-0fd0765afb77bcca7"
  ami               = data.aws_ami.amazon-linux-2.id
  availability_zone = var.az
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = data.terraform_remote_state.vpc.outputs.pub_a_subnet_id
  security_groups   = [data.terraform_remote_state.sg.outputs.bastion_sg_id, ]

  root_block_device {
    # delete_on_termination = true
    # device_name = "/dev/xvda"
    volume_size = var.volume_size
    volume_type = var.volume_type
    tags        = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s-ebs", var.prefix, var.az, var.instance_name)}))
  }
  lifecycle { create_before_destroy = true }
  # disable_api_termination = true
  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-%s", var.prefix, var.az, var.instance_name)}))
}