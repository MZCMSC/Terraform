resource "aws_lb" "this" {
  for_each           = { for i in local.all_alb : i.name => i }
  name               = format("%s-tf-%s-alb", var.prefix, each.value.name)
  internal           = each.value.internal
  load_balancer_type = each.value.load_balancer_type
  subnets = [
    data.terraform_remote_state.vpc.outputs.subnets[each.value.subnet_cidr_a].id,
    data.terraform_remote_state.vpc.outputs.subnets[each.value.subnet_cidr_c].id

    # data.terraform_remote_state.vpc.outputs.subnets[[each.value.subnet_cidr]].id,
  ]
  security_groups = [
    data.terraform_remote_state.sg.outputs.security_groups[each.value.name].id
    # data.terraform_remote_state.sg.outputs.security_groups[each.value.alb_name[*]].id
  ]

  tags = merge(var.tags, tomap({ Name = format("%s-tf-%s-alb", var.prefix, each.value.alb_name) }))
}