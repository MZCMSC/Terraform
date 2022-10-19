resource "aws_eip" "this" {
  for_each = { for i in local.eip_instance : i.name => i }

  vpc      = each.value.eip
  instance = aws_instance.this[each.value.name].id

  tags = merge(
    var.tags,
    tomap({ Name = format(
      "%s-tf-%s-%s-eip",
      var.prefix,
      each.value.availability_zone,
      each.value.instance_name
    ) })
  )
}

# resource "aws_eip_association" "this" {
#   for_each = { for i in local.eip_instance : i.name => i }

#   allocation_id = aws_eip.this[each.value.name].id
#   instance_id   = aws_instance.this[each.value.name].id
# }

resource "aws_instance" "this" {

  for_each = { for i in local.all_instance : i.name => i }

  ami               = data.aws_ami.amazon-linux-2.id
  availability_zone = each.value.availability_zone
  instance_type     = each.value.instance_type
  key_name          = each.value.key_name

  subnet_id = data.terraform_remote_state.vpc.outputs.subnets[each.value.subnet_id].id

  vpc_security_group_ids = [
    data.terraform_remote_state.sg.outputs.security_groups[each.value.security_groups].id,
  ]


  root_block_device {
    volume_size = each.value.volume_size
    volume_type = each.value.volume_type

    tags = merge(
      var.tags,
      tomap({ Name = format(
        "%s-tf-%s-%s-ebs",
        var.prefix,
        each.value.availability_zone,
        each.value.instance_name
      ) })
    )
  }
  lifecycle { create_before_destroy = true }

  tags = merge(
    var.tags,
    tomap({ Name = format(
      "%s-tf-%s-%s",
      var.prefix,
      each.value.availability_zone,
      each.value.instance_name
    ) })
  )
}
